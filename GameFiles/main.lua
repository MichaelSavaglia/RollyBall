function love.load()

  windowWidth = 540
  windowHeight = 1920/2
  
  if love.system.getOS() == "Android" then
    local x, y = love.graphics.getDimensions()
    scalex = (x/windowWidth)
    scaley = (y/windowHeight)
  else
    scalex = 1
    scaley = 1
  end
  
  love.window.setMode(windowWidth * scalex, windowHeight * scaley)
    
  mainFont = love.graphics.newFont("Fonts/gamefont.ttf", 24)
  love.graphics.setFont(mainFont)
  
  boldFont = love.graphics.newFont("Fonts/gamefontbold.ttf", 24)
  

  
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
  love.graphics.scale(scalex,scaley)
  --reset color every frame
  love.graphics.setColor(255, 255,255)
  if(gamestate == "startScreen") then
    
    Menu_Draw()
    
  elseif(gamestate == "game") then
    
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
    
    
  elseif(gamestate == "death") then
    
    Gameover_Update()
    
  elseif(gamestate == "scores") then
    
  end

end

function love.mousepressed(x, y, button)
  x = x/scalex
  y = y/scaley
  if gamestate == "startScreen" then
    Menu_mousepressed(x,y,button)
  elseif gamestate == "game" then
    Player_mousepressed(x, y, button)
  elseif gamestate == "death" then
    Gameover_mousepressed(x, y, button) 
  end
end

function love.touchpressed(id, x,y, dx, dy, pressure)
  x = x/scalex
  y = y/scaley
  if gamestate == "startScreen" then
    Menu_mousepressed(x,y, 1)
  elseif gamestate == "game" then
    Player_mousepressed(x, y, 1)
  elseif gamestate == "death" then
    Gameover_mousepressed(x, y, 1) 
  end
end

function love.touchreleased(id, x,y,dx,dy, pressure)
  x = x/scalex
  y = y/scaley
  if gamestate == "starscreen" then
  
  elseif gamestate == "game" then
    Player_mousereleased(x, y, 1)
  end
end



function love.mousereleased(x, y, button)
  x = x/scalex
  y = y/scaley
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




