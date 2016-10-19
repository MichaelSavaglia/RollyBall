function Player_Load()
  rect = {
    x = 100,
    y = 100,
    width = 100,
    height = 100,
    dragging = { active = false, diffx = 0, diffy = 0 }
    }
end

function Player_Update(dt)
  if rect.dragging.active then
    rect.x = love.mouse.getX() - rect.dragging.diffx
    rect.y = love.mouse.getY() - rect.dragging.diffy
  end
end


function Player_Draw()
  love.graphics.rectangle("fill", rect.x, rect.y, rect.width, rect.height)
end


function love.mousepressed(x, y, button)

  if button == 1
  and x > rect.x and x < rect.x + rect.width
  and y > rect.y and y < rect.y + rect.height
  then
    print("TEST")
    rect.dragging.active = true
    rect.dragging.diffx = x - rect.x
    rect.dragging.diffy = y - rect.y
  end
end

function love.mousereleased(x, y, button)
  if button == 1 then 
    rect.dragging.active = false
  end
end


