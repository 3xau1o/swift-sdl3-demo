import SDL3

public class SDLRenderer {
    internal let ptr: OpaquePointer
    public let window: SDLWindow

    // todo param name
    /// https://wiki.libsdl.org/SDL3/SDL_CreateRenderer 
    public init?(win: SDLWindow) {
        guard let _ptr = SDL_CreateRenderer(win.ptr, nil) else {
            return nil
        }
        self.window = win
        ptr = _ptr
    }

    /// https://wiki.libsdl.org/SDL3/SDL_DestroyRenderer 
    deinit {
        SDL_DestroyRenderer(ptr)
    }

    /// https://wiki.libsdl.org/SDL3/SDL_RenderClear 
    public func clear() -> Bool {
        SDL_RenderClear(ptr)
    }

    /// https://wiki.libsdl.org/SDL3/SDL_RenderPresent 
    public func present() -> Bool {
        SDL_RenderPresent(ptr)
    }

    /// https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColor 
    public func SetRenderDrawColor(r: Uint8, g: Uint8, b: Uint8, a: Uint8) -> Bool {
        SDL_SetRenderDrawColor(ptr, r, g, b, a)
    }

    /// https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColor 
    public func SetRenderDrawColor(c: borrowing SDL_Color) -> Bool {
        SDL_SetRenderDrawColor(ptr, c.r, c.g, c.b, c.a)
    }

    /// https://wiki.libsdl.org/SDL3/SDL_RenderLine 
    public func drawLine(x1: Float, y1: Float, x2: Float, y2: Float) -> Bool {
        SDL_RenderLine(ptr, x1, y1, x2, y2)
    }

    /// https://wiki.libsdl.org/SDL3/SDL_RenderDrawLine 
    public func drawLine(l: borrowing SDL_FLine) -> Bool {
        SDL_RenderLine(
            ptr,
            l.a.x, l.a.y,
            l.b.x, l.b.y
        )
    }

    /// https://wiki.libsdl.org/SDL3/SDL_RenderRect 
    public func renderRect(r: borrowing SDL_FRect?) -> Bool {
        SDL_RenderRect(
            ptr,
            r.map { withUnsafePointer(to: $0) { $0 } }
        )
    }

    // todo header
    /// https://wiki.libsdl.org/SDL3/SDL_RenderRects 
    public func renderRects(rs: borrowing [SDL_FRect]) -> Bool {
        rs.withUnsafeBufferPointer { bufPtr in
            SDL_RenderRects(ptr, bufPtr.baseAddress, Int32(bufPtr.count))
        }
    }

    /// https://wiki.libsdl.org/SDL3/SDL_RenderTexture 
    public func renderTexture(
        t: SDLTexture,
        rs: borrowing SDL_FRect?,
        rd: borrowing SDL_FRect?,
    ) -> Bool {
        SDL_RenderTexture(
            ptr,
            t.ptr,
            rs.map { withUnsafePointer(to: $0) { $0 } },
            rd.map { withUnsafePointer(to: $0) { $0 } }
        )
    }

    /// https://wiki.libsdl.org/SDL3/SDL_SetDefaultTextureScaleMode 
}
