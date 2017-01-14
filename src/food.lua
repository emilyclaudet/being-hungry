function load_food()
	-- Food
	foodImage = love.graphics.newImage("res/food.png")
	meatImage = love.graphics.newQuad(0, 0, 32, 32, foodImage:getDimensions())
	meatLevel = 10

	fishImage = love.graphics.newQuad(32, 0, 32, 32, foodImage:getDimensions())
	fishX = 400
	fishY = 100

	-- Collection sound
	collectionSound = love.audio.newSource("res/collectfood.wav")

	-- Creating the food around the map
	food = {} --This table contains all the food
	for i=1, 15 do -- Puts food in random positions
		food[i] = {
			meatX = math.random(love.graphics.getWidth()),
			meatY = math.random(love.graphics.getHeight()),
			meatWidth = 28,
			meatHeight = 28
		}
	end
end

function update_food(dt)
	-- When player collides with the food, remove food from ground and add to hunger 
	for i,v in ipairs(food) do -- First loop through the food table
		if eat_food(playerX, playerY, playerWidth, playerHeight, v.meatX, v.meatY, v.meatWidth, v.meatHeight) then -- for each food position check if it's overlapping with player
			table.remove(food, i) --This removes the current food from the food table
			Hunger = Hunger + 25 -- Updates hunger level
			collectionSound:play()
		end
	end
end

function get_hungry(dt)
	elapsedTime = elapsedTime + 1
	if (elapsedTime > 0.1) then
    	Hunger = Hunger - 0.15
    else
        elapsedTime = 0
    end
end

function check_player_hunger(dt)
	if Hunger > 160 then
		state = 'greedy'
	end
	if Hunger < 0 then
		state = 'starve'
	end
end

function draw_food()
	-- draw Fish
	love.graphics.draw(foodImage, fishImage, fishX, fishY)

	--Drawing the food / meat
	for i,v in ipairs(food) do
		love.graphics.draw(foodImage, meatImage, v.meatX, v.meatY)
	end
end

-- Returns true if player walks over the food
function eat_food(x1,y1,w1,h1,x2,y2,w2,h2)
		return x1 < x2 + w2 and
	           x2 < x1 + w1 and
	           y1 < y2 + h2 and
	           y2 < y1 + h1
end

function end_game_state()
	if state == 'greedy' then
		draw_greedy_screen()
	end
	if state == 'starve' then
		draw_starve_screen()
	end
end

function draw_greedy_screen()
	love.graphics.reset()
	-- love.graphics.print("You died of over-eating!", 200, 200, 0, 2, 2)
	love.graphics.draw(greedyScreen, 50, 50, 0)
end

function draw_starve_screen()
	love.graphics.reset()
	-- love.graphics.print("You died of starvation!", 200, 200, 0, 2, 2)
	love.graphics.draw(starveScreen, 50, 50, 0)
end

function draw_start_screen()
	love.graphics.reset()
	-- love.graphics.print("You died of over-eating!", 200, 200, 0, 2, 2)
	love.graphics.draw(startScreen, 50, 50, 0)
end

function start_game_state()
	if state == 'start' then 
		draw_start_screen()
	else
		return 0
	end
end
