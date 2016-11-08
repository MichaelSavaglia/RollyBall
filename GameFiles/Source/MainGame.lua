require "Source/PlayerController"
require "Source/MapGeneration"


function MainGame_Load()
  Player_Load()
  Map_Load()  

  score = 0
  
  scoreRect = {x = 7,
    y = 4,
    width = 100,
    height = 40 } 
end

function MainGame_Update(dt)
  Player_Update(dt)
  Map_Update(dt)
  --score = score + 1
  for i, score, name in highscore() do

   print(name, score)
  end
end

function MainGame_Draw()
  Map_Draw()
  Player_Draw()

  love.graphics.setFont(boldFont)
  love.graphics.setColor(52,56,56)
  love.graphics.rectangle("fill", scoreRect.x, scoreRect.y, scoreRect.width, scoreRect.height)
  love.graphics.setColor(0,95,107)
  love.graphics.print(score, 10, 10)
end
