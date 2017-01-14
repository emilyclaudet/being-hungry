function load_food()
	-- Food
	food = love.graphics.newImage("res/food.png")
	meat = love.graphics.newQuad(0, 0, 32, 32, food:getDimensions())
	meatX = 100
	meatY = 100
	meatLevel = 10

	fish = love.graphics.newQuad(32, 0, 32, 32, food:getDimensions())
	fishX = 400
	fishY = 100
end

function update_food(dt)
	if eat_food() == true then
		-- player's hunger level increases / decreases depending on food 
		-- picture of the sprite disappers
		updateHunger()
	end
end

function draw_food()
	-- draw Fish
	love.graphics.draw(food, fish, fishX, fishY)

	-- draw Meat
	love.graphics.draw(food, meat, meatX, meatY)
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