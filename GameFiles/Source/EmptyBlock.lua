function eBlock_Load()
  eBlock = {}
  eBlock.graph = love.graphics.newImage("sprites/pathtile.png")
  eBlock.empty = true
  eBlock.index = -1
  eBlock.posX = nil
  eBlock.posY = nil
  return eBlock
end
