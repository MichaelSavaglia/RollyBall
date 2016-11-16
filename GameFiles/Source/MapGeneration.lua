function Map_Load(image)   
  require "Source/TileConfig"
  require "Source/PlayerController"
  require "Source/CollisionHandler"
  Tiles_Load()
  
  collisionRadius = 16
  
  if(image == 0) then
    bgRed = 208
    bgGreen = 244
    bgBlue = 234
  elseif (image == 1) then
    bgRed = 254
    bgGreen = 232
    bgBlue = 138
  elseif (image == 2) then
    bgRed = 200
    bgGreen = 225
    bgBlue = 200
  elseif (image == 3) then
    bgRed = 216 
    bgGreen = 191
    bgBlue = 216
  end
  
  increment = 2
  change = 5
  currentTile = 2
  previousTile = 2
  math.randomseed( os.time() )
  newTile = math.random(5) - 1
end

function Map_Update(dt)
  tileGeneration()
  
  tileCollision()
end

function Map_Draw()
  love.graphics.setColor(bgRed, bgGreen, bgBlue)
  love.graphics.rectangle("fill", 0, 0, 540, 960)
  love.graphics.setColor(255, 255,255)
  
  for i = 0, 9 do --iterates rows
    
    for j = 0, 4 do --iterates tiles in row
      
      if (tile[i][j].blockActive == true) then
        if(colour == 0) then
          love.graphics.draw(blueTile, tile[i][j].x, tile[i].rowY)
        elseif (colour == 1) then
          love.graphics.draw(orangeTile, tile[i][j].x, tile[i].rowY)
        elseif (colour == 2) then
          love.graphics.draw(greenTile, tile[i][j].x, tile[i].rowY)
        elseif (colour == 3) then
          love.graphics.draw(redTile, tile[i][j].x, tile[i].rowY)
        end
      end
    end
    
  end
end

function tileGeneration()
  for i = 0, 9 do --iterates rows
    tile[i].rowY = tile[i].rowY + increment
    if (tile[i].rowY >= 972) then -- move rows to top
      score = score + 1
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
end

function tileCollision()
  for i = 0, 9 do
    for j = 0, 4 do
      if tile[i][j].blockActive == true and
      tile[i].rowY > 500 and
      circleRectangleCollide(circle.x, circle.y, collisionRadius, tile[i][j].x, tile[i].rowY, tileWitdth, tileHeight) then
        Gameover_Load()
        gamestate = "death"
      end
    end
  end
end