local ROOT = (...):gsub('[^.]*.[^.]*$', '')

local Base = require(ROOT .. 'base')
local Hooker = require(ROOT .. 'hooker')

local Backend = {}

Backend.isMac = function ()
    return love.system.getOS() == 'OS X'
end

Backend.run = function () end

Backend.Cursor = love.mouse.newCursor

Backend.Font = require(ROOT .. 'backend.love.font')

Backend.Text = require(ROOT .. 'backend.love.text2')

Backend.Image = love.graphics.newImage

Backend.Quad = love.graphics.newQuad

Backend.SpriteBatch = love.graphics.newSpriteBatch

-- love.graphics.draw( drawable, x, y, r, sx, sy, ox, oy, kx, ky )
Backend.draw = function (drawable, ...)
    if drawable.typeOf and drawable:typeOf 'Drawable' then
        return love.graphics.draw(drawable, ...)
    end
    return drawable:draw(...)
end

Backend.drawRectangle = love.graphics.rectangle

Backend.drawLine = function (x1, y1, x2, y2)
		love.graphics.line(x1,y1,x2,y2)
end

Backend.drawLines = function (pts)
		if type(pts)~='table' or #pts==0 then
			return 
		end
		love.graphics.line(pts)
end

Backend.print = love.graphics.print

Backend.getClipboardText = love.system.getClipboardText

Backend.setClipboardText = love.system.setClipboardText

Backend.getMousePosition = love.mouse.getPosition

Backend.setMousePosition = love.mouse.setPosition

Backend.getSystemCursor = love.mouse.getSystemCursor
Backend.isCursorSupported = love.mouse.isCursorSupported

Backend.getWindowSize = function ()  
    --local _,_,w,h=love.window.getSafeArea()
    --return w,h
    return love.graphics.getWidth(), love.graphics.getHeight()
end

Backend.setWindowTitle= function(s)
	return love.window.setTitle(s)
end

Backend.setWindowTop= function(t)  
	local x,_, id=love.window.getPosition()
	return love.window.setPosition(x,t,id)
end
Backend.setWindowLeft= function(l)
	local _,y, id=love.window.getPosition()
	return love.window.setPosition(l,y,id)
end

for _, n in ipairs({'Maxwidth','Maxheight','Minwidth','Minheight'}) do
	Backend['setWindow'..n]= function (m)
		love.window.showMessageBox('warning',n..' not supported on love2d','info')
	end
end
function Backend.setWindowMaxheight (max)
	love.window.showMessageBox('warning','maxheight not supported on love2d','info')
end

Backend.drawRoundedRectangle = function (mode, x, y, width, height,radius)
	love.graphics.rectangle(mode,x,y,width,height,radius,radius)
end

Backend.drawCircle=love.graphics.circle

Backend.getTime = love.timer.getTime

Backend.isKeyDown = love.keyboard.isDown

Backend.isMouseDown = love.mouse.isDown

Backend.pop = love.graphics.pop

local push = love.graphics.push

Backend.push = function ()
     return push 'all'
end

Backend.quit = function ()
     love.event.quit()
end

if _G.love._version_major >= 11 then
    Backend.setColor = function(r, g, b, a)
        if type(r) == "table" then
            r, g, b, a = r[1], r[2], r[3], r[4]
        end
        if a == nil then
            a = 255
        end
        love.graphics.setColor(r / 255, g / 255, b / 255, a / 255)
    end
else
    Backend.setColor = love.graphics.setColor
end

Backend.setCursor = love.mouse.setCursor

Backend.setFont = function (font)
    return love.graphics.setFont(font.loveFont)
end

Backend.setScissor = love.graphics.setScissor

Backend.getScissor = love.graphics.getScissor

Backend.intersectScissor = love.graphics.intersectScissor

function Backend.hide (layout)
    for _, item in ipairs(layout.hooks) do
        Hooker.unhook(item)
    end
    layout.hooks = {}
end
-- hook all [key] on love callbacks
local function hook (layout, key, method, hookLast)
    layout.hooks[#layout.hooks + 1] = Hooker.hook(love, key, method, hookLast)
end

local getMouseButtonId, isMouseDown

if love._version_major == 0 and love._version_minor < 10 then
    getMouseButtonId = function (value)
        return value == 'l' and 'left'
            or value == 'r' and 'right'
            or value == 'm' and 'middle'
            or value == 'x1' and 4
            or value == 'x2' and 5
            or value
    end
    isMouseDown = function ()
        return love.mouse.isDown('l', 'r', 'm')
    end
else
    getMouseButtonId = function (value)
        return value == 1 and 'left'
            or value == 2 and 'right'
            or value == 3 and 'middle'
            or value
    end
    isMouseDown = function ()
        return love.mouse.isDown(1, 2, 3)
    end
end

function Backend.setWindowIcon (icon)
	love.window.setIcon(love.image.newImageData(icon))
end

function Backend.setWindowWidth(new_width)
	local _,h,flags=love.window.getMode()
	love.window.setMode(new_width,h,flags)
end

function Backend.setWindowHeight(new_height)
	local w , _ ,flags=love.window.getMode()
	love.window.setMode(w,new_height,flags)
end


function Backend.show (layout)

    local input = layout.input

    hook(layout, 'draw', function ()        
        input:handleDisplay(layout)
    end, true)
    hook(layout, 'resize', function (width, height)
        return input:handleReshape(layout, width, height)
    end)
    hook(layout, 'mousepressed', function (x, y, button)
		--print('mouse pressed,',button)
        if button == 'wu' or button == 'wd' then
            return input:handleWheelMove(layout, 0, button == 'wu' and 1 or -1)
        end
        return input:handlePressStart(layout, getMouseButtonId(button), x, y)
    end)
    hook(layout, 'mousereleased', function (x, y, button)
		--print('mouse released:',button)
        return input:handlePressEnd(layout, getMouseButtonId(button), x, y)
    end)
    hook(layout, 'mousemoved', function (x, y, dx, dy)
        if isMouseDown() then
            return input:handlePressedMove(layout, x, y)
        else
            return input:handleMove(layout, x, y)
        end
    end)
    hook(layout, 'keypressed', function (key, sc, isRepeat)
        if key == ' ' then key = 'space' end
        return input:handleKeyPress(layout, key, sc, Backend.getMousePosition())
    end)
    hook(layout, 'keyreleased', function (key, sc)
        if key == ' ' then key = 'space' end
        return input:handleKeyRelease(layout, key, sc, Backend.getMousePosition())
    end)
    hook(layout, 'textinput', function (text)
        return input:handleTextInput(layout, text, Backend.getMousePosition())
    end)
    if (love._version_major == 0 and love._version_minor > 9) or love._version_major >= 11 then
      	local touchid
        hook(layout, 'touchpressed', function (id, x, y, dx, dy, pressure )
			--print('touched pressed')
			touchid=id
        end)
        hook(layout, 'touchreleased', function (id, x, y, dx, dy, pressure )
			--print('touched released')
			touchid=nil
        end)
        hook(layout, 'touchmoved', function (id, x, y, dx, dy, pressure )
			if id==touchid then 
				--print('touchmoved',dx,dy)
            	return input:handleWheelMove(layout, dx, dy)
			end
        end)
        hook(layout, 'wheelmoved', function (x, y)
			--print('wheelmoved',x, y)
            return input:handleWheelMove(layout, x, y)
        end)
    end
end

return Backend
