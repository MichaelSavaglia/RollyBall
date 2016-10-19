

function love.load()
  require "Source/MainMenu"
  require "Source/PlayerController"
  require "Source/MainGame"
  require "Source/CollisionHandler"
  
  MainGame_Load()
  Menu_Load()
end


function love.draw()
  Menu_Draw()
  Player_Draw()
  
end

function love.update(dt)
  Player_Update(dt)
end
