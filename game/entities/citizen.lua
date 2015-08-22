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

local Citizen = class('Citizen')

function Citizen:initialize(x, y, w, h, state)

	self.race = math.random(1, 4)

	self.happyImage = love.graphics.newImage('game/images/citizenHappy.png')
	self.sadImage = love.graphics.newImage('game/images/citizenSad.png')

	self.image = self.happyImage

	self.width = w
	self.height = h

	self.x = x or math.random(16, topScreenWidth - 16)
	self.y = y or 0

	self.speed = 200
	self.direction = 'up'
	
	self.state = state or 'running'

	self.speed = 50

	print('Created Citizen. ID = ' .. #game.citizens)

end

function Citizen:update(dt)

	if self.state == 'running' then

		self.y = self.y + self.speed * dt

	else

		self.image = self.sadImage

		self.y = self.y - (self.speed * 4) * dt

	end

end

function Citizen:draw()

	if self.race == 1 then
		love.graphics.setColor(115, 77, 77, 255)
	elseif self.race == 2 then
		love.graphics.setColor(255, 255, 0, 255)
	elseif self.race == 3 then
		love.graphics.setColor(56, 209, 110, 255)
	elseif self.race == 4 then
		love.graphics.setColor(255, 145, 0)
	end

	love.graphics.draw(self.image, self.x, self.y)

	love.graphics.setColor(255, 255, 255)

end

return Citizen