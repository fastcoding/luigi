local ROOT = (...):gsub('[^.]*$', '')

local ffi = require('ffi')
local C = assert(ffi.load('SDL2_gfx'),'unable to load gfx')
local sdl2_gfx = { C = C }

ffi.cdef[[
typedef int8_t Sint8;
typedef uint8_t Uint8;
typedef int16_t Sint16;
typedef uint16_t Uint16;
typedef int32_t Sint32;
typedef uint32_t Uint32;
typedef int64_t Sint64;
typedef uint64_t Uint64;
]]

require(ROOT .. "SDL2_gfxPrimitives")
require(ROOT .. "SDL2_framerate")
require(ROOT .. "SDL2_rotozoom")
require(ROOT .. "SDL2_imageFilter")

-- SDL2_gfx - Graphics Primitives
sdl2_gfx.SDL2_GFXPRIMITIVES_MAJOR = 1
sdl2_gfx.SDL2_GFXPRIMITIVES_MINOR = 0
sdl2_gfx.SDL2_GFXPRIMITIVES_MICRO = 1

sdl2_gfx["pixelColor"] = C["pixelColor"]
sdl2_gfx["pixelRGBA"] = C["pixelRGBA"]
sdl2_gfx["hlineColor"] = C["hlineColor"]
sdl2_gfx["hlineRGBA"] = C["hlineRGBA"]
sdl2_gfx["vlineColor"] = C["vlineColor"]
sdl2_gfx["vlineRGBA"] = C["vlineRGBA"]
sdl2_gfx["rectangleColor"] = C["rectangleColor"]
sdl2_gfx["rectangleRGBA"] = C["rectangleRGBA"]
sdl2_gfx["roundedRectangleColor"] = C["roundedRectangleColor"]
sdl2_gfx["roundedRectangleRGBA"] = C["roundedRectangleRGBA"]
sdl2_gfx["boxColor"] = C["boxColor"]
sdl2_gfx["boxRGBA"] = C["boxRGBA"]
sdl2_gfx["roundedBoxColor"] = C["roundedBoxColor"]
sdl2_gfx["roundedBoxRGBA"] = C["roundedBoxRGBA"]
sdl2_gfx["lineColor"] = C["lineColor"]
sdl2_gfx["lineRGBA"] = C["lineRGBA"]
sdl2_gfx["aalineColor"] = C["aalineColor"]
sdl2_gfx["aalineRGBA"] = C["aalineRGBA"]
sdl2_gfx["thickLineColor"] = C["thickLineColor"]
sdl2_gfx["thickLineRGBA"] = C["thickLineRGBA"]
sdl2_gfx["circleColor"] = C["circleColor"]
sdl2_gfx["circleRGBA"] = C["circleRGBA"]
sdl2_gfx["arcColor"] = C["arcColor"]
sdl2_gfx["arcRGBA"] = C["arcRGBA"]
sdl2_gfx["aacircleColor"] = C["aacircleColor"]
sdl2_gfx["aacircleRGBA"] = C["aacircleRGBA"]
sdl2_gfx["filledCircleColor"] = C["filledCircleColor"]
sdl2_gfx["filledCircleRGBA"] = C["filledCircleRGBA"]
sdl2_gfx["ellipseColor"] = C["ellipseColor"]
sdl2_gfx["ellipseRGBA"] = C["ellipseRGBA"]
sdl2_gfx["aaellipseColor"] = C["aaellipseColor"]
sdl2_gfx["aaellipseRGBA"] = C["aaellipseRGBA"]
sdl2_gfx["filledEllipseColor"] = C["filledEllipseColor"]
sdl2_gfx["filledEllipseRGBA"] = C["filledEllipseRGBA"]
sdl2_gfx["pieColor"] = C["pieColor"]
sdl2_gfx["pieRGBA"] = C["pieRGBA"]
sdl2_gfx["filledPieColor"] = C["filledPieColor"]
sdl2_gfx["filledPieRGBA"] = C["filledPieRGBA"]
sdl2_gfx["trigonColor"] = C["trigonColor"]
sdl2_gfx["trigonRGBA"] = C["trigonRGBA"]
sdl2_gfx["aatrigonColor"] = C["aatrigonColor"]
sdl2_gfx["aatrigonRGBA"] = C["aatrigonRGBA"]
sdl2_gfx["filledTrigonColor"] = C["filledTrigonColor"]
sdl2_gfx["filledTrigonRGBA"] = C["filledTrigonRGBA"]
sdl2_gfx["polygonColor"] = C["polygonColor"]
sdl2_gfx["polygonRGBA"] = C["polygonRGBA"]
sdl2_gfx["aapolygonColor"] = C["aapolygonColor"]
sdl2_gfx["aapolygonRGBA"] = C["aapolygonRGBA"]
sdl2_gfx["filledPolygonColor"] = C["filledPolygonColor"]
sdl2_gfx["filledPolygonRGBA"] = C["filledPolygonRGBA"]
sdl2_gfx["texturedPolygon"] = C["texturedPolygon"]
sdl2_gfx["bezierColor"] = C["bezierColor"]
sdl2_gfx["bezierRGBA"] = C["bezierRGBA"]
sdl2_gfx["gfxPrimitivesSetFont"] = C["gfxPrimitivesSetFont"]
sdl2_gfx["gfxPrimitivesSetFontRotation"] = C["gfxPrimitivesSetFontRotation"]
sdl2_gfx["characterColor"] = C["characterColor"]
sdl2_gfx["characterRGBA"] = C["characterRGBA"]
sdl2_gfx["stringColor"] = C["stringColor"]
sdl2_gfx["stringRGBA"] = C["stringRGBA"]

