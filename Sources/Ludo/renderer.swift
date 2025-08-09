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

    /** https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColor */
    func SetRenderDrawColor(r: Uint8, g: Uint8, b: Uint8, a: Uint8) -> Bool {
        SDL_SetRenderDrawColor(ptr, r, g, b, a)
    }

    /** https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColor */
    func SetRenderDrawColor(c: borrowing SDL_Color) -> Bool {
        SDL_SetRenderDrawColor(ptr, c.r, c.g, c.b, c.a)
    }

    /** https://wiki.libsdl.org/SDL2/SDL_RenderDrawLine */
    func drawLine(x1: Float, y1: Float, x2: Float, y2: Float) -> Bool {
        SDL_RenderLine(ptr, x1, y1, x2, y2)
    }

    /** https://wiki.libsdl.org/SDL2/SDL_RenderDrawLine */
    func drawLine(l: borrowing SDL_FLine) -> Bool {
        SDL_RenderLine(
            ptr,
            l.a.x, l.a.y,
            l.b.x, l.b.y
        )
    }

    /** https://wiki.libsdl.org/SDL3/SDL_RenderRect */
    func renderRect(_ rect: borrowing SDL_FRect?) -> Bool {
        SDL_RenderRect(
            ptr,
            rect.map { withUnsafePointer(to: $0) { $0 } }
        )
    }

    /** https://wiki.libsdl.org/SDL3/SDL_RenderTexture */
    func renderTexture(
        _ texture: SDLTexture,
        _ rectSrc: borrowing SDL_FRect?,
        _ rectDest: borrowing SDL_FRect,
    ) -> Bool {
        SDL_RenderTexture(
            ptr,
            texture.ptr,
            rectSrc.map({ withUnsafePointer(to: $0) { $0 } }),
            withUnsafePointer(to: rectDest) { $0 }
        )
    }

    /** https://wiki.libsdl.org/SDL3/SDL_SetDefaultTextureScaleMode */
}
