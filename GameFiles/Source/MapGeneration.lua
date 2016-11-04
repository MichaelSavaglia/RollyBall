function Map_Load()   
  require "Source/TileConfig"
  require "Source/PlayerController"
  require "Source/CollisionHandler"
  tileImage = love.graphics.newImage("sprites/walltile.png")
  Tiles_Load()
  
  increment = 3
  change = 5
  currentTile = 2
  previousTile = 2
  math.randomseed( os.time() )
  newTile = math.random(5) - 1
end

function Map_Update(dt)
  for i = 0, 9 do --iterates rows
    tile[i].rowY = tile[i].rowY + increment
    if (tile[i].rowY >= 972) then -- move rows to top
      tile[i].rowY = -104
      change = change - 1
    end
  
    if(tile[i].rowY == -104) then -- only alter rows that have been moved to the top
      --generate new column
      if (change == 0) then -- change to new column if change is zero
        change = 4
        
        while newTile == currentTile do 
          newTile = math.random(5) - 1
        end
        currentTile = newTile
        
        for j = 0, 4 do -- iterate through tiles in this row
          if(currentTile > previousTile) then 
            if (j >= previousTile and j <= currentTile) then
              tile[i][j].blockActive = false
            else
              tile[i][j].blockActive = true
            end
          elseif(currentTile < previousTile) then
            if (j >= currentTile and j <= previousTile) then
              tile[i][j].blockActive = false
            else
              tile[i][j].blockActive = true
            end
          end
        end
        
        previousTile = newTile
        
      else -- keep new rows the same until there is another change ()
        for j = 0, 4 do -- iterate through tiles in this row
          if j == currentTile then
            tile[i][j].blockActive = false
          else
            tile[i][j].blockActive = true
          end
          
          
        end
      end
    end
    
    
    
  end
  
  for i = 0, 9 do
    for j = 0, 4 do
      if tile[i][j].blockActive == true and
      tile[i].rowY > 500 and
      circleRectangleCollide(circle.x, circle.y, circle.radiusx, tile[i][j].x, tile[i].rowY, tileWitdth, tileHeight) then
        gamestate = "death"
      end
    end
  end
end

function Map_Draw()
  love.graphics.setColor(52, 56,56)
  love.graphics.rectangle("fill", 0, 0, 540, 960)
  love.graphics.setColor(255, 255,255)
  
  for i = 0, 9 do --iterates rows
    
    for j = 0, 4 do --iterates tiles in row
      
      if (tile[i][j].blockActive == true) then
        love.graphics.draw(tileImage, tile[i][j].x, tile[i].rowY)
      end
    end
    
  end
end