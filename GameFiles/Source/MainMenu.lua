function Menu_Load()

end

function Menu_Update(dt)

end

function Menu_Draw()
  love.graphics.setColor(0,0,0);
  love.graphics.rectangle("fill", 0, 0, 360, 720 )
  love.graphics.setColor(255,255,255);
  love.graphics.ellipse("fill", 300, 300, 50, 50, 100)
end
