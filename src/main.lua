-- Being hungry prototype
require 'food'

function love.load()
	screenWidth = love.graphics.getWidth()
	screenHeight = love.graphics.getHeight()
	-- Player 
	player = love.graphics.newImage("res/pug1.png")
	playerSprite = love.graphics.newQuad(0, 0, 32, 32, player:getDimensions())
	playerX = 100
	playerY = 500
	playerSpeed = 200
	-- Hunger level
	Hunger = 50
	-- Load food
	load_food()
end

function love.update(dt)
	if love.keyboard.isDown('left') then
		playerX = playerX - (playerSpeed * dt)
	end

	if love.keyboard.isDown('right') then
		playerX = playerX + (playerSpeed * dt)
	end

	if love.keyboard.isDown('up') then
		playerY = playerY - (playerSpeed * dt)
	end

	if love.keyboard.isDown('down') then
		playerY = playerY + (playerSpeed * dt)
	end

	if love.keyboard.isDown('space') then
		-- calls eating animation
	end

	update_food()

end

function updateHunger()
	Hunger = Hunger + meatLevel
end

function love.keyreleased(key)
    if key == "escape" then
		love.event.quit()
	end
end

function love.draw()
	-- Background
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("fill", 0, 0, screenWidth, screenHeight)
	-- Food
	draw_food()
	-- Player
	love.graphics.draw(player, playerSprite, playerX, playerY)
	-- Hunger level
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle("fill", 20, 40, 160, 20, 2, 2)
	love.graphics.setColor(5, 180, 15)
	love.graphics.rectangle("fill", 20, 40, Hunger, 20, 2, 2)
	-- Title for Hungry level
	love.graphics.setColor(5, 180, 15)
	love.graphics.print("HUNGER LEVEL", 20, 20, 0, 1.2,1.2)
end

function love.quit()
    print('Quitting Chasing Game...')
end
