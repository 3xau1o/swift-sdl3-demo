#include "SDL3/SDL.h"
#include <stdbool.h>

/** https://wiki.libsdl.org/SDL3/SDL_RenderRect */
bool SDL_RenderRect(SDL_Renderer _Nonnull *renderer,
                    const SDL_FRect _Nullable *rect);

/** https://wiki.libsdl.org/SDL3/SDL_RenderTexture */
bool SDL_RenderTexture(SDL_Renderer _Nonnull *renderer,
                       SDL_Texture _Nonnull *texture,
                       const SDL_FRect _Nullable *srcrect,
                       const SDL_FRect _Nullable *dstrect);

/** https://wiki.libsdl.org/SDL3/SDL_CreateRenderer */
SDL_Renderer *SDL_CreateRenderer(SDL_Window _Nonnull *window,
                                 const char _Nullable *name);
