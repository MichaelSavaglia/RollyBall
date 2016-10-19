function Map_Load()

   player = love.graphics.newImage("sprites/ball.png")
   
   -- Tiles 108px by 50px 
   -- 100 tiles on screen at once
   
   --Code to fill screen with wallTiles
     i = 0
     y = 0
   wallTiles = {}
   for x=0,99 do
     wallTile = {}
     i = i + 1
     if i > 4 then
       i = 0
     end
     y = y + 1
     if y > 10 then
       y = 0
       end
     wallTile.graph = love.graphics.newImage("sprites/walltile.png")
     wallTile.posX = 108 * i
     wallTile.posY = love.graphics.getHeight() - 96 * y
  table.insert(wallTiles, wallTile)
end
-- Code to generate Path tiles
i = 0
  pathTiles = {}
  for i=0,10 do
  pathTile = {}

  pathTile.graph = love.graphics.newImage("sprites/pathtile.png")
  pathTile.posX = love.graphics.getWidth() /2 - 50
  pathTile.posY = love.graphics.getHeight() -96 * i
  table.insert(pathTiles, pathTile)
  end
end
function Map_Update(dt)

end

function Map_Draw()
  for i,v in ipairs(wallTiles) do
  love.graphics.draw(v.graph,v.posX,v.posY)
end
for i,v in ipairs(pathTiles) do
  love.graphics.draw(v.graph,v.posX,v.posY)
  end
  love.graphics.draw(player,love.graphics.getWidth()/2 - 24,love.graphics.getHeight()-75)
  
end
