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


  gameFont = love.graphics.newFont(40)
end


function love.update(dt)

end

function love.draw()
  love.graphics.draw(sprites.background)
  -- love.graphics.setFont(gameFont)
  -- love.graphics.print("Score: " ..score, 5,5)
  love.graphics.draw(sprites.player, player.x, player.y)
end