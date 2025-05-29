import SDL

let title = "zig_sdl"
let w: Int32 = 640
let h: Int32 = 480

SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS)
let window = SDL_CreateWindow(title, w, h, 0)

class SDLRenderer {
    let ptr: OpaquePointer
    init(ptrWin: OpaquePointer?) {
        print("create renderer")
        ptr = SDL_CreateRenderer(ptrWin, nil)
    }
    deinit {
        print("drop renderer \(String(describing: ptr))")
        SDL_DestroyRenderer(ptr)
    }
    func clear() -> Bool {
        SDL.SDL_RenderClear(ptr)
    }
    func present() -> Bool {
        SDL.SDL_RenderPresent(ptr)
    }
    func setDrawColor(c: inout RGBA) -> Bool {
        SDL.SDL_SetRenderDrawColor(ptr, c.r, c.g, c.b, c.a)
    }
    func drawLine(x1: Float, y1: Float, x2: Float, y2: Float) -> Bool {
        SDL.SDL_RenderLine(ptr, x1, y1, x2, y2)
    }
    func drawRect(rect: inout SDL_FRect) -> Bool {
        SDL.SDL_RenderRect(ptr, &rect)
    }
}

struct RGBA {
    let r: Uint8
    let g: Uint8
    let b: Uint8
    let a: Uint8
}

func rendi(window: OpaquePointer?) {
    var BLANKA = RGBA(r: 255, g: 255, b: 255, a: 255)

    var NIGRA = RGBA(r: 0, g: 0, b: 0, a: 0)
    let renderer: SDLRenderer = SDLRenderer(ptrWin: window)
    var quit = false
    var event = SDL_Event()
    while !quit {
        while SDL_PollEvent(&event) {
            switch event.type {
            case SDL_EVENT_QUIT.rawValue:
                quit = true
                // print quit
                print("test")
            default:
                break
            }
        }

        renderer.setDrawColor(c: &NIGRA)
        renderer.clear()
        renderer.setDrawColor(c: &BLANKA)

        // SDL_RenderLine(renderer, 0, 0, 50, 50)
        renderer.drawLine(x1: 0, y1: 0, x2: 50, y2: 50)
        var rect = SDL_FRect(x: 50, y: 50, w: 100, h: 100)
        renderer.drawRect(rect: &rect)

        renderer.present()
        SDL_Delay(1)
    }
}

rendi(window: window)

SDL_DestroyWindow(window)
SDL_Quit()
