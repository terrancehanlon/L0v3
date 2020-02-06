--love.load
--love.update -> love.draw

-- bottom pillars = Screen_Size_Y - desiredSizeOfPillar  


require "math"


--start
ballX = 100
ballY = 100

ballX_speed = 350
ballY_speed = 590
jump_y = 50

goingLeft = false
goingRight = true
goingUp = false
goingDown = true

screenX = 1000
screenY = 1000

itemsTop = {}
itemsBot = {}

numOfPillars = 5
maxPillarSize = 300


--this variable extends outside the screen by this number of pixels, just to give it a more immersive feeling
pillarPadding = 15

paddleX = screenX / 2
paddleY = screenY - 75

paddleSizeX = 75
paddleSizeY = 15

paddleSpeedX = 350
function love.load()
  
  --world = love.physics.newWorld(0, 200, true)  
  love.window.setFullscreen(true)
  love.graphics.setBackgroundColor(0, 255, 255, 50)
  
  screenX = love.graphics.getWidth()
  screenY = love.graphics.getHeight()
  
  local i = 0
  while (i < numOfPillars) 
  do
    itemsTop[i] = { x = math.random() * screenX, 
                    length = math.random() * maxPillarSize
                  }
    itemsBot[i] = { x = math.random() * screenX,
                    length = math.random() * maxPillarSize
                  }
    i = i + 1
  end
end

function collision()
     -- print('ball x: ' .. ballX .. ' ball y: ' .. ballY)
      --print('paddle x: ' .. paddleX .. ' paddle y: ' .. paddleY)
    if ballX <= (paddleX + paddleSizeX) and ballX >= paddleX then
      if ballY <= (paddleY + paddleSizeY) and ballY >= paddleY then
          return true
      end
      return false
  end
  return false
end

function love.update(dt)
  --world:update(dt)
  -- if love.keypressed
  -- if love.keyboard.isDown("space") then
    
    if love.keyboard.isDown("a") == true then
      paddleX = paddleX - paddleSpeedX * dt
    end
    
    if love.keyboard.isDown("d") == true then
      paddleX = paddleX + paddleSpeedX * dt
    end
         
    if ballX >= screenX then
      goingLeft = true
      goingRight = false
    end
    
    if ballY <= 0 then
      goingDown = true
      goingUp = false
    end
    
    if ballY >= screenY then
      goingUp = true
      goingDown = false
    end
    
    
    if ballX <= 0 then
      goingLeft = false
      goingRight = true
    end

    
    if collision() == true then
      print('ball x: ' .. ballX .. ' ball y: ' .. ballY)
      print('paddle x: ' .. paddleX .. ' paddle y: ' .. paddleY)
      goingUp = true
      goingDown = false
    end
    
    if goingLeft then
      ballX = ballX - 300 * dt
    elseif goingRight then
      ballX = ballX + ballX_speed * dt
    end
    
    if goingDown then
      ballY = ballY + ballY_speed * dt
    elseif goingUp then
      ballY = ballY - ballY_speed * dt
    end
    
  
  
end

--function love.keyreleased(key)
   --if key == "space" then
      --print('can do stuff here space')
    --  ballY = ballY - ballY_speed
  -- end
--end


function love.draw()
    love.graphics.print("Hello World!", 1000, 1000)
    love.graphics.circle("fill", ballX, ballY, 50, 25)
    --love.graphics.rectangle('fill', 150, (screenY - 100), 25, 105)
    love.graphics.rectangle('fill', paddleX, paddleY, paddleSizeX, paddleSizeY)
    
    --local i = 0;
    
    --while (i < numOfPillars) 
    --do
      --love.graphics.rectangle('fill', itemsTop[i].x, 0, 25, itemsTop[i].length)
    --love.graphics.rectangle('fill', itemsBot[i].x, screenY - itemsBot[i].length, 25, itemsBot[i].length + pillarPadding)
      --i = i + 1
    --end
  
end