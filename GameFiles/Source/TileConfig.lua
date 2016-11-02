
function Tiles_Load()
  tileWitdth = 108
  tileHeight = 108

  tile = {}
  for i = 0, 9 do
    tile[i] = {rowY = i * tileHeight}
    for j = 0, 4 do
      if (j == 2) then
        tile[i][j] = {x = j * tileWitdth, blockActive = false}
      else
        tile[i][j] = {x = j * tileWitdth, blockActive = true}
      end
    end
  end
end
