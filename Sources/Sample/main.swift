import CSDL

let title = "zig_sdl"
let w: Int32 = 640
let h: Int32 = 480

SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS)
let window = SDL_CreateWindow(title, w, h, 0)

let renderer = SDL_CreateRenderer(window, nil)

var quit = false
var event = SDL_Event()

struct RGBA {
    let r: Uint8
    let g: Uint8
    let b: Uint8
    let a: Uint8
}

let BLANKA = RGBA(r: 255, g: 255, b: 255, a: 255)

let NIGRA = RGBA(r: 0, g: 0, b: 0, a: 0)

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

    SDL_SetRenderDrawColor(renderer, NIGRA.r, NIGRA.g, NIGRA.b, NIGRA.a)
    SDL_RenderClear(renderer)

    SDL_SetRenderDrawColor(renderer, BLANKA.r, BLANKA.g, BLANKA.b, BLANKA.a)
    SDL_RenderLine(renderer, 0, 0, 50, 50)
    var rect = SDL_FRect(x: 50, y: 50, w: 100, h: 100)
    SDL_RenderRect(renderer, &rect)

    SDL_RenderPresent(renderer)
    SDL_Delay(1)
}

SDL_DestroyRenderer(renderer)
SDL_DestroyWindow(window)
SDL_Quit()
