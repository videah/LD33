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

	self.width = w
	self.height = h

	self.x = x or math.random(0, topScreenWidth)
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

		self.y = self.y - (self.speed * 5) * dt

	end

end

function Citizen:draw()

	love.graphics.setColor(155, 0, 0, 255)

	love.graphics.circle('fill', self.x, self.y, self.width, self.height)

end

return Citizen