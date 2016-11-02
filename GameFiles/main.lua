function love.load()


  love.resize(love.graphics.getDimensions())
    
    
  require "Source/MainMenu"
  require "Source/MapGeneration"
  require "Source/MainGame"
  require "Source/CollisionHandler"
  require "Source/PlayerController"
  require "Source/Gameover"
    
  

  gamestate = "startScreen"
  
  Menu_Load()
  MainGame_Load()
  Map_Load()
  MainGame_Load()
  Gameover_Load()
end

function love.draw()
love.graphics.setColor(255, 255,255)
  if(gamestate == "startScreen") then
    
    Menu_Draw()
    
  elseif(gamestate == "game") then
    
    Map_Draw()
    MainGame_Draw()
    
  elseif(gamestate == "death") then
    Gameover_Draw()
    
  elseif(gamestate == "scores") then
    
  end
  
end

function love.update(dt)
  if(gamestate == "startScreen") then
    
    Menu_Update()
    
  elseif(gamestate == "game") then
    
    MainGame_Update(dt)
    Map_Update(dt)
    
  elseif(gamestate == "death") then
    
    Gameover_Update()
    
  elseif(gamestate == "scores") then
    
  end

end

function love.mousepressed(x, y, button)
  if gamestate == "startScreen" then
    Menu_mousepressed(x,y,button)
  elseif gamestate == "game" then
    Player_mousepressed(x, y, button)
  elseif gamestate == "death" then
    Gameover_mousepressed(x, y, button) 
  end
end

function love.touchpressed(id, x,y, dx, dy, pressure)
  
  if gamestate == "startScreen" then
    Menu_mousepressed(x,y, 1)
  elseif gamestate == "game" then
    Player_mousepressed(x, y, 1)
  elseif gamestate == "death" then
    Gameover_mousepressed(x, y, 1) 
  end
end

function love.touchreleased(id, x,y,dx,dy, pressure)
  if gamestate == "starscreen" then
  
  elseif gamestate == "game" then
    Player_mousereleased(x, y, 1)
  end
end



function love.mousereleased(x, y, button)
  if gamestate == "starscreen" then
  
  elseif gamestate == "game" then
    Player_mousereleased(x, y, button)
  end
end

function love.keypressed(key)
  if key == "escape" then
    gamestate = "startScreen"
  end
end

function love.resize(w, h)
  width = w
  height = h
  scale = height / 1024
end



