import Foundation
import SDL3
import SDL3.TTF

/// https://wiki.libsdl.org/SDL3_ttf/TTF_Font
public class SDLTTFFont {
    internal let ptr: OpaquePointer

    /** https://wiki.libsdl.org/SDL3_ttf/TTF_OpenFont */
    public init?(url: URL, size: Float) {
        // todo string safety?
        let cstr = url.path.cString(using: .utf8)!
        guard
            let ptr = TTF_OpenFont(
                cstr.withUnsafeBufferPointer({ $0.baseAddress! }),
                size
            )
        else {
            return nil
        }
        self.ptr = ptr
    }

    /** https://wiki.libsdl.org/SDL3_ttf/TTF_CloseFont */
    deinit {
        TTF_CloseFont(ptr)
    }
}
