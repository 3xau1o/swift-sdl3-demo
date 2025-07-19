import SDL3

class SDLRenderer {
    let ptr: OpaquePointer

    /** https://wiki.libsdl.org/SDL3/SDL_CreateRenderer */
    init(win: SDLWindow) {
        ptr = SDL_CreateRenderer(win.ptr, nil)
    }
    deinit {
        print("drop renderer \(String(describing: ptr))")
        SDL_DestroyRenderer(ptr)
    }
    func clear() -> Bool {
        SDL_RenderClear(ptr)
    }
    func present() -> Bool {
        SDL_RenderPresent(ptr)
    }
    func setDrawColor(c: borrowing RGBA) -> Bool {
        SDL_SetRenderDrawColor(ptr, c.r, c.g, c.b, c.a)
    }
    func drawLine(x1: Float, y1: Float, x2: Float, y2: Float) -> Bool {
        SDL_RenderLine(ptr, x1, y1, x2, y2)
    }

    /** https://wiki.libsdl.org/SDL3/SDL_RenderRect */
    private func renderRect(
        _ ptrRend: OpaquePointer,
        _ rect: inout SDL_FRect?
    ) -> Bool {
        SDL_RenderRect(
            ptrRend,
            rect.map { withUnsafePointer(to: $0) { $0 } }
        )
    }

    func renderRect(_ frect: FRect? = nil) -> Bool {
        var sdlRect: SDL_FRect? = frect.map { frectToSDL($0) }
        return self.renderRect(ptr, &sdlRect)
    }

    /** https://wiki.libsdl.org/SDL3/SDL_RenderTexture */
    private func renderTexture(
        _ texture: SDLTexture,
        _ rectSrc: inout SDL_FRect?,
        _ rectDest: inout SDL_FRect,
    ) -> Bool {
        SDL_RenderTexture(
            ptr,
            texture.ptr,
            rectSrc.map({ withUnsafePointer(to: $0) { $0 } }),
            &rectDest
        )
    }

    func renderTexture(
        _ texture: SDLTexture,
        _ rectSrc: FRect?,
        _ rectDest: FRect,
    ) -> Bool {
        var sdlRectSrc: SDL_FRect? = rectSrc.map { frectToSDL($0) }
        var sdlRectDest: SDL_FRect = frectToSDL(rectDest)
        return self.renderTexture(texture, &sdlRectSrc, &sdlRectDest)
    }

    /** https://wiki.libsdl.org/SDL3/SDL_SetDefaultTextureScaleMode */
}
