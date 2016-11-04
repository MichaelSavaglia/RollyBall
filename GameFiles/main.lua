function love.load()
  require "Source/MainMenu"
  require "Source/MapGeneration"
  require "Source/MainGame"
  require "Source/CollisionHandler"
  require "Source/PlayerController"
  require "Source/Gameover"
    
  mute = false
  mainGameMusic = love.audio.newSource("Sounds/GameMusic2.mp3")
  menuMusic = love.audio.newSource("Sounds/GameMusic1.mp3")
  gameOverSound = love.audio.newSource("Sounds/GameOver.wav")
 
  
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
    if (mute == false) then
    mainGameMusic:pause()
    menuMusic:play()
    menuMusic:setLooping(true)
    else menuMusic:pause()
  end
    Menu_Update()
    
  elseif(gamestate == "game") then
    if (mute == false) then
    menuMusic:pause()
    mainGameMusic:play()
    mainGameMusic:setLooping(true)
    else mainGameMusic:pause()
end

    MainGame_Update(dt)
    Map_Update(dt)
    
  elseif(gamestate == "death") then
    if (mute == false) then
    mainGameMusic:pause()
    gameOverSound:play()
    else gameOverSound:pause()
  end
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
  if key == "m" then
    if (mute == false) then
      mute = true
    else mute = false
      end
end
end


