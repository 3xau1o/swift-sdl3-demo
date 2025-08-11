import SDL3

typealias FRect = SDL_FRect
typealias Color = SDL_Color

public struct SDL_FLine {
    let a: SDL_FPoint
    let b: SDL_FPoint

    public init(a: SDL_FPoint, b: SDL_FPoint) {
        self.a = a
        self.b = b
    }
}
