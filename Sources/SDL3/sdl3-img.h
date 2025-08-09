#include "SDL3_image/SDL_image.h"

/** https://wiki.libsdl.org/SDL3/SDL_CreateTexture */
SDL_Texture *SDL_CreateTexture(SDL_Renderer _Nonnull *renderer, SDL_PixelFormat format, SDL_TextureAccess access, int w, int h);

/** https://wiki.libsdl.org/SDL3_image/IMG_LoadTexture */
SDL_Texture *IMG_LoadTexture(SDL_Renderer _Nonnull *renderer, const char _Nonnull *file);
