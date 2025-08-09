#include "SDL3/SDL.h"
#include <stdbool.h>

// always set either _Nonnull or _Nullable clang attributes to pointers parameters
// for swift C import https://github.com/swiftlang/swift/blob/main/docs/HowSwiftImportsCAPIs.md#nullable-and-non-nullable-pointers

/** https://wiki.libsdl.org/SDL3/SDL_RenderRect */
bool SDL_RenderRect(
    SDL_Renderer _Nonnull *renderer,
    const SDL_FRect _Nullable *rect);

/** https://wiki.libsdl.org/SDL3/SDL_RenderTexture */
bool SDL_RenderTexture(
    SDL_Renderer _Nonnull *renderer,
    SDL_Texture _Nonnull *texture,
    const SDL_FRect _Nullable *srcrect,
    const SDL_FRect _Nullable *dstrect);

/** https://wiki.libsdl.org/SDL3/SDL_CreateRenderer */
SDL_Renderer *SDL_CreateRenderer(
    SDL_Window _Nonnull *window,
    const char _Nullable *name);

bool SDL_SetRenderDrawColor(
    SDL_Renderer _Nonnull *renderer,
    Uint8 r,
    Uint8 g,
    Uint8 b,
    Uint8 a);

int SDL_RenderDrawLine(
    SDL_Renderer _Nonnull *renderer,
    int x1,
    int y1,
    int x2,
    int y2);