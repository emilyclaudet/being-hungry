
function love.load()
	screenWidth = love.graphics.getWidth()
	screenHeight = love.graphics.getHeight()
	-- player 
	player = love.graphics.newImage("res/pug1.png")
	playerSprite = love.graphics.newQuad(0, 0, 32, 32, player:getDimensions())
	playerX = 100
	playerY = 500
	playerSpeed = 200
	-- food
	food = love.graphics.newImage("res/food.png")
	meat = love.graphics.newQuad(0, 0, 32, 32, food:getDimensions())
	meatX = 100
	meatY = 100

	fish = love.graphics.newQuad(32, 0, 32, 32, food:getDimensions())
	fishX = 400
	fishY = 100

	-- hunger level
	initialHunger = 50
	Hunger = 50
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

	if eat_food() == true then
		-- player's hunger level increases / decreases depending on food 
		-- picture of the sprite disappers
	end
end

-- Returns true if player walks over the food
function eat_food(x1,y1,w1,h1,x2,y2,w2,h2)
		x1 = playerX - 2
		y1 = playerY - 2
		w1 = 28
		h1 = 28
		x2 = meatX
		y2 = meatY
		w2 = 28
		h2 = 28
		return x1 < x2 + w2 and
	           x2 < x1 + w1 and
	           y1 < y2 + h2 and
	           y2 < y1 + h1
end

function love.keyreleased(key)
    if key == "escape" then
		love.event.quit()
	end
end

function love.draw()
	-- background
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("fill", 0, 0, screenWidth, screenHeight)

	--- sprites
	love.graphics.draw(food, meat, meatX, meatY)
	love.graphics.draw(food, fish, fishX, fishY)
	love.graphics.draw(player, playerSprite, playerX, playerY)

	-- hunger bar
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle("fill", 20, 40, 160, 20)
	love.graphics.setColor(5, 180, 15)
	love.graphics.rectangle("fill", 20, 40, Hunger, 20)

	-- Title
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("HUNGER LEVEL", 20, 20, 0, 1.2,1.2)
end

function love.quit()
    print('Quitting Chasing Game...')
end
