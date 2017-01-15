
function load_player()
	-- Player 
	player = love.graphics.newImage("res/pug1.png")
	playerSprite = love.graphics.newQuad(0, 0, 32, 32, player:getDimensions())
	playerX = 100
	playerY = 500
	playerWidth = 32
	playerHeight = 32
	playerSpeed = 200

	playerDeathSound = love.audio.newSource("res/dogwhine.mp3")
end

function player_input(dt)
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
end

function draw_player()
	-- Player
	love.graphics.reset()
	love.graphics.draw(player, playerSprite, playerX, playerY)
end
