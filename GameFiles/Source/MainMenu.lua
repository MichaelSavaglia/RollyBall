
function Menu_Load()
  
  introScreen = love.graphics.newImage("sprites/menu.png")
  startButton = love.graphics.newImage("sprites/startButton.png")
  startButtonPosX = 70
  startButtonPosY = 200
  scoresButton = love.graphics.newImage("sprites/scoresButton.png")
  scoresButtonPosX = 70
  scoresButtonPosY = 400

 
  muteButton = love.graphics.newImage("sprites/muteButton.png")

  love.graphics.setFont(mainFont)
  timer = 1

end

function Menu_Update(dt)
  timer = timer - 0.1
  
end

function Menu_Draw()
  
  love.graphics.draw(introScreen, 0, 0)

  --love.graphics.draw(startButton, startButtonPosX, startButtonPosY)
  --love.graphics.draw(scoresButton, scoresButtonPosX, scoresButtonPosY)
  love.graphics.draw(muteButton, 460, 10) 
    love.graphics.setColor(52,56,56)
  love.graphics.print("0", 280, 355)
end



function Menu_mousepressed(x, y, button)
  
  if mouseRectCollide(x,y,button,460,10,50,50,1) then
    if (mute ==false) then
      mute = true
    else 
      mute = false
    end
  elseif timer < 0 and
  mouseRectCollide(x, y, button, 0, 0, 540, 960, 1) then
    
    buttonPressSound:play()
    Player_Load()
    Map_Load()
    MainGame_Load()
    gamestate = "game"

  
  
  --elseif mouseRectCollide(x, y, button, 70, 400, 400, 130, 1) then
    --gamestate = "scores"

  end
end

function Menu_keypressed(key)
  
end