import SDL

class SDLRenderer {
    let ptr: OpaquePointer
    init(ptrWin: OpaquePointer?) {
        print("create renderer")
        ptr = SDL_CreateRenderer(ptrWin, nil)
    }
    deinit {
        print("drop renderer \(String(describing: ptr))")
        SDL_DestroyRenderer(ptr)
    }
    func clear() -> Bool {
        SDL.SDL_RenderClear(ptr)
    }
    func present() -> Bool {
        SDL.SDL_RenderPresent(ptr)
    }
    func setDrawColor(c: inout RGBA) -> Bool {
        SDL.SDL_SetRenderDrawColor(ptr, c.r, c.g, c.b, c.a)
    }
    func drawLine(x1: Float, y1: Float, x2: Float, y2: Float) -> Bool {
        SDL.SDL_RenderLine(ptr, x1, y1, x2, y2)
    }
    func drawRect(rect: inout SDL_FRect) -> Bool {
        SDL.SDL_RenderRect(ptr, &rect)
    }
}

struct RGBA {
    let r: Uint8
    let g: Uint8
    let b: Uint8
    let a: Uint8
}
