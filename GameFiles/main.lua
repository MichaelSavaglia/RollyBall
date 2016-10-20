function love.load()
  require "Source/MainMenu"
  require "Source/MapGeneration"
  require "Source/MainGame"
  
  
  gamestate = "game"
  
  
  Menu_Load()
  Map_Load()
  MainGame_Load()
end


function love.draw()
  Map_Draw()
  Menu_Draw()
  MainGame_Draw()
end

function love.update(dt)
  MainGame_Update(dt)

end