-- SDL2_gfx - Framerate Control
sdl2_gfx.FPS_UPPER_LIMIT = 200
sdl2_gfx.FPS_LOWER_LIMIT = 1
sdl2_gfx.FPS_DEFAULT     = 30

sdl2_gfx["initFramerate"] = C["SDL_initFramerate"]
sdl2_gfx["setFramerate"] = C["SDL_setFramerate"]
sdl2_gfx["getFramerate"] = C["SDL_getFramerate"]
sdl2_gfx["getFramecount"] = C["SDL_getFramecount"]
sdl2_gfx["framerateDelay"] = C["SDL_framerateDelay"]

-- SDL2_gfx - Surface Rotozoomer
sdl2_gfx.SMOOTHING_OFF = 0
sdl2_gfx.SMOOTHING_ON  = 1

sdl2_gfx["rotozoomSurface"] = C["rotozoomSurface"]
sdl2_gfx["rotozoomSurfaceXY"] = C["rotozoomSurfaceXY"]
sdl2_gfx["rotozoomSurfaceSize"] = C["rotozoomSurfaceSize"]
sdl2_gfx["rotozoomSurfaceSizeXY"] = C["rotozoomSurfaceSizeXY"]
sdl2_gfx["zoomSurface"] = C["zoomSurface"]
sdl2_gfx["zoomSurfaceSize"] = C["zoomSurfaceSize"]
sdl2_gfx["shrinkSurface"] = C["shrinkSurface"]
sdl2_gfx["rotateSurface90Degrees"] = C["rotateSurface90Degrees"]

-- SDL2_gfx - MMX Image Filters
sdl2_gfx["imageFilterMMXdetect"] = C["SDL_imageFilterMMXdetect"]
sdl2_gfx["imageFilterMMXoff"] = C["SDL_imageFilterMMXoff"]
sdl2_gfx["imageFilterMMXon"] = C["SDL_imageFilterMMXon"]
sdl2_gfx["imageFilterAdd"] = C["SDL_imageFilterAdd"]
sdl2_gfx["imageFilterMean"] = C["SDL_imageFilterMean"]
sdl2_gfx["imageFilterSub"] = C["SDL_imageFilterSub"]
sdl2_gfx["imageFilterAbsDiff"] = C["SDL_imageFilterAbsDiff"]
sdl2_gfx["imageFilterMult"] = C["SDL_imageFilterMult"]
sdl2_gfx["imageFilterMultNor"] = C["SDL_imageFilterMultNor"]
sdl2_gfx["imageFilterMultDivby2"] = C["SDL_imageFilterMultDivby2"]
sdl2_gfx["imageFilterMultDivby4"] = C["SDL_imageFilterMultDivby4"]
sdl2_gfx["imageFilterBitAnd"] = C["SDL_imageFilterBitAnd"]
sdl2_gfx["imageFilterBitOr"] = C["SDL_imageFilterBitOr"]
sdl2_gfx["imageFilterDiv"] = C["SDL_imageFilterDiv"]
sdl2_gfx["imageFilterBitNegation"] = C["SDL_imageFilterBitNegation"]
sdl2_gfx["imageFilterAddByte"] = C["SDL_imageFilterAddByte"]
sdl2_gfx["imageFilterAddUint"] = C["SDL_imageFilterAddUint"]
sdl2_gfx["imageFilterAddByteToHalf"] = C["SDL_imageFilterAddByteToHalf"]
sdl2_gfx["imageFilterSubByte"] = C["SDL_imageFilterSubByte"]
sdl2_gfx["imageFilterSubUint"] = C["SDL_imageFilterSubUint"]
sdl2_gfx["imageFilterShiftRight"] = C["SDL_imageFilterShiftRight"]
sdl2_gfx["imageFilterShiftRightUint"] = C["SDL_imageFilterShiftRightUint"]
sdl2_gfx["imageFilterMultByByte"] = C["SDL_imageFilterMultByByte"]
sdl2_gfx["imageFilterShiftRightAndMultByByte"] = C["SDL_imageFilterShiftRightAndMultByByte"]
sdl2_gfx["imageFilterShiftLeftByte"] = C["SDL_imageFilterShiftLeftByte"]
sdl2_gfx["imageFilterShiftLeftUint"] = C["SDL_imageFilterShiftLeftUint"]
sdl2_gfx["imageFilterShiftLeft"] = C["SDL_imageFilterShiftLeft"]
sdl2_gfx["imageFilterBinarizeUsingThreshold"] = C["SDL_imageFilterBinarizeUsingThreshold"]
sdl2_gfx["imageFilterClipToRange"] = C["SDL_imageFilterClipToRange"]
sdl2_gfx["imageFilterNormalizeLinear"] = C["SDL_imageFilterNormalizeLinear"]

return sdl2_gfx
