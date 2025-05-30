import SDL

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
}
