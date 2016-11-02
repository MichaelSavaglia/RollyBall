function clampOnRange(x, min, max)
  if x < min then
    return min
  elseif max < x then
    return max
  else
    return x
  end
end

function clampOnRectangle(x, y, rectX, rectY, rectWidth, rectHeight)
  clamp = {}
  clamp.x = clampOnRange(x, rectX, rectX + rectWidth)
  clamp.y = clampOnRange(y, rectY, rectY + rectHeight)
  
  return clamp
end

function circleRectangleCollide(circleX, circleY, circleRadius, rectX, rectY, rectWidth, rectHeight)
  clamped = clampOnRectangle(circleX, circleY, rectX, rectY, rectWidth, rectHeight)
  return circlePointCollide(circleX, circleY, circleRadius, clamped.x, clamped.y)
  
end

function circlePointCollide(circleX, circleY, circleRadius, x, y)
  distanceX = circleX - x
  distanceY = circleY - y
  length = math.sqrt(distanceX * distanceX + distanceY * distanceY)
  return length <= circleRadius
end


function mouseRectCollide(mouseX, mouseY, button, rectX, rectY, rectWidth, rectHeight, reqButton)
  if reqButton == button
  and mouseX > rectX and mouseX < rectX + rectWidth
  and mouseY > rectY and mouseY < rectY + rectHeight
  then
    return true
  end
end
