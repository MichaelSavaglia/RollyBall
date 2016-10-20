function love.load()
  require "Source/MainMenu"
  require "Source/MapGeneration"
  require "Source/MainGame"
  require "Source/CollisionHandler"
  
  gamestate = "game"
  
  Menu_Load()
  MainGame_Load()
  Map_Load()
end


function love.draw()
  if(gamestate == "startScreen") then
    
    Menu_Draw()
    
  elseif(gamestate == "game") then
    Map_Draw()
    MainGame_Draw()
  end
  
end

function love.update(dt)
  if(gamestate == "intro") then
    
    Menu_Update()
    
  elseif(gamestate == "game") then
    MainGame_Update(dt)
    Map_Update(dt)
  end
end
