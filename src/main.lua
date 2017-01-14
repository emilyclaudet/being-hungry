-- Being hungry game prototype
require 'food'

function love.load()
	state = 'play'
	screenWidth = love.graphics.getWidth()
	screenHeight = love.graphics.getHeight()
	-- Player 
	player = love.graphics.newImage("res/pug1.png")
	playerSprite = love.graphics.newQuad(0, 0, 32, 32, player:getDimensions())
	playerX = 100
	playerY = 500
	playerWidth = 32
	playerHeight = 32
	playerSpeed = 200

	playerDeathSound = love.audio.newSource("res/dogwhine.mp3")
	-- Hunger level
	Hunger = 100
	-- Starting time
	elapsedTime = 0
	-- Load food
	load_food()
	-- Load Game State
	startScreen = love.graphics.newImage("res/startScreen.png")
	starveScreen = love.graphics.newImage("res/pugStarve.png")
	greedyScreen = love.graphics.newImage("res/pugOvereat.png")
end

function love.update(dt)
	if state ~= 'play' then
		return 
	end

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
	-- calls eating animation?
	end
	get_hungry()
	update_food()
	check_player_hunger()
end

function love.keyreleased(key)
    if key == "escape" then
		love.event.quit()
	end
end

function love.keypressed(key)
    if key == 'return' then
   		state = 'play'
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
	-- Draw if start of game
	-- draw_start_screen()
	-- Draw if end of game
	end_game_state()
end

function love.quit()
    print('Quitting Chasing Game...')
end
