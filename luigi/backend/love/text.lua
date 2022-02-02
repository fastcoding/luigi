local ROOT = (...):gsub('[^.]*.[^.]*.[^.]*$', '')
local REL = (...):gsub('[^.]*$', '')

local Multiline = require(ROOT .. 'multiline')

local Text = setmetatable({}, { __call = function (self, ...)
    local object = setmetatable({}, { __index = self })
    return object, self.constructor(object, ...)
end })

local function fixcolor(color)
	if not color then 
		return (_G.love._version_major>=11 and { 0, 0, 0} or {0,0,0})
	end
	local clr={unpack(color)} 
	if clr[1]>1 or clr[2]>1 or clr[3]>1 then
		if _G.love._version_major >= 11 then
			for i=1,3 do 
					clr[i]=clr[i]/255 
			end
		end
	end
	return clr
end

local function renderSingle (self, x, y, font, text, color)
    love.graphics.push('all')
    love.graphics.setColor(fixcolor(color))
    love.graphics.setFont(font.loveFont)
    love.graphics.print(text, math.floor(x), math.floor(y))
    love.graphics.pop()

    self.height = font:getLineHeight()
    self.width = font:getAdvance(text)
end

local function renderMulti (self, x, y, font, text, color, align, limit)
    local lines = Multiline.wrap(font, text, limit)
    local lineHeight = font:getLineHeight()
    local height = #lines * lineHeight

    love.graphics.push('all')
    love.graphics.setColor(fixcolor(color))
    love.graphics.setFont(font.loveFont)

    for index, line in ipairs(lines) do
        local text = table.concat(line)
        local top = (index - 1) * lineHeight
        local w = line.width

        if align == 'left' then
            love.graphics.print(text,
                math.floor(x), math.floor(top + y))
        elseif align == 'right' then
            love.graphics.print(text,
                math.floor(limit - w + x), math.floor(top + y))
        elseif align == 'center' then
            love.graphics.print(text,
                math.floor((limit - w) / 2 + x), math.floor(top + y))
        end
    end

    love.graphics.pop()

    self.height = height
    self.width = limit
end

function Text:constructor (font, text, color, align, limit)
    if limit then

        function self:draw (x, y)
            return renderMulti(self, x, y, font, text, color, align, limit)
        end
    else
        function self:draw (x, y)
            return renderSingle(self, x, y, font, text, color)
        end
    end
    self:draw(-1000000, -1000000)
end

function Text:getWidth ()
    return self.width
end

function Text:getHeight ()
    return self.height
end

return Text
