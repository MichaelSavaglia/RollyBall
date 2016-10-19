

function love.load()
  require "Source/MainMenu"
  require "Source/PlayerController"
  Player_Load()
end


function love.draw()
  Player_Draw()
end

function love.update(dt)
  Player_Update()
end
