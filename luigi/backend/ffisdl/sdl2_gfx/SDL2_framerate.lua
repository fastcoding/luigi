local ffi = require("ffi")
ffi.cdef[[
typedef struct {
 Uint32 framecount;
 float rateticks;
 Uint32 baseticks;
 Uint32 lastticks;
 Uint32 rate;
} FPSmanager;
void SDL_initFramerate(FPSmanager * manager);
int SDL_setFramerate(FPSmanager * manager, Uint32 rate);
int SDL_getFramerate(FPSmanager * manager);
int SDL_getFramecount(FPSmanager * manager);
Uint32 SDL_framerateDelay(FPSmanager * manager);
]]
