import SDL3

typealias FRect = SDL_FRect
typealias Color = SDL_Color

struct SDL_FLine {
    let a: SDL_FPoint
    let b: SDL_FPoint
}