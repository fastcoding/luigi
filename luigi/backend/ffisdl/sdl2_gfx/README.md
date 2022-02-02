# luajit-sdl2_gfx-ffi #

A [LuaJIT](http://luajit.org/luajit.html) binding to [SDL2_gfx](http://cms.ferzkopp.net/index.php/software/13-sdl-gfx).

## Installation ##

Install SDL2_gfx so that its shared library `libSDL2_gfx.{so,dll,..}` is available via library path, e.g., `/usr/lib/libSDL2_gfx.so`.

Install the [sdl2-ffi](https://github.com/torch/sdl2-ffi.git) LuaJIT [SDL2](http://www.libsdl.org/) bindings.

Clone luajit-sdl2_gfx-ffi into the `sdl2_gfx` subdirectory via
```sh
git clone https://github.com/stormc/luajit-sdl2_gfx-ffi sdl2_gfx
```

## Usage ##

```lua
local SDLGFX = require("sdl2_gfx")
SDLGFX.gfxPrimitivesSetFontRotation(3)
...
```

SDL2_gfx's functions are available via the table returned by `require("sdl2_gfx")`.
Note that the rotozoomer and image filter functions do not have the `SDL_` prefix.

Although the binding is quite complete, not all functions have been tested thoroughly.
Please feel encouraged to request pulls :)
