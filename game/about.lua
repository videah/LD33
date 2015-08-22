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

local about = {}

about.font = love.graphics.newFont('fonts/Vera.ttf', 20)

about.iconLD = love.graphics.newImage('game/images/iconLD.png')
about.iconPotion = love.graphics.newImage('game/images/iconPotion.png')
about.iconLove = love.graphics.newImage('game/images/iconLove.png')

function about.draw()

	love.graphics.setColor(255, 255, 255)

	love.graphics.setFont(about.font)

	local x = (botScreenWidth / 2) - (about.font:getWidth('About') / 2)
	local y = 25

	love.graphics.print('About', x, y)

	love.graphics.draw(about.iconLove, x - 78, y + 30)

	love.graphics.draw(about.iconLD, x, y + 30)

	love.graphics.rectangle('fill', x + 78, y + 38, about.iconPotion:getWidth() + 4, about.iconPotion:getHeight() + 4)

	love.graphics.draw(about.iconPotion, x + 80, y + 40)

	love.graphics.setFont(defaultFont)

	local text = 'This short game was made for Ludum Dare 33'
	local x = (botScreenWidth / 2) - (defaultFont:getWidth(text) / 2)
	local y = 55 + 75

	love.graphics.print(text, x, y)

	local text = 'Powered by LOVE and LovePotion'
	local x = (botScreenWidth / 2) - (defaultFont:getWidth(text) / 2)
	local y = y + defaultFont:getHeight()

	love.graphics.print(text, x, y)

	local text = 'Press Start (or Escape) to go back.'
	local x = (botScreenWidth / 2) - (defaultFont:getWidth(text) / 2)
	local y = y + defaultFont:getHeight() * 3

	love.graphics.print(text, x, y)

	love.graphics.setFont(defaultFont)

end

return about