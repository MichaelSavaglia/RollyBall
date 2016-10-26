function Menu_Load()
  
  introScreen = love.graphics.newImage("sprites/startScreen.png")
  startButton = love.graphics.newImage("sprites/startButton.png")
  startButtonPosX = 70
  startButtonPosY = 200
  scoresButton = love.graphics.newImage("sprites/scoresButton.png")
  scoresButtonPosX = 70
  scoresButtonPosY = 400
end

function Menu_Update(dt)
  
  
end

function Menu_Draw()
  
  love.graphics.draw(introScreen, 0, 0)
  love.graphics.draw(startButton, startButtonPosX, startButtonPosY)
  love.graphics.draw(scoresButton, scoresButtonPosX, scoresButtonPosY)
  
end
