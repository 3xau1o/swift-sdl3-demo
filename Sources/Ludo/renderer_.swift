import SDL3

// https://github.com/swiftlang/swift/blob/main/docs/HowSwiftImportsCAPIs.md#pointers-to-data
class _SDL_Renderer {
    /**
    * https://wiki.libsdl.org/SDL3/SDL_RenderRect
    */
    static func drawRect(
        _ ptrRend: OpaquePointer,
        _ rect: inout SDL_FRect?
    ) -> Bool {
        SDL_RenderRect(
            ptrRend,
            rect.map { withUnsafePointer(to: $0) { $0 } }
        )
    }

    /** https://wiki.libsdl.org/SDL3/SDL_RenderTexture */
    static func drawTexture(
        _ ptrRend: OpaquePointer,
        _ texture: SDLTexture,
        _ rectSrc: inout SDL_FRect?,
        _ rectDest: inout SDL_FRect
    ) -> Bool {
        SDL_RenderTexture(
            ptrRend,
            texture.ptr,
            rectSrc.map { withUnsafePointer(to: $0) { $0 } },
            withUnsafePointer(to: rectDest) { $0 }
        )
    }
}
