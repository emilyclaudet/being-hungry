-- Being hungry game - originally written at Berlin Mini Game Jam - 14 January 

require 'food'
require 'player'

function love.load()
	state = 'play'
	screenWidth = love.graphics.getWidth()
	screenHeight = love.graphics.getHeight()

	-- load player
	load_player()
	-- Load food
	load_food()

	-- Hunger level
	Hunger = 100
	-- Starting time
	elapsedTime = 0
	-- Load Game State
	startScreen = love.graphics.newImage("res/startScreen.png")
	starveScreen = love.graphics.newImage("res/pugStarve.png")
	greedyScreen = love.graphics.newImage("res/pugOvereat.png")
end

function love.update(dt)
	if state ~= 'play' then
		return 
	end
	player_input(dt)
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
	-- Player
	draw_player()
	-- Food
	draw_food()
	-- Hunger level
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle("fill", 20, 40, 160, 20, 2, 2)
	love.graphics.setColor(5, 180, 15)
	love.graphics.rectangle("fill", 20, 40, Hunger, 20, 2, 2)
	-- Title for Hungry level
	love.graphics.setColor(5, 180, 15)
	love.graphics.print("HUNGER LEVEL", 20, 20, 0, 1.2,1.2)

	-- Draw if end of game
	end_game_state()
end

function love.quit()
    print('Quitting Chasing Game...')
end
