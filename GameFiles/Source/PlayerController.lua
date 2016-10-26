function Player_Load()
  require "Source/CollisionHandler"
  
  -- Temporary data structures for rectangle at bottom and player circle
  rect = {
    x = 0,
    y = 860,
    width = 540,
    height = 100 }
  
  circle = {
    x = 250,
    y = 910,
    radiusx = 30,
    radiusy = 30 }
  
  rectangle = {
    x = 200,
    y = 200,
    width = 200,
    height = 200 }
  
  dragging = false
  test = false
end


function Player_Update(dt)
  -- Set circle position to where click occured
  if dragging == true then
    circle.x = love.mouse.getX()
  end
  
  if circleRectangleCollide(circle.x, circle.y, circle.radiusx, rectangle.x, rectangle.y, rectangle.width, rectangle.height) then
    test = true
  end
  
end


function Player_Draw()
  -- Draws data structures (temp)
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle("fill", rect.x, rect.y, rect.width, rect.height)
  love.graphics.setColor(100,100,255)
  love.graphics.ellipse("fill", circle.x, circle.y, circle.radiusx, circle.radiusy)
  if test == false then
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", rectangle.x, rectangle.y, rectangle.width, rectangle.height)
  end
end

function Player_mousereleased(x, y, button)
  -- resets dragging once mouse released
  if button == 1 then 
    dragging = false
  end
end

function Player_mousepressed(x, y, button)
  -- Check if left mouse button pressed, if it is, set dragging to true
  if mouseRectCollide(x, y, button, rect.x, rect.y, rect.width, rect.height, 1) then
    dragging = true
  end
end