import Foundation
import CSDL

let title = "zig_sdl"
let w: Int32 = 640
let h: Int32 = 480

SDL_Init(SDL_INIT_VIDEO)
let window = SDL_CreateWindow(title, w, h, 0)

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
    SDL_Delay(16)
}
