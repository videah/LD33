game = require 'game'

function love.load()

	is3DS = (love.system.getOS() == '3ds')

	game.load()

end

function love.update(dt)

	game.update(dt)

end

function love.draw()

	-- Draw top screen

	if is3DS then love.graphics.setScreen('top') end

	game.drawtop()

	-- Draw bottom screen

	if is3DS then love.graphics.setScreen('bottom') end

	game.drawbottom()

end