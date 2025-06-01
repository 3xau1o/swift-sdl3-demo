import SDL3
import SDL3_IMG

/// https://wiki.libsdl.org/SDL3/SDL_Texture
class SDLTexture {
    let ptr: UnsafeMutablePointer<SDL_Texture>
    /** https://wiki.libsdl.org/SDL3/SDL_CreateTexture */
    init(_ renderer: SDLRenderer, _ path: String) {
        print("create txture")
        ptr = IMG_LoadTexture(renderer.ptr, path)
        let errPtr = SDL_GetError()
        print("SDL Error: \(String(describing: String(cString:errPtr!)))")
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
