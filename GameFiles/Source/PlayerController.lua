function Player_Load()
  
  -- Temporary data structures for rectangle at bottom and player circle
  rect = {
    x = 0,
    y = 860,
    width = 540,
    height = 100 }
  
  circle = {
    x = 250,
    y = 800,
    radiusx = 30,
    radiusy = 30 }
  
  dragging = false
end


function Player_Update(dt)
  -- Set circle position to where click occured
  if dragging == true then
    circle.x = love.mouse.getX()
  end
end


function Player_Draw()
  -- Draws data structures (temp)
  love.graphics.setColor(255,255,255)
  love.graphics.rectangle("fill", rect.x, rect.y, rect.width, rect.height)
  love.graphics.ellipse("fill", circle.x, circle.y, circle.radiusx, circle.radiusy)
end


function love.mousepressed(x, y, button)
  -- Check if left mouse button pressed, if it is, set dragging to true
  if button == 1
  and x > rect.x and x < rect.x + rect.width
  and y > rect.y and y < rect.y + rect.height
  then
    dragging = true
  end
end


function love.mousereleased(x, y, button)
  -- resets dragging once mouse released
  if button == 1 then 
    dragging = false
  end
end
