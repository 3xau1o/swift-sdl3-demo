import SDL3

/// https://wiki.libsdl.org/SDL3/SDL_WindowFlags
private struct WindowFlags {
    static let SDL_WINDOW_FULLSCREEN: Uint64 = 0x0000_0000_0000_0001
    /**< window is in fullscreen mode */
    static let SDL_WINDOW_OPENGL: Uint64 = 0x0000_0000_0000_0002
    /**< window usable with OpenGL context */
    static let SDL_WINDOW_OCCLUDED: Uint64 = 0x0000_0000_0000_0004
    /**< window is o    /ccluded */
    static let SDL_WINDOW_HIDDEN: Uint64 = 0x0000_0000_0000_0008
    /**< window is neither mapped onto the desktop nor shown in the taskbar/dock/window list; SDL_ShowWindow() is required for it to become visible */
    static let SDL_WINDOW_BORDERLESS: Uint64 = 0x0000_0000_0000_0010
    /**< no window decoration */
    static let SDL_WINDOW_RESIZABLE: Uint64 = 0x0000_0000_0000_0020
    /**< window can be resized */
    static let SDL_WINDOW_MINIMIZED: Uint64 = 0x0000_0000_0000_0040
    /**< window is minimized */
    static let SDL_WINDOW_MAXIMIZED: Uint64 = 0x0000_0000_0000_0080
    /**< window is maximized */
    static let SDL_WINDOW_MOUSE_GRABBED: Uint64 = 0x0000_0000_0000_0100
    /**< window has grabbed mouse input */
    static let SDL_WINDOW_INPUT_FOCUS: Uint64 = 0x0000_0000_0000_0200
    /**< window has input focus */
    static let SDL_WINDOW_MOUSE_FOCUS: Uint64 = 0x0000_0000_0000_0400
    /**< window has mouse focus */
    static let SDL_WINDOW_EXTERNAL: Uint64 = 0x0000_0000_0000_0800
    /**< window not created by SDL */
    static let SDL_WINDOW_MODAL: Uint64 = 0x0000_0000_0000_1000
    /**< window is modal */
    static let SDL_WINDOW_HIGH_PIXEL_DENSITY: Uint64 = 0x0000_0000_0000_2000
    /**< window uses high pixel density back buffer if possible */
    static let SDL_WINDOW_MOUSE_CAPTURE: Uint64 = 0x0000_0000_0000_4000
    /**< window has mouse captured (unrelated to MOUSE_GRABBED) */
    static let SDL_WINDOW_MOUSE_RELATIVE_MODE: Uint64 = 0x0000_0000_0000_8000
    /**< window has relative mode enabled */
    static let SDL_WINDOW_ALWAYS_ON_TOP: Uint64 = 0x0000_0000_0001_0000
    /**< window should always be above others */
    static let SDL_WINDOW_UTILITY: Uint64 = 0x0000_0000_0002_0000
    /**< window should be treated as a utility window, not showing in the task bar and window list */
    static let SDL_WINDOW_TOOLTIP: Uint64 = 0x0000_0000_0004_0000
    /**< window should be treated as a tooltip and does not get mouse or keyboard focus, requires a parent window */
    static let SDL_WINDOW_POPUP_MENU: Uint64 = 0x0000_0000_0008_0000
    /**< window should be treated as a popup menu, requires a parent window */
    static let SDL_WINDOW_KEYBOARD_GRABBED: Uint64 = 0x0000_0000_0010_0000
    /**< window has grabbed keyboard input */
    static let SDL_WINDOW_VULKAN: Uint64 = 0x0000_0000_1000_0000
    /**< window usable for Vulkan surface */
    static let SDL_WINDOW_METAL: Uint64 = 0x0000_0000_2000_0000
    /**< window usable for Metal view */
    static let SDL_WINDOW_TRANSPARENT: Uint64 = 0x0000_0000_4000_0000
    /**< window with transparent buffer */
    static let SDL_WINDOW_NOT_FOCUSABLE: Uint64 = 0x0000_0000_8000_0000
    /**< window should not be focusable */
}

struct RektoSisoI32 {
    var w: Int32
    var h: Int32
}

class SDLWindow {
    let ptr: OpaquePointer

    /** https://wiki.libsdl.org/SDL3/SDL_CreateWindow */
    init(t: String, w: Int32, h: Int32) {
        ptr = SDL_CreateWindow(t, w, h, WindowFlags.SDL_WINDOW_MAXIMIZED)
    }

    /** https://wiki.libsdl.org/SDL3/SDL_DestroyWindow */
    deinit {
        print("des win")
        SDL_DestroyWindow(ptr)
    }

    /** https://wiki.libsdl.org/SDL3/SDL_GetWindowSize */
    func getSize() -> RektoSisoI32 {
        var siso: RektoSisoI32 = RektoSisoI32(w: 0, h: 0)
        SDL_GetWindowSize(ptr, &siso.w, &siso.h)
        return siso
    }
}
