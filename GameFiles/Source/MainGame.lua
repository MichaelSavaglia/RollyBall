require "Source/PlayerController"
require "Source/MapGeneration"

function MainGame_Load()
  Player_Load()
  Map_Load()   
end

function MainGame_Update(dt)
  Player_Update(dt)
  Map_Update(dt)
end

function MainGame_Draw()
  Map_Draw()
  Player_Draw()
end
