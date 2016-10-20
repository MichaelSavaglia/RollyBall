function love.conf(c)
  c.title = "RollyBall"
  local window = c.screen or c.window -- love 0.9 renamed "screen" to "window"
  window.width = 1080/2
  window.height = 1920/2
end
