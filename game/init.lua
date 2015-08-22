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
local menu = require 'game.menu'

function game.load()

	state.setState('menu')

	print('Loaded "game"')
	menu.newOption('Play', function() state.setState('game') end)
	menu.newOption('About', function() state.setState('about') end)
	menu.newOption('Quit', function() love.event.quit() end)

end

function game.update(dt)

	if state.isCurrentState('menu') then

		menu.update(dt)

	end

end

function game.drawtop()

	if state.isCurrentState('menu') then

		menu.drawtop()

	end

end

function game.drawbottom()

	if state.isCurrentState('menu') then

		menu.drawbot()

	end

end

function game.mousepressed(button, x, y)

end

function game.keypressed(key, isrepeat)

	if state.isCurrentState('menu') then

		menu.keypressed(key, isrepeat)

	end

end

return game