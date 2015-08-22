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

local Player = class('Player')

local Citizen = require 'game.entities.citizen'

function Player:initialize(x, y, w, h)

	self.frontImage = love.graphics.newImage('game/images/trumpFront.png')
	self.backImage = love.graphics.newImage('game/images/trumpBack.png')
	self.leftImage = love.graphics.newImage('game/images/trumpLeft.png')
	self.rightImage = love.graphics.newImage('game/images/trumpRight.png')

	self.width = w
	self.height = h

	self.x = (topScreenWidth / 2) - (self.width / 2)
	self.y = (topScreenHeight / 2) - (self.height / 2)

	self.eaten = 0

	self.speed = 200

	self.range = 100

	self.currentImage = self.frontImage

	print('Created player.')

end

function Player:update(dt)

	local dx, dy = 0, 0

	if input.isLeft() then

		if self.x > 0 then dx = -1 end
		self.currentImage = self.leftImage

	end

	if input.isRight() then

		if self.x < (topScreenWidth - self.width) then dx = 1 end
		self.currentImage = self.rightImage

	end

	if input.isUp() then

		if self.y > 30 then dy = -1 end
		self.currentImage = self.backImage

	end

	if input.isDown() then

		if self.y < (topScreenHeight - self.height) then dy = 1 end
		self.currentImage = self.frontImage

	end

	local length = (dx ^ 2 + dy ^ 2) ^ 0.5

	if length > 0 then
		dx, dy = dx / length, dy / length
	end

	self.x, self.y = self.x + dx * self.speed * dt, self.y + dy * self.speed * dt

end

function Player:draw()

	love.graphics.setColor(255, 255, 255, 255)

	love.graphics.draw(self.currentImage, self.x, self.y)

end

function Player:isTouching(x, y)

	return (x > self.x and x < self.x + self.width and y > self.y and y < self.y + self.height)

end

function Player:keypressed(key, isrepeat)

	if key == 'a' or key == 'space' then
		if self.y < self.range then

			for i=1, self.eaten do

				local x = self.x + math.random(1, self.width)
				local y = self.y + math.random(1, self.height)

				table.insert(game.citizens, Citizen:new(x, y, 8, 8, 'flying'))

				self.eaten = 0

			end

		end

	end

end

return Player