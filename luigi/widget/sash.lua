--[[--
A sash.

Dragging this widget resizes the widgets adjacent to it.
A sash should be adjacent to a widget with a specified size
in the same direction as the parent element's @{attribute.flow|flow}.

For example, if the parent of the sash is `flow = 'x'`
then either or both of the siblings adjacent to the sash
should have a specified @{attribute.width|width} attribute.

@usage
-- create a layout containing two widgets separated by a sash
local layout = Layout {
    type = 'panel', flow = 'x',
    { text = 'This is the left side', wrap = true, width = 100 },
    { type = 'sash' },
    { text = 'This is the right side', wrap = true },
}

-- show the layout
layout:show()

@widget sash
--]]--

local function setDimension (widget, name, size)
    if not widget.parent then
        widget[name] = size
        return
    end
    local parentDimension = widget.parent:calculateDimension(name)
    local claimed = 0
    for i, sibling in ipairs(widget.parent) do
        if sibling ~= widget and sibling[name] then
            claimed = claimed + sibling[name]
        end
    end
    if claimed + size > parentDimension then
        size = parentDimension - claimed
    end

    local min = (name == 'width') and (widget.minwidth or 0)
        or (widget.minheight or 0)

    widget[name] = math.max(size, min)

    return widget[name]
end


return function (self)

    self:onEnter(function (event)
        local axis = self.parent.flow
        if axis == 'x' then
            self.cursor = 'sizewe'
        else
            self.cursor = 'sizens'
        end
    end)

    self:onPressDrag(function (event)
        local axis = self.parent.flow
        if axis == 'x' then
            dimension = 'width'
        else
            axis = 'y'
            dimension = 'height'
        end
        local prevSibling = self:getPreviousSibling()
        local nextSibling = self:getNextSibling()
        local prevSize = prevSibling and prevSibling[dimension]
        local nextSize = nextSibling and nextSibling[dimension]

        if prevSize then
            setDimension(prevSibling, dimension,
                event[axis] - prevSibling:calculatePosition(axis))
        end
        if nextSize then
            setDimension(nextSibling, dimension,
                nextSibling:calculatePosition(axis) +
                nextSibling:calculateDimension(dimension) - event[axis])
        end

    end)

end
