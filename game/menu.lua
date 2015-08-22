-- This code is licensed under the MIT Open Source License.

-- Copyright (c) 2015 Ruairidh Carmichael - ruairidhcarmichael@live.co.uk

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.

local menu = {}
menu.options = {}
menu.selected = 1
menu.font = love.graphics.newFont('fonts/Vera.ttf', 24)

-- Menu Options --

local MenuOption = class('MenuOption')

function MenuOption:initialize(name, func, x, y, id)

	self.name = name
	self.func = func
	self.x = x
	self.y = y
	self.id = id
	self.selected = false

end

function MenuOption:draw()

	love.graphics.print(self.name, self.x, self.y)

end

function MenuOption:setPos(x, y)

	self.x, self.y = x, y

end

-- The Actual Menu --

function menu.update(dt)

	for i, option in ipairs(menu.options) do

		local y = (i - 1) * (menu.font:getHeight() + 15) + 50
		local x = (botScreenWidth / 2) - (menu.font:getWidth(option.name) / 2)

		option:setPos(x, y)

		if menu.selected == option.id then
			option.selected = true
		else
			option.selected = false
		end

	end

end

function menu.drawtop()

end

function menu.drawbot()

	love.graphics.setFont(menu.font)

	for i, option in ipairs(menu.options) do

		if option.selected then
			love.graphics.setColor(255, 0, 0)
		else
			love.graphics.setColor(255, 255, 255)
		end

		option:draw()

	end

	love.graphics.setFont(defaultFont)

end

function menu.keypressed(key, isrepeat)

	-- Messy

	if key == 'dup' or key == 'cpadup' or key == 'up' or key == 's' then
		menu.selected = menu.selected - 1
	end

	if key == 'ddown' or key == 'cpaddown' or key == 'down' or key == 's' then
		menu.selected = menu.selected + 1
	end

	if menu.selected < 1 then menu.selected = 1 end
	if menu.selected > #menu.options then menu.selected = #menu.options end

	if key == 'a' or key == 'start' then
		for i, option in ipairs(menu.options) do
			if option.id == i and option.selected then
				option.func()
			end
		end
	end

end

function menu.newOption(name, func)

	table.insert(menu.options, MenuOption:new(name, func, 0, 0, #menu.options + 1))

end

return menu