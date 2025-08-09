import Foundation
import SDL3
import SDL3.IMG
import SDL3.TTF

let BLANKA = RGBA(r: 255, g: 255, b: 255, a: 255)
let NIGRA = RGBA(r: 0, g: 0, b: 0, a: 0)

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

    let rectSrc: FRect = (x: 50, y: 50, w: 100, h: 100)

    let urlBBishop = Bundle.module.url(forResource: "b_bishop", withExtension: "png")

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

        _ = renderer.setDrawColor(c: NIGRA)
        _ = renderer.clear()
        _ = renderer.setDrawColor(c: BLANKA)
        _ = renderer.drawLine(x1: 0, y1: 0, x2: 50, y2: 50)
        _ = renderer.renderRect(rectSrc)
        _ = renderer.renderRect(rectSrc)
        _ = renderer.renderTexture(texture, nil, rectSrc)
        _ = renderer.present()

        SDL_Delay(1)
    }
    SDL_Quit()
}
