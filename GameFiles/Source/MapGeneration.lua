function Map_Load()   
  require "Source/TileConfig"
  tileImage = love.graphics.newImage("sprites/wallTile.png")
end

function Map_Update(dt)
  for i = 0, 11 do
    rows[i].y = rows[i].y + (100 * dt)
    if (rows[i].y > 1188) then
      rows[i].y = 0 - tileHeight   
    end
  end

end

function Map_Draw()
  love.graphics.setColor(255, 255,255)
  for i = 0, 11 do
    for j = 0, 4 do
      if (squares[j].blockActive == true) then
        love.graphics.draw(tileImage, rows[i].tile[j].x, rows[i].y)
      else
        --set empty tiles to white
        love.graphics.rectangle("fill", squares[j].x, (i-1) * tileHeight, tileWitdth, tileHeight)
      end
    end
  end
end