import SDL3

class SDLRenderer {
    let ptr: OpaquePointer
    init(win: SDLWindow!) {
        print("create renderer")
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

    func drawRect(_ frect: borrowing FRect?) -> Bool {
        var sdlRect = frect.map { frectToSDL($0) }
        return _SDL_Renderer.drawRect(ptr, &sdlRect)
    }

    func drawTexture(
        _ texture: borrowing SDLTexture,
        _ rectSrc: borrowing FRect?,
        _ rectDest: inout FRect,
    ) -> Bool {
        var sdlRectDest = frectToSDL(rectDest)
        var sdlRectSrc: SDL_FRect? = nil  //rectSrc.map { frectToSDL($0) }

        return true
    }
    // https://wiki.libsdl.org/SDL3/SDL_SetDefaultTextureScaleMode

}
