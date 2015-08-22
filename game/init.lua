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

local game = {}

state = require 'game.state'
input = require 'game.input'

local menu = require 'game.menu'
local about = require 'game.about'

local citizen = require 'game.entities.citizen'

game.citizens = {}

function game.load()

	state.setState('menu')

	game.generate(50)

	game.player = require 'game.entities.player':new(0, 0, 50, 50)

	menu.newOption('Play', function() state.setState('game') end)
	menu.newOption('About', function() state.setState('about') end)
	menu.newOption('Quit', function() love.event.quit() end)

	game.bgImage = love.graphics.newImage('game/images/bg.png')

	game.bigFont = love.graphics.newFont('fonts/Vera.ttf', 25)

	print('Loaded "game"')

end

function game.update(dt)

	if state.isCurrentState('menu') then

		menu.update(dt)

	end

	if state.isCurrentState('game') then

		game.player:update(dt)

		for i, person in ipairs(game.citizens) do
			if game.player:isTouching(person.x, person.y) then
				table.remove(game.citizens, i)
				game.player.eaten = game.player.eaten + 1
			end
		end

	end

end

function game.drawtop()

	if state.isCurrentState('menu') or state.isCurrentState('about') then

		love.graphics.setBackgroundColor(50, 50, 200)

		menu.drawtop()

	end

	if state.isCurrentState('game') then

		love.graphics.draw(game.bgImage, 0, 0) -- Background

		for i, person in ipairs(game.citizens) do
			person:draw()
		end

		game.player:draw()

	end

end

function game.drawbottom()

	love.graphics.setColor(255, 255, 255)

	love.graphics.setFont(defaultFont)

	love.graphics.print('FPS: ' .. love.timer.getFPS(), 0, 0)

	if state.isCurrentState('menu') then

		menu.drawbot()

	end

	if state.isCurrentState('game') then

		love.graphics.setBackgroundColor(50, 50, 200)

		love.graphics.setFont(game.bigFont)

		local text = 'Citizens Remaining: ' .. #game.citizens
		local x = (botScreenWidth / 2) - (game.bigFont:getWidth(text) / 2)
		local y = (botScreenHeight / 2) - (game.bigFont:getHeight() / 2)

		love.graphics.print(text, x, y)

		local text = 'Number Eaten: ' .. game.player.eaten
		local x = (botScreenWidth / 2) - (game.bigFont:getWidth(text) / 2)
		local y = (botScreenHeight / 2) - (game.bigFont:getHeight() / 2)

		love.graphics.print(text, x, y + game.bigFont:getHeight())

		love.graphics.setFont(defaultFont)

	end

	if state.isCurrentState('about') then

		about.draw()

	end

end

function game.mousepressed(button, x, y)

	if state.isCurrentState('game') then

	end

end

function game.keypressed(key, isrepeat)

	if state.isCurrentState('menu') then

		menu.keypressed(key, isrepeat)

	end

	if key == 'start' or key == 'escape' then
		state.setState('menu')
	end

end

function game.generate(num)

	for i=1, num do
		table.insert(game.citizens, citizen:new(8, 8, #game.citizens + 1))
	end

end

return game