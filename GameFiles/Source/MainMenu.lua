
function Menu_Load()
  
  introScreen = love.graphics.newImage("sprites/startScreen.png")
  startButton = love.graphics.newImage("sprites/startButton.png")
  startButtonPosX = 70
  startButtonPosY = 200
  scoresButton = love.graphics.newImage("sprites/scoresButton.png")
  scoresButtonPosX = 70
  scoresButtonPosY = 400
 
  muteButton = love.graphics.newImage("sprites/muteButton.png")
  buttonPressSound = love.audio.newSource("Sounds/ButtonPress.wav")
end

function Menu_Update(dt)
  
  
end

function Menu_Draw()
  
  love.graphics.draw(introScreen, 0, 0)
  love.graphics.draw(startButton, startButtonPosX, startButtonPosY)
  love.graphics.draw(scoresButton, scoresButtonPosX, scoresButtonPosY)
  love.graphics.draw(muteButton, 460, 10) 
end

function Menu_mousepressed(x, y, button)
    if mouseRectCollide(x, y, button, 70, 200, 400, 130, 1) then
      if (mute == false) then
     buttonPressSound:play()
     end
      Player_Load()
      Map_Load()
      MainGame_Load()
      gamestate = "game"
    elseif mouseRectCollide(x, y, button, 70, 400, 400, 130, 1) then
       if (mute == false) then
       buttonPressSound:play()
       end
      gamestate = "scores"
    elseif mouseRectCollide(x,y,button,460,10,50,50,1) then
      if (mute ==false) then
      mute = true
    else mute = false
      end
    end
end

function Menu_keypressed(key)
  
end