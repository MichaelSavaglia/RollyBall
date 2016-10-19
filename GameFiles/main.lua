function love.load()
  require "Source/MainMenu"
  require "Source/MapGeneration"
  require "Source/MainGame"
  Menu_Load()
  Map_Load()
end


function love.draw()
  Map_Draw()
  Menu_Draw()
end

function love.update(dt)

end
