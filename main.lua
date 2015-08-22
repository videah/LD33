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

class = require 'util.middleclass'

game = require 'game'

function love.load()

	math.randomseed(os.time())

	topScreenWidth = 400
	topScreenHeight = 240

	botScreenWidth = 320
	botScreenHeight = 240

	love.window.setMode(400, 240 * 2)

	is3DS = (love.system.getOS() == '3ds')

	defaultFont = love.graphics.newFont('fonts/Vera.ttf', 13)

	love.graphics.setFont(defaultFont)

	game.load()

end

function love.update(dt)

	game.update(dt)

end

function love.draw()

	-- Draw top screen

	if is3DS then 

		love.graphics.setScreen('top')
		game.drawtop()

	else

		love.graphics.push()
		love.graphics.setScissor(0, 0, 400, 240)

		game.drawtop()

		love.graphics.setScissor()
		love.graphics.pop()

	end

	-- Draw bottom screen

	if is3DS then 
	
		love.graphics.setScreen('bottom')
		game.drawbottom()

	else

		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.rectangle('fill', 0, 240, 40, 240)
		love.graphics.rectangle('fill', 360, 240, 40, 240)

		love.graphics.push()
		love.graphics.translate(40, 240)
		love.graphics.setScissor(40, 240, 320, 240)

		game.drawbottom()

		love.graphics.setScissor()
		love.graphics.pop()

	end

end

function love.mousepressed(x, y, button)

	game.mousepressed(x, y, button)

end

function love.keypressed(key, isrepeat)

	game.keypressed(key, isrepeat)

end