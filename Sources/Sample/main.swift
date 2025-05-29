import SDL

let title = "zig_sdl"
let w: Int32 = 640
let h: Int32 = 480

SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS)
let window = SDL_CreateWindow(title, w, h, 0)

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

        _ = renderer.setDrawColor(c: &NIGRA)
        _ = renderer.clear()
        _ = renderer.setDrawColor(c: &BLANKA)

        _ = renderer.drawLine(x1: 0, y1: 0, x2: 50, y2: 50)
        var rect = SDL_FRect(x: 50, y: 50, w: 100, h: 100)
        _ = renderer.drawRect(rect: &rect)

        _ = renderer.present()
        SDL_Delay(1)
    }
}

rendi(window: window)

SDL_DestroyWindow(window)
SDL_Quit()
