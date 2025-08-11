import Foundation
import SDL3

/// https://wiki.libsdl.org/SDL3/SDL_Texture
public class SDLTexture {
    internal let ptr: UnsafeMutablePointer<SDL_Texture>
    public let renderer: SDLRenderer

    public init(
        r: SDLRenderer,
        ptr: UnsafeMutablePointer<SDL_Texture>
    ) {
        self.renderer = r
        self.ptr = ptr
    }

    /// https://wiki.libsdl.org/SDL3/SDL_DestroyTexture 
    deinit {
        SDL_DestroyTexture(ptr)
    }

    /// https://wiki.libsdl.org/SDL3/SDL_SetTextureScaleMode 
    public func setScaleMode(_ sm: SDL_ScaleMode) -> Bool {
        SDL_SetTextureScaleMode(ptr, sm)
    }

    /// https://wiki.libsdl.org/SDL3/SDL_GetTextureScaleMode 
    public func getScaleMode() -> SDL_ScaleMode {
        var sm: SDL_ScaleMode = SDL_SCALEMODE_INVALID
        SDL_GetTextureScaleMode(ptr, &sm)
        return sm
    }
}

/// from SDL3 Core
extension SDLTexture {
    /// https://wiki.libsdl.org/SDL3/SDL_CreateTexture 
    public static func createTexture(
        r: SDLRenderer,
        f: SDL_PixelFormat,
        a: SDL_TextureAccess,
        w: Int32,
        h: Int32
    ) -> SDLTexture? {
        guard let ptr = SDL_CreateTexture(r.ptr, f, a, w, h) else {
            let errPtr = SDL_GetError()
            print("SDL Error: \(String(describing: String(cString: errPtr!)))")
            return nil
        }
        return SDLTexture(r: r, ptr: ptr)
    }
}
