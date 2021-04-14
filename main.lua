function love.load()
  arenaWidth = 800
  arenaHeight = 600

  positionOffset = 10
  paddleWidth = 10
  paddleHeight = 100
  leftPaddlePosition = 0
  rightPaddlePosition = 0

  ballPositionX = 400
  ballPositionY = 300
end

function love.update(dt)
  --Exits game on pressing ESCAPE
  if love.keyboard.isDown('escape') then
    love.event.quit()
  end

  --Player 1 (left paddle)
  if love.keyboard.isDown('w') then
    leftPaddlePosition = leftPaddlePosition - 10;
  end
  if love.keyboard.isDown('s') then
    leftPaddlePosition = leftPaddlePosition + 10;
  end
  if leftPaddlePosition < 0 then
    leftPaddlePosition = 0
  end
  if leftPaddlePosition > arenaHeight - 100 then
    leftPaddlePosition = arenaHeight - 100
  end
  
  --Player 2 (right paddle)
  if love.keyboard.isDown('up') then
    rightPaddlePosition = rightPaddlePosition - 10;
  end
  if love.keyboard.isDown('down') then
    rightPaddlePosition = rightPaddlePosition + 10;
  end
  if rightPaddlePosition < 0 then
    rightPaddlePosition = 0
  end
  if rightPaddlePosition > arenaHeight - 100 then
    rightPaddlePosition = arenaHeight - 100
  end

  --The Ball


end

function love.draw()
  --Sets primary colors to WHITE, just like classic pong.
  love.graphics.setColor(255, 255, 255)
  
  --Player 1/Left Player
  love.graphics.rectangle('fill', positionOffset, leftPaddlePosition, paddleWidth, paddleHeight)

  --Player 2/Right Player
  love.graphics.rectangle('fill', arenaWidth - paddleWidth - positionOffset, rightPaddlePosition, paddleWidth, paddleHeight)

  --The Ball
  love.graphics.rectangle('fill', arenaWidth / 2, arenaHeight / 2, 10, 10)
end
