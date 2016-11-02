function love.load()
  require "Source/MainMenu"
  require "Source/RowManager"
  require "Source/MainGame"
  require "Source/CollisionHandler"
  require "Source/PlayerController"
  require "Source/Gameover"
    

  gamestate = "startScreen"
  
  Menu_Load()
  MainGame_Load()
  GenerateRow()
  MainGame_Load()
  Gameover_Load()
end

function love.draw()
  --reset color every frame
  love.graphics.setColor(255, 255,255)
  if(gamestate == "startScreen") then
    
    Menu_Draw()
    
  elseif(gamestate == "game") then
    
<<<<<<< HEAD
    DrawRow()  
=======
>>>>>>> 33b2547f17f5932f3952716b74f59c4feb3b4cd5
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
    
    UpdateRow()
    MainGame_Update(dt)
<<<<<<< HEAD
   
=======
    
>>>>>>> 33b2547f17f5932f3952716b74f59c4feb3b4cd5
    
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


