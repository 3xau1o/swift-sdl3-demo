import SDL3
import SDL3.TTF

public class SDLRendererTextEngine: SDLTextEngine {
    public let ptr: OpaquePointer
    public let ttf: STTF
    public let renderer: SDLRenderer

    /// https://wiki.libsdl.org/SDL3_ttf/TTF_CreateRendererTextEngine
    public init?(t: STTF, r: SDLRenderer) {
        guard let ptr = TTF_CreateRendererTextEngine(r.ptr) else {
            return nil
        }
        self.ptr = ptr
        self.ttf = t
        self.renderer = r
    }

    /// https://wiki.libsdl.org/SDL3_ttf/TTF_DestroyRendererTextEngine
    deinit {
        TTF_DestroyRendererTextEngine(ptr)
    }
}
