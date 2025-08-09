import SDL3
import SDL3.IMG

/// https://wiki.libsdl.org/SDL3/SDL_Texture
class SDLTexture {
    let ptr: UnsafeMutablePointer<SDL_Texture>

    private init(_ ptr: UnsafeMutablePointer<SDL_Texture>) {
        self.ptr = ptr
    }

    /** https://wiki.libsdl.org/SDL3/SDL_DestroyTexture */
    deinit {
        print("drop texture \(String(describing: ptr))")
        SDL_DestroyTexture(ptr)
    }

    /** https://wiki.libsdl.org/SDL3/SDL_CreateTexture */
    static func createTexture(
        _ renderer: SDLRenderer,
        format: SDL_PixelFormat,
        access: SDL_TextureAccess,
        width: Int32,
        height: Int32
    ) -> SDLTexture? {
        guard let texturePtr = SDL_CreateTexture(renderer.ptr, format, access, width, height) else {
            let errPtr = SDL_GetError()
            print("SDL Error: \(String(describing: String(cString: errPtr!)))")
            return nil
        }
        return SDLTexture(texturePtr)
    }

    /** https://wiki.libsdl.org/SDL3_image/IMG_LoadTexture */
    static func loadTexture(_ renderer: SDLRenderer, _ path: String) -> SDLTexture? {
        guard let texturePtr = IMG_LoadTexture(renderer.ptr, path) else {
            let errPtr = SDL_GetError()
            print("SDL Error: \(String(describing: String(cString: errPtr!)))")
            return nil
        }
        return SDLTexture(texturePtr)
    }

    /** https://wiki.libsdl.org/SDL3/SDL_SetTextureScaleMode */
    func setScaleMode() -> Bool {
        SDL_SetTextureScaleMode(ptr, SDL_SCALEMODE_PIXELART)
    }
}

// https://wiki.libsdl.org/SDL3/SDL_GetTextureScaleMode
