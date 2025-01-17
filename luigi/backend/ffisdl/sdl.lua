local REL = (...):gsub('[^.]*$', '')

local ffi = require 'ffi'
local sdl = require(REL .. 'sdl2.init')

sdl.AudioCVT = ffi.typeof 'SDL_AudioCVT'
-- sdl.AudioDeviceEvent = ffi.typeof 'SDL_AudioDeviceEvent'
sdl.AudioSpec = ffi.typeof 'SDL_AudioSpec'
sdl.Color = ffi.typeof 'SDL_Color'
sdl.ControllerAxisEvent = ffi.typeof 'SDL_ControllerAxisEvent'
sdl.ControllerButtonEvent = ffi.typeof 'SDL_ControllerButtonEvent'
sdl.ControllerDeviceEvent = ffi.typeof 'SDL_ControllerDeviceEvent'
sdl.DisplayMode = ffi.typeof 'SDL_DisplayMode'
sdl.DollarGestureEvent = ffi.typeof 'SDL_DollarGestureEvent'
sdl.DropEvent = ffi.typeof 'SDL_DropEvent'
sdl.Event = ffi.typeof 'SDL_Event'
sdl.Finger = ffi.typeof 'SDL_Finger'
sdl.HapticCondition = ffi.typeof 'SDL_HapticCondition'
sdl.HapticConstant = ffi.typeof 'SDL_HapticConstant'
sdl.HapticCustom = ffi.typeof 'SDL_HapticCustom'
sdl.HapticDirection = ffi.typeof 'SDL_HapticDirection'
sdl.HapticEffect = ffi.typeof 'SDL_HapticEffect'
sdl.HapticLeftRight = ffi.typeof 'SDL_HapticLeftRight'
sdl.HapticPeriodic = ffi.typeof 'SDL_HapticPeriodic'
sdl.HapticRamp = ffi.typeof 'SDL_HapticRamp'
sdl.JoyAxisEvent = ffi.typeof 'SDL_JoyAxisEvent'
sdl.JoyBallEvent = ffi.typeof 'SDL_JoyBallEvent'
sdl.JoyButtonEvent = ffi.typeof 'SDL_JoyButtonEvent'
sdl.JoyDeviceEvent = ffi.typeof 'SDL_JoyDeviceEvent'
sdl.JoyHatEvent = ffi.typeof 'SDL_JoyHatEvent'
sdl.KeyboardEvent = ffi.typeof 'SDL_KeyboardEvent'
sdl.Keysym = ffi.typeof 'SDL_Keysym'
sdl.MessageBoxButtonData = ffi.typeof 'SDL_MessageBoxButtonData'
sdl.MessageBoxColor = ffi.typeof 'SDL_MessageBoxColor'
sdl.MessageBoxColorScheme = ffi.typeof 'SDL_MessageBoxColorScheme'
sdl.MessageBoxData = ffi.typeof 'SDL_MessageBoxData'
sdl.MouseButtonEvent = ffi.typeof 'SDL_MouseButtonEvent'
sdl.MouseMotionEvent = ffi.typeof 'SDL_MouseMotionEvent'
sdl.MouseWheelEvent = ffi.typeof 'SDL_MouseWheelEvent'
sdl.MultiGestureEvent = ffi.typeof 'SDL_MultiGestureEvent'
sdl.Palette = ffi.typeof 'SDL_Palette'
sdl.PixelFormat = ffi.typeof 'SDL_PixelFormat'
sdl.Point = ffi.typeof 'SDL_Point'
sdl.QuitEvent = ffi.typeof 'SDL_QuitEvent'
sdl.RWops = ffi.typeof 'SDL_RWops'
sdl.Rect = ffi.typeof 'SDL_Rect'
sdl.RendererInfo = ffi.typeof 'SDL_RendererInfo'
sdl.Surface = ffi.typeof 'SDL_Surface'
sdl.SysWMEvent = ffi.typeof 'SDL_SysWMEvent'
-- sdl.SysWMinfo = ffi.typeof 'SDL_SysWMinfo'
sdl.SysWMmsg = ffi.typeof 'SDL_SysWMmsg'
sdl.TextEditingEvent = ffi.typeof 'SDL_TextEditingEvent'
sdl.TextInputEvent = ffi.typeof 'SDL_TextInputEvent'
sdl.Texture = ffi.typeof 'SDL_Texture'
sdl.TouchFingerEvent = ffi.typeof 'SDL_TouchFingerEvent'
sdl.UserEvent = ffi.typeof 'SDL_UserEvent'
sdl.WindowEvent = ffi.typeof 'SDL_WindowEvent'
sdl.assert_data = ffi.typeof 'SDL_assert_data'
sdl.atomic_t = ffi.typeof 'SDL_atomic_t'
sdl.version = ffi.typeof 'SDL_version'

if sdl.init(sdl.INIT_VIDEO) ~= 0 then
    error(ffi.string(sdl.getError()))
end

local sdl_gfx = require(REL .. 'sdl2_gfx.init' )
sdl.gfx = sdl_gfx

return sdl
