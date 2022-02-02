local ROOT = (...):gsub('[^.]*.[^.]*.[^.]*$', '')
local REL = (...):gsub('[^.]*$', '')

local Text = setmetatable({}, { __call = function (self, ...)
    local object = setmetatable({}, { __index = self })
    return object, self.constructor(object, ...)
end ,
__tostring=function(self)
	if type(self.text)=='string' then return self.text end
	local res={}
	for _,v in ipairs(self.text) do
		if type(v)=='string' then res[#res+1]=v end
	end
	return table.concat(res,'')
end

})

local function fixcolor(color)
	if not color then 
		return (_G.love._version_major>=11 and { 0, 0, 0} or {0,0,0})
	end
	local clr={unpack(color)} 
	if clr[1]>1 or clr[2]>1 or clr[3]>1 or (clr[4] and clr[4]>1) then
		if _G.love._version_major >= 11 then
			for i=1,3 do 
					clr[i]=clr[i]/255 
			end
		end
	end
	return clr
end


function Text:constructor (font, text, color, align, limit)
	self.textObj=love.graphics.newText(font.loveFont)
	self.text=text
  if type(text)=='string' then 
		text={text} 
  elseif type(text)=='table' then
    if type(text[1])=='table' then 
       text={'',unpack(text)}
    end
	end
	if limit then 
		self.textObj:addf({fixcolor(color),unpack(text)},limit,align,0,0)
	else
		self.textObj:add({fixcolor(color),unpack(text)},0,0)
	end
end

function Text:getWidth ()
    return self.textObj:getWidth()
end

function Text:getHeight ()
    return self.textObj:getHeight()
end

function Text:draw(x,y)
	love.graphics.draw(self.textObj,x,y)
end

return Text

