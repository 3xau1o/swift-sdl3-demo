import Foundation
import SDL3
import SDL3.IMG

/// from SDL3 IMG
extension SDLTexture {
    /// https://wiki.libsdl.org/SDL3_image/IMG_LoadTexture
    public static func loadTexture(r: SDLRenderer, url: URL) -> SDLTexture? {
        guard let ptr = IMG_LoadTexture(r.ptr, url.path) else {
            let errPtr = SDL_GetError()
            print("SDL Error: \(String(describing: String(cString: errPtr!)))")
            return nil
        }
        return SDLTexture(r: r, ptr: ptr)
    }
}
