function Menu_Load()
  introScreen = love.graphics.newImage("sprites/startScreen.png")
  startButton = love.graphics.newImage("sprites/startButton.png")
  startButtonPosX = 100
  startButtonPosY = 400
  scoresButton = love.graphics.newImage("sprites/scoresButton.png")
  scoresButtonPosX = 100
  scoresButtonPosY = 600
end

function Menu_Update(dt)
  
  
  
end

function Menu_Draw()
  
  love.graphics.draw(introScreen, 0, 0)
  love.graphics.draw(startButton, startButtonPosX, startButtonPosY)
  love.graphics.draw(scoresButton, scoresButtonPosX, scoresButtonPosY)
  
end
