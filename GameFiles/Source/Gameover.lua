function Gameover_Load()
  require "Source/CollisionHandler"
  
  gameoverScreen = love.graphics.newImage("sprites/gameover.png")
  returnButton = love.graphics.newImage("sprites/returnButton.png")
  buttonPressSound = love.audio.newSource("Sounds/ButtonPress.wav")
end

function Gameover_Update(dt)

end

function Gameover_Draw()
  love.graphics.draw(gameoverScreen, 0, 0)
  love.graphics.draw(returnButton, 120, 500)
end

function Gameover_mousepressed(x, y, button)
    if mouseRectCollide(x, y, button, 120, 500, 300, 96, 1) then
      if (mute == false) then
      buttonPressSound:play()
      end
      gamestate = "startScreen"
    end
end