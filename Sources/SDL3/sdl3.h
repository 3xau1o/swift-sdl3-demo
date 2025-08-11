#include "SDL3/SDL.h"
#include <stdbool.h>

#include "sdl3-video.h"

// always set either _Nonnull or _Nullable clang attributes to pointers parameters
// for swift C import https://github.com/swiftlang/swift/blob/main/docs/HowSwiftImportsCAPIs.md#nullable-and-non-nullable-pointers

// https://wiki.libsdl.org/SDL3/SDL_RenderRect 
bool SDL_RenderRect(
    SDL_Renderer _Nonnull *renderer,
    const SDL_FRect _Nullable *rect);

// https://wiki.libsdl.org/SDL3/SDL_RenderTexture 
bool SDL_RenderTexture(
    SDL_Renderer _Nonnull *renderer,
    SDL_Texture _Nonnull *texture,
    const SDL_FRect _Nullable *srcrect,
    const SDL_FRect _Nullable *dstrect);

// https://wiki.libsdl.org/SDL3/SDL_RenderClear 
bool SDL_RenderClear(SDL_Renderer _Nonnull *renderer);

// https://wiki.libsdl.org/SDL3/SDL_RenderPresent 
bool SDL_RenderPresent(SDL_Renderer _Nonnull *renderer);

// https://wiki.libsdl.org/SDL3/SDL_CreateRenderer 
SDL_Renderer *SDL_CreateRenderer(
    SDL_Window _Nonnull *window,
    const char _Nullable *name);

// https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColor 
bool SDL_SetRenderDrawColor(
    SDL_Renderer _Nonnull *renderer,
    Uint8 r,
    Uint8 g,
    Uint8 b,
    Uint8 a);

// https://wiki.libsdl.org/SDL3/SDL_RenderLine 
bool SDL_RenderLine(
    SDL_Renderer _Nonnull *renderer,
    float x1,
    float y1,
    float x2,
    float y2);

// https://wiki.libsdl.org/SDL3/SDL_SetTextureScaleMode
bool SDL_SetTextureScaleMode(
    SDL_Texture _Nonnull *texture,
    SDL_ScaleMode scaleMode);

// https://wiki.libsdl.org/SDL3/SDL_GetTextureScaleMode
bool SDL_GetTextureScaleMode(
    SDL_Texture _Nonnull
        *texture,
    SDL_ScaleMode *scaleMode);

// https://wiki.libsdl.org/SDL3/SDL_GetError 
const char *SDL_GetError(void);

// https://wiki.libsdl.org/SDL3/SDL_ClearError 
bool SDL_ClearError(void);
