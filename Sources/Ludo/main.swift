import Foundation
import SDL3
import SDL3.IMG
import SDL3.TTF


let w: Int32 = 640
let h: Int32 = 480
let BLANKA = SDL_Color(r: 255, g: 255, b: 255, a: 255)
let NIGRA = SDL_Color(r: 0, g: 0, b: 0, a: 0)

rendi()

func rendi() {
    let renderer = SDLApp(f: SDL_INIT_VIDEO | SDL_INIT_EVENTS)
        .flatMap { app in
            SDLWindow(a: app, t: "SDL", w: w, h: h)
        }.flatMap { window in
            SDLRenderer(win: window)
        }

    guard let renderer = renderer else {
        print("Failed to create SDLRenderer")
        return
    }

    guard let ttf = STTF() else {
        print("Failed to initialize SDL_ttf")
        return
    }

    guard let txtEng = SDLRendererTextEngine(t: ttf, r: renderer) else {
        print("Failed to create SDLRendererTextEngine")
        return
    }
    print("TTF_CreateRendererTextEngine returned pointer: \(txtEng)")

    // open monogram.ttf font resource
    guard let fontURL = Bundle.module.url(forResource: "monogram", withExtension: "ttf") else {
        print("Failed to locate monogram.ttf in module resources")
        return
    }

    guard let font = SDLTTFFont(url: fontURL, size: 24) else {
        print("Failed to open font at \(fontURL.path)")
        return
    }

    // font text "CHASU LUDO"
    guard let text = SDLTTFText(te: txtEng, font: font, text: "CHASU LUDO") else {
        print("Failed to create text")
        return
    }

    var quit = false
    var event = SDL_Event()

    let rectSrc = SDL_FRect(x: 50, y: 50, w: 100, h: 100)

    guard let urlBBishop = Bundle.module.url(forResource: "b_bishop", withExtension: "png") else {
        return
    }

    let line = SDL_FLine(
        a: SDL_FPoint(x: 0, y: 0),
        b: SDL_FPoint(x: 50, y: 50)
    )

    guard let texture = SDLTexture.loadTexture(r: renderer, url: urlBBishop) else {
        return
    }
    _ = texture.setScaleMode(SDL_SCALEMODE_PIXELART)

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
            SDL_FRect(x: 100, y: 100, w: 40, h: 40),
        ]
        _ = renderer.renderRects(rs: rects)
        _ = renderer.renderTexture(t: texture, rs: nil, rd: rectSrc)
        _ = text.draw(x: 55, y: 20)
        _ = renderer.present()

        SDL_Delay(1)
    }

    SDL_Quit()
}
