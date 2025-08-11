import SDL3

public class SDLApp {
    /// https://wiki.libsdl.org/SDL3/SDL_Init 
    public init?(f: SDL_InitFlags) {
        if !SDL_Init(f) {
            return nil
        }
    }

    /// https://wiki.libsdl.org/SDL3/SDL_Quit 
    deinit {
        SDL_Quit()
    }

    /// https://wiki.libsdl.org/SDL3/SDL_Delay 
    public func delay(ms: UInt32) {
        SDL_Delay(ms)
    }

    /// https://wiki.libsdl.org/SDL3/SDL_GetError 
    public func getError() -> String? {
        guard let ptr = SDL_GetError() else {
            return nil
        }
        let str = String(cString: ptr)
        return str.isEmpty ? nil : str
    }

    /// https://wiki.libsdl.org/SDL3/SDL_ClearError 
    public func clearError() {
        SDL_ClearError()
    }
}
