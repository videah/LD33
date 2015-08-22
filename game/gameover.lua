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

local gameover = {}

local sadTrump =  love.graphics.newImage('game/images/sadtrump.png')

function gameover.draw()

	love.graphics.draw(sadTrump, 0, 0)

	love.graphics.print('They took all our jobs', sadTrump:getWidth() + 5, 20)
	love.graphics.print('This once great country,', sadTrump:getWidth() + 5, 40)
	love.graphics.print('\'murica, has been ruined.', sadTrump:getWidth() + 5, 60)

	if is3DS then

		love.graphics.print('Press Start to quit.', sadTrump:getWidth() + 5, botScreenHeight - 20)

	else

		love.graphics.print('Press Escape to quit.', sadTrump:getWidth() + 5, botScreenHeight - 20)

	end

end

function gameover.update(dt)

end

return gameover