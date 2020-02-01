--love.load
--love.update -> love.draw

require "math"


x = 100
y = 100

goingLeft = false
goingRight = true

screenX = 1000
screenY = 1000

itemsTop = {}
itemsBot = {}

numOfPillars = 5
maxPillarSize = 300


function love.load()
    
  love.window.setFullscreen(true)
  
  screenX = love.graphics.getWidth()
  screenY = love.graphics.getHeight()
  
  local i = 0
  while (i < numOfPillars) 
  do
    itemsTop[i] = {  x = math.random() * screenX, 
                  xLength = math.random() * maxPillarSize
                }
        
  
    i = i + 1
  end
  
  
  
end

function love.update(dt)
  
    if love.keyboard.isDown('a') then
    end
    
    if x >= screenX then
      goingLeft = true
      goingRight = false
    end
    
    if x <= 0 then
      goingLeft = false
      goingRight = true
    end
    
    if goingLeft then
      x = x - 300 * dt
    elseif goingRight then
      x = x + 300 * dt
    end
    
end


function love.draw()
    love.graphics.print("Hello World!", 1000, 1000)
    love.graphics.circle("fill", x, y, 50, 25)
    
    love.graphics.rectangle('fill', 150, (screenY - 100), 25, 105)
    
    local i = 0;
    
    while (i < numOfPillars) 
    do
      love.graphics.rectangle('fill', itemsTop[i].x, 0, 25, itemsTop[i].xLength)
      i = i + 1
    end
    
    
end