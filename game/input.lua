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

-- Messy as fuck input system, just to make porting easier.

local input = {}

function input.isUp()

	return (love.keyboard.isDown('cpadup') or love.keyboard.isDown('dup') or love.keyboard.isDown('up'))

end

function input.isDown()

	return (love.keyboard.isDown('cpaddown') or love.keyboard.isDown('ddown') or love.keyboard.isDown('down'))

end

function input.isLeft()

	return (love.keyboard.isDown('cpadleft') or love.keyboard.isDown('dleft') or love.keyboard.isDown('left'))

end

function input.isRight()

	return (love.keyboard.isDown('cpadright') or love.keyboard.isDown('dright') or love.keyboard.isDown('right'))

end

return input