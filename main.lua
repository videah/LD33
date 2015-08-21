game = require 'game'

function love.load()

	love.window.setMode(400, 240 * 2)

	is3DS = (love.system.getOS() == '3ds')

	defaultFont = love.graphics.newFont('fonts/Vera.ttf', 13)
	love.graphics.setFont(defaultFont)

	game.load()

end

function love.update(dt)

	game.update(dt)

	if love.keyboard.isDown('start') then love.event.quit() end

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