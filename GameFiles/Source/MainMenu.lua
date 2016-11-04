
function Menu_Load()
  
  introScreen = love.graphics.newImage("sprites/startScreen.png")
  startButton = love.graphics.newImage("sprites/startButton.png")
  startButtonPosX = 70
  startButtonPosY = 200
  scoresButton = love.graphics.newImage("sprites/scoresButton.png")
  scoresButtonPosX = 70
  scoresButtonPosY = 400
  buttonPressSound = love.audio.newSource("Sounds/ButtonPress.wav")
end

function Menu_Update(dt)
  
  
end

function Menu_Draw()
  
  love.graphics.draw(introScreen, 0, 0)
  love.graphics.draw(startButton, startButtonPosX, startButtonPosY)
  love.graphics.draw(scoresButton, scoresButtonPosX, scoresButtonPosY)
  
end

function Menu_mousepressed(x, y, button)
    if mouseRectCollide(x, y, button, 70, 200, 400, 130, 1) then
      buttonPressSound:play()
      Player_Load()
      Map_Load()
      gamestate = "game"
    elseif mouseRectCollide(x, y, button, 70, 400, 400, 130, 1) then
       buttonPressSound:play()
      gamestate = "scores"
    end
end

function Menu_keypressed(key)
  
end