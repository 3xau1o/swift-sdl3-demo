import SDL3

typealias FRect = (
    x: Float,
    y: Float,
    w: Float,
    h: Float
)

@inline(__always)
func frectToSDL(_ frect: borrowing FRect) -> SDL_FRect {
    SDL_FRect(x: frect.x, y: frect.y, w: frect.w, h: frect.h)
}