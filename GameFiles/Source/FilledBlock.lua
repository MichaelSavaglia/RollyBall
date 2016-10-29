function fBlock_Load()
  fBlock = {}
  fBlock.graph = love.graphics.newImage("sprites/walltile.png")
  fBlock.empty = false
  fBlock.index = 2
  fBlock.posX = nil
  fBlock.posY = nil
  return fBlock
end

