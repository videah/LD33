game = {}

function game.load()

	print('Loaded "game"')

end

function game.update(dt)

end

function game.drawtop()

	love.graphics.print('Hello, World!', 0, 230)

end

function game.drawbottom()

	love.graphics.print('Hello, World!', love.graphics.getWidth() - 100, 0)

end

return game