

function GenerateNewRow()
  require "Source/FilledBlock"
  require "Source/EmptyBlock"
  initialGen = false
  
  fBlock = fBlock_Load()
  eBlock = eBlock_Load()
   y = 0
 rows = {}
 for x=0,11 do
  for i=0,4 do
      row = {}
      row.index = 2
    if initialGen == false then
    if i == 2 then
      row = eBlock_Load()
    else
      row = fBlock_Load()
    end
  end
    row.posX = 108 * i
    row.posY = love.graphics.getHeight() - (96 * x)
    table.insert(rows,row)
    end
  end
  initialGen = true
return rows
end

function UpdateNewRow()
    for i,v in ipairs(rows) do
  v.posY = v.posY + 1
  if v.posY == love.graphics.getHeight() + 96 then
    v.posY = -96
    if v.index == 2 then
      v = eBlock_Load()
      GenerateNewRow()
      end
    end
end
  end

function DrawNewRow()
 
  end