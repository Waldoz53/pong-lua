function love.load()
  arenaWidth = 800
  arenaHeight = 600

  positionOffset = 10
  paddleWidth = 10
  paddleHeight = 100
  leftPaddlePosition = 200
  rightPaddlePosition = 400

  ballSize = 10
  ballPositionX = 400
  ballPositionY = 300
  ballVelX = 5
  ballVelY = 2

  player1Score = 0
  player2Score = 0
end

function love.update()
  --Exits game on pressing ESCAPE
  if love.keyboard.isDown('escape') then
    love.event.quit()
  end
  --Restarts game on pressing R
  if love.keyboard.isDown('r') then
    love.event.quit('restart')
  end

  --Player 1 (left paddle)
  if love.keyboard.isDown('w') then
    leftPaddlePosition = leftPaddlePosition - 2;
  end
  if love.keyboard.isDown('s') then
    leftPaddlePosition = leftPaddlePosition + 2;
  end
  if leftPaddlePosition < 0 then
    leftPaddlePosition = 0
  end
  if leftPaddlePosition > arenaHeight - 100 then
    leftPaddlePosition = arenaHeight - 100
  end
  
  --Player 2 (right paddle)
  if love.keyboard.isDown('up') then
    rightPaddlePosition = rightPaddlePosition - 2;
  end
  if love.keyboard.isDown('down') then
    rightPaddlePosition = rightPaddlePosition + 2;
  end
  if rightPaddlePosition < 0 then
    rightPaddlePosition = 0
  end
  if rightPaddlePosition > arenaHeight - 100 then
    rightPaddlePosition = arenaHeight - 100
  end

  --The Ball
  ballPositionX = ballPositionX + ballVelX
  ballPositionY = ballPositionY + ballVelY

  if ballPositionY == arenaHeight - ballSize then
    ballVelY = ballVelY * -1
  end
  if ballPositionY == 0 then
    ballVelY = ballVelY * -1
  end
  
  --ball reset logic
  if ballPositionX == 0 then
    ballPositionX = arenaWidth / 2
    ballPositionY = arenaHeight / 2
    player2Score = player2Score + 1
  end
  if ballPositionX == arenaWidth - ballSize then
    ballPositionX = arenaWidth / 2
    ballPositionY = arenaHeight / 2
    player1Score = player1Score + 1
  end

  -- ball collision logic
  if ballPositionX <= 10 and ballPositionY <= leftPaddlePosition + paddleHeight and ballPositionY >= leftPaddlePosition - ballSize then
    ballVelX = ballVelX * -1
    ballPositionX = ballPositionX + 10
  end
  if ballPositionX >= arenaWidth - 20 and ballPositionY <= rightPaddlePosition + paddleHeight and ballPositionY >= rightPaddlePosition - ballSize then
    ballVelX = ballVelX * -1
    ballPositionX = ballPositionX - 10
  end

  if player1Score >= 5 and player1Score > player2Score then
    ballVelX = 0
    ballVelY = 0
  end
  if player2Score >= 5 and player2Score > player1Score then
    ballVelX = 0
    ballVelY = 0
  end
end

function love.draw()
  --Sets primary colors to WHITE, just like classic pong.
  love.graphics.setColor(255, 255, 255)
  
  --Player 1/Left Player
  love.graphics.rectangle('fill', positionOffset, leftPaddlePosition, paddleWidth, paddleHeight)

  --Player 2/Right Player
  love.graphics.rectangle('fill', arenaWidth - paddleWidth - positionOffset, rightPaddlePosition, paddleWidth, paddleHeight)

  --The Ball
  love.graphics.rectangle('fill', ballPositionX, ballPositionY, ballSize, ballSize)

  --Scores
  love.graphics.print('Player 1: ' .. player1Score, arenaWidth / 2 - 100, 20)
  love.graphics.print('Player 2: ' .. player2Score, arenaWidth / 2 + 60, 20)

  --End game message
  if player1Score >= 5 and player1Score > player2Score then
    love.graphics.print('Player 1 wins!\nPress R to restart', arenaWidth / 2 - 40, 50)
  end
  if player2Score >= 5 and player2Score > player1Score then
    love.graphics.print('Player 2 wins!\nPress R to restart', arenaWidth / 2 - 40, 50)
  end
end
