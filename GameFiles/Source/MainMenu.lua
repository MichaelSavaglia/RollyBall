
function Menu_Load()
  
  introScreen = love.graphics.newImage("sprites/menu.png")
  options = love.graphics.newImage("sprites/options.png")
  optionsY = 960
  optionsActive = false
  arrowUp = love.graphics.newImage("sprites/arrowUp.png")
  arrowDown = love.graphics.newImage("sprites/arrowDown.png")
  soundOn = love.graphics.newImage("sprites/soundOn.png")
  soundOff = love.graphics.newImage("sprites/soundOff.png")

  love.graphics.setFont(mainFont)
  timer = 1

end

function Menu_Update(dt)
  timer = timer - 0.1
  
  if(optionsActive == true) then
    optionsY = optionsY - 36
  end
  if(optionsY < 0) then
    optionsY = 0
  end
  
  if(optionsActive == false) then
    optionsY = optionsY + 36
  end
  if(optionsY > 960) then
    optionsY = 960
  end
end

function Menu_Draw()
  
  love.graphics.draw(introScreen, 0, 0)
  if(mute == true) then
    love.graphics.draw(soundOff, 220, 200) 
  else
    love.graphics.draw(soundOn, 220, 200) 
  end
  love.graphics.setColor(52,56,56)
  love.graphics.setFont(mainFont)
  love.graphics.print("0", 280, 355)
  love.graphics.draw(options, 0, optionsY)
  if(optionsY > 480) then
    love.graphics.draw(arrowUp, 220, 880)
  elseif(optionsY < 480) then
    love.graphics.draw(arrowDown, 220, 880)
  end
end



function Menu_mousepressed(x, y, button)
  
  if mouseRectCollide(x,y,button,220,200,100,100,1) then
    if (mute ==false) then
      mute = true
    else 
      mute = false
    end
  elseif mouseRectCollide(x,y,button,220,860,100,100,1) and optionsActive == false then
    optionsActive = true
  elseif mouseRectCollide(x,y,button,220,860,100,100,1) and optionsActive == true then
    optionsActive = false
  elseif timer < 0 and mouseRectCollide(x, y, button, 0, 0, 540, 960, 1) and optionsActive == false then
    buttonPressSound:play()
    Player_Load()
    Map_Load()
    Map_Load(colour)
    MainGame_Load()
    gamestate = "game"
  end
end

function Menu_keypressed(key)
  
end