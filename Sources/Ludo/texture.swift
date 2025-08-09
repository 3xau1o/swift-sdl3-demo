import SDL3
import SDL3.IMG

/// https://wiki.libsdl.org/SDL3/SDL_Texture
class SDLTexture {
    let ptr: UnsafeMutablePointer<SDL_Texture>
    /** https://wiki.libsdl.org/SDL3/SDL_CreateTexture */
    private init(_ ptr: UnsafeMutablePointer<SDL_Texture>) {
        print("create texture")
        self.ptr = ptr
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

    /** https://wiki.libsdl.org/SDL3/SDL_DestroyTexture */
    deinit {
        print("drop texture \(String(describing: ptr))")
        SDL_DestroyTexture(ptr)
    }
    /** https://wiki.libsdl.org/SDL3/SDL_SetTextureScaleMode */
    func setScaleMode() -> Bool {
        SDL_SetTextureScaleMode(ptr, SDL_SCALEMODE_PIXELART)
    }
}

// https://wiki.libsdl.org/SDL3/SDL_GetTextureScaleMode
