import SDL3
import SDL3.TTF

public class SDLTTFText {
    internal let ptr: UnsafeMutablePointer<TTF_Text>
    public let textEngine: SDLTextEngine
    public let font: SDLTTFFont

    /// https://wiki.libsdl.org/SDL3_ttf/TTF_CreateText
    public init?(te: SDLTextEngine, font: SDLTTFFont, text: String) {
        let cstr = text.cString(using: .utf8)!
        guard
            let ptr = TTF_CreateText(
                te.ptr,
                font.ptr,
                // todo safer string
                cstr.withUnsafeBufferPointer({ $0.baseAddress! }),
                Int(cstr.count - 1)
            )
        else {
            return nil
        }
        self.ptr = ptr
        self.textEngine = te
        self.font = font
    }

    /** https://wiki.libsdl.org/SDL3_ttf/TTF_DestroyText */
    deinit {
        TTF_DestroyText(ptr)
    }

    /// https://wiki.libsdl.org/SDL3_ttf/TTF_DrawRendererText
    public func draw(x: Float, y: Float) -> Bool {
        TTF_DrawRendererText(ptr, x, y)
    }
}
