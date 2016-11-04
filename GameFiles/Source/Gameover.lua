function Gameover_Load()
  require "Source/CollisionHandler"
  
  gameoverScreen = love.graphics.newImage("sprites/gameover.png")
  returnButton = love.graphics.newImage("sprites/returnButton.png")
end

function Gameover_Update(dt)

end

function Gameover_Draw()
  love.graphics.draw(gameoverScreen, 0, 0)
  love.graphics.draw(returnButton, 120, 500)
end

function Gameover_mousepressed(x, y, button)
    if mouseRectCollide(x, y, button, 120, 500, 300, 96, 1) then
      Menu_Load()
      gamestate = "startScreen"
    end
end