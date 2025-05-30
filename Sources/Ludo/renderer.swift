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
    func drawRect(rect: borrowing SDL_FRect) -> Bool {
        return withUnsafePointer(to: rect) { ptrRect in
            SDL_RenderRect(ptr, ptrRect)
        }
    }
    func drawTexture(
        _ texture: SDLTexture, _ srcrect: borrowing SDL_FRect?, _ dstrect: borrowing SDL_FRect
    ) -> Bool {
        // to extenion generic methods
        let ptrDstRect = withUnsafePointer(to: dstrect) { $0 }
        let ptrSrcRect: UnsafePointer<SDL_FRect>? = srcrect.map { withUnsafePointer(to: $0) { $0 } }
        return SDL_RenderTexture(ptr, texture.ptr, ptrSrcRect, ptrDstRect)
    }
}

// https://wiki.libsdl.org/SDL3/SDL_SetDefaultTextureScaleMode
