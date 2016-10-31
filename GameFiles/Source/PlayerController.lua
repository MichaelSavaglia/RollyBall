function Player_Load()
  require "Source/CollisionHandler"
  
  player = love.graphics.newImage("sprites/ball.png")
  slider = love.graphics.newImage("sprites/slider.png")
  
  -- Temporary data structures for rectangle at bottom and player circle
  rect = {
    x = 0,
    y = 860,
    width = 540,
    height = 100 }
  
  circle = {
    x = 270,
    y = 700,
    radiusx = 30,
    radiusy = 30 }
  
  dragging = false
  test = false
end


function Player_Update(dt)
  -- Set circle position to where click occured
  if dragging == true then
    circle.x = love.mouse.getX()
  end
  
  --if circleRectangleCollide(circle.x, circle.y, circle.radiusx, rectangle.x, rectangle.y, rectangle.width, rectangle.height) then
   
  
end


function Player_Draw()
  -- Draws data structures (temp)
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle("fill", rect.x, rect.y, rect.width, rect.height)
  -- reset color
  love.graphics.setColor(255,255,255)
  love.graphics.rectangle("fill", rect.x, rect.y + 14, rect.width, rect.height - 28)
    -- reset color
  love.graphics.setColor(255,255,255)
  love.graphics.draw(player, circle.x - circle.radiusx, circle.y - circle.radiusy)
  love.graphics.draw(slider, circle.x - 65, 870)
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