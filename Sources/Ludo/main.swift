import Foundation
import SDL3
import SDL3.IMG
import SDL3.TTF

let BLANKA = SDL_Color(r: 255, g: 255, b: 255, a: 255)
let NIGRA = SDL_Color(r: 0, g: 0, b: 0, a: 0)

rendi()

func rendi() {
    let w: Int32 = 640
    let h: Int32 = 480
    SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS)

    let window = SDLWindow(t: "SDL", w: w, h: h)
    let renderer: SDLRenderer = SDLRenderer(win: window)

    let txt = TTF_CreateRendererTextEngine(renderer.ptr)
    print("TTF_CreateRendererTextEngine returned pointer: \(String(describing: txt))")

    var quit = false
    var event = SDL_Event()

    let rectSrc = SDL_FRect(x: 50, y: 50, w: 100, h: 100)

    let urlBBishop = Bundle.module.url(forResource: "b_bishop", withExtension: "png")

    let line = SDL_FLine(
        a: SDL_FPoint(x: 0, y: 0),
        b: SDL_FPoint(x: 50, y: 50)
    )

    if urlBBishop == nil {
        return
    }

    guard let texture = SDLTexture.loadTexture(renderer, urlBBishop!.path) else {
        return
    }
    _ = texture.setScaleMode()

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

        _ = renderer.SetRenderDrawColor(c: NIGRA)
        _ = renderer.clear()
        _ = renderer.SetRenderDrawColor(c: BLANKA)
        _ = renderer.drawLine(l: line)
        _ = renderer.renderRect(r: rectSrc)
        _ = renderer.renderRect(r: rectSrc)
        // Example: render multiple rects
        let rects: [SDL_FRect] = [
            SDL_FRect(x: 10, y: 10, w: 30, h: 30),
            SDL_FRect(x: 100, y: 100, w: 40, h: 40)
        ]
        _ = renderer.renderRects(rs: rects)
        _ = renderer.renderTexture(t: texture, rs: nil, rd: rectSrc)
        _ = renderer.present()

        SDL_Delay(1)
    }
    SDL_Quit()
}
