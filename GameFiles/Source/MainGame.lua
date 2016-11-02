require "Source/PlayerController"
require "Source/MapGeneration"

function MainGame_Load()
  Player_Load()
  Map_Load()  
  scoreFont = love.graphics.newFont("Fonts/scoreFont.ttf", 24)
  love.graphics.setFont(scoreFont)
  score = 0
end

function MainGame_Update(dt)
  Player_Update(dt)
  Map_Update(dt)
  score = score + 1
end

function MainGame_Draw()
  Map_Draw()
  Player_Draw()
  love.graphics.setColor(0,0,0)
  love.graphics.print(score, 8.5, 9.5, 0, 1.08, 1.08)
  love.graphics.setColor(255,0,0)
  love.graphics.print(score, 10, 10)
end
