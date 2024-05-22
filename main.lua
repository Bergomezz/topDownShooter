function love.load()
  score = 0
  

  sprites = {}
  sprites.background = love.graphics.newImage("sprites/background.png")
  sprites.bullet = love.graphics.newImage("sprites/bullet.png")
  sprites.player = love.graphics.newImage("sprites/player.png")
  sprites.zombie = love.graphics.newImage("sprites/zombie.png")

  player = {}
  player.x = love.graphics.getWidth()/2
  player.y = love.graphics.getHeight()/2
  player.speed = 180

  zombies = {}

  gameFont = love.graphics.newFont(40)
end


function love.update(dt)
  if love.keyboard.isDown("d") then
    player.x = player.x + player.speed*dt
  end
  if love.keyboard.isDown("a") then
    player.x = player.x - player.speed*dt
  end
  if love.keyboard.isDown("w") then
    player.y = player.y - player.speed*dt
  end
  if love.keyboard.isDown("s") then
    player.y = player.y + player.speed*dt
  end

  for i,z in ipairs(zombies) do
    z.x = z.x + (math.cos( zombiePlayerAngle(z) ) * z.speed * dt)
    z.y = z.y + (math.sin( zombiePlayerAngle(z) ) * z.speed * dt)
  end
end

function love.draw()
  love.graphics.draw(sprites.background)
  -- love.graphics.setFont(gameFont)
  -- love.graphics.print("Score: " ..score, 5,5)
  love.graphics.draw(
    sprites.player, 
    player.x, 
    player.y, 
    playerMouseAngle(), 
    nil, 
    nil, 
    sprites.player:getWidth()/2, 
    sprites.player:getHeight()/2
  )

  for i,z in ipairs(zombies) do
    love.graphics.draw(
      sprites.zombie, 
      z.x, 
      z.y, 
      zombiePlayerAngle(z), 
      nil, 
      nil, 
      sprites.zombie:getWidth()/2, 
      sprites.zombie:getHeight()/2
    )
  end
end

function love.keypressed( key )
  if key == "space" then
    spawnZombie()
  end
end

function playerMouseAngle()
  return math.atan2(player.y - love.mouse.getY(), player.x - love.mouse.getX()) + math.pi
end

function zombiePlayerAngle(enemy)
  return math.atan2(player.y - enemy.y, player.x - enemy.x)
end

function spawnZombie()
  local zombie = {}
  zombie.x = math.random(0, love.graphics.getWidth())
  zombie.y = math.random(0, love.graphics.getHeight())
  zombie.speed = math.random(100, 180)

  table.insert(zombies, zombie)
end