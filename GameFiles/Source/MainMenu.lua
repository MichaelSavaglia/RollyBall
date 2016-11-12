
function Menu_Load()
  
  introScreen = love.graphics.newImage("sprites/menu.png")
  options = love.graphics.newImage("sprites/options.png")
  optionsY = 960
  optionsActive = false
  arrowUp = love.graphics.newImage("sprites/arrowUp.png")
  arrowDown = love.graphics.newImage("sprites/arrowDown.png")
  arrowX = 220
  arrowY = 880
  selector = love.graphics.newImage("sprites/selector.png")
  selectX = 0
  selectY = 0
  soundOn = love.graphics.newImage("sprites/soundOn.png")
  soundOff = love.graphics.newImage("sprites/soundOff.png")
  muteX = 420
  muteY = 840
  blueTile = love.graphics.newImage("sprites/walltile_blue.png")
  orangeTile = love.graphics.newImage("sprites/walltile_Orange.png")
  greenTile = love.graphics.newImage("sprites/walltile_Green.png")
  redTile = love.graphics.newImage("sprites/walltile_Red.png")  

  love.graphics.setFont(mainFont)
  timer = 1
  
  for i, score, name in highscore() do
    hiScore = score
    
  end

end

function Menu_Update(dt)
  timer = timer - 0.1
  
  selectX = (colour * 108) + 44
  selectY = optionsY + 182
  
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
    love.graphics.draw(soundOff, muteX, muteY) 
  else
    love.graphics.draw(soundOn, muteX, muteY) 
  end
  
  love.graphics.setColor(52,56,56)
  love.graphics.setFont(mainFont)
  love.graphics.print(hiScore, 280, 355)
  love.graphics.setColor(255,255,255)
  love.graphics.draw(options, 0, optionsY)
  
  drawTileSelector()
  
  love.graphics.draw(selector, selectX, selectY)
  
  if(optionsY > 480) then
    love.graphics.draw(arrowUp, arrowX, arrowY)
  elseif(optionsY < 480) then
    love.graphics.draw(arrowDown, arrowX, arrowY)
  end
end



function Menu_mousepressed(x, y, button)
  
  if mouseRectCollide(x,y,button,muteX,muteY,100,100,1) and optionsActive == false then
    if (mute ==false) then
      mute = true
    else 
      mute = false
    end
  elseif mouseRectCollide(x,y,button,220,860,100,100,1) and optionsActive == false then
    optionsActive = true
  elseif optionsActive == true then
    if  mouseRectCollide(x,y,button,220,860,100,100,1) then
      optionsActive = false
    elseif mouseRectCollide(x,y,button,54,192,108,108,1) then
      colour = 0 --blue
    elseif mouseRectCollide(x,y,button,162,192,108,108,1) then
      colour = 1 --orange
    elseif mouseRectCollide(x,y,button,270,192,108,108,1) then
      colour = 2 --green    
    elseif mouseRectCollide(x,y,button,378,192,108,108,1) then
      colour = 3 --red
    end
  elseif timer < 0 and mouseRectCollide(x, y, button, 0, 0, 540, 960, 1) and optionsActive == false then
    buttonPressSound:play()
    Player_Load()
    Map_Load(colour)
    MainGame_Load()
    gamestate = "game"
  end
end

function Menu_keypressed(key)
  
end

function drawTileSelector()
  love.graphics.draw(blueTile, 54, optionsY + 192)
  love.graphics.draw(orangeTile, 162, optionsY + 192)
  love.graphics.draw(greenTile, 270, optionsY + 192)
  love.graphics.draw(redTile, 378, optionsY + 192)
end