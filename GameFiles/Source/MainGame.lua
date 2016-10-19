require "Source/PlayerController"

function MainGame_Load()
  Player_Load()
end

function MainGame_Update()
  Player_Update(dt)
end

function MainGame_Draw()
  Player_Draw()
end
