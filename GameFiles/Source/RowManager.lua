
function GenerateRow()
  require "Source/Row"
 -- rows = {}

  row = GenerateNewRow()

end

function DrawRow()
  for i,v in ipairs(rows) do
  love.graphics.draw(v.graph, v.posX, v.posY)
  end
end

function UpdateRow()
  UpdateNewRow()
  end
  