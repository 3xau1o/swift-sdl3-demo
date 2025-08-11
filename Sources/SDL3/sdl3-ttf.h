#include "SDL3_ttf/SDL_ttf.h"

// https://wiki.libsdl.org/SDL3_ttf/TTF_Init
bool TTF_Init(void);

// https://wiki.libsdl.org/SDL3_ttf/TTF_Quit
void TTF_Quit(void);

// https://wiki.libsdl.org/SDL3_ttf/TTF_CreateRendererTextEngine
TTF_TextEngine *TTF_CreateRendererTextEngine(SDL_Renderer _Nonnull *renderer);

// https://wiki.libsdl.org/SDL3_ttf/TTF_DestroyRendererTextEngine
void TTF_DestroyRendererTextEngine(TTF_TextEngine _Nonnull *engine);

// https://wiki.libsdl.org/SDL3_ttf/TTF_CreateText
TTF_Text *TTF_CreateText(
    TTF_TextEngine _Nonnull *engine,
    TTF_Font _Nonnull *font,
    const char _Nonnull *text,
    size_t length);

// https://wiki.libsdl.org/SDL3_ttf/TTF_DestroyText
void TTF_DestroyText(TTF_Text _Nonnull *text);

// https://wiki.libsdl.org/SDL3_ttf/TTF_DrawRendererText
bool TTF_DrawRendererText(TTF_Text _Nonnull *text, float x, float y);

// https://wiki.libsdl.org/SDL3_ttf/TTF_OpenFont
TTF_Font *TTF_OpenFont(const char _Nonnull *file, float ptsize);

// https://wiki.libsdl.org/SDL3_ttf/TTF_CloseFont
void TTF_CloseFont(TTF_Font _Nonnull *font);
