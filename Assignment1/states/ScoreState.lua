--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--Display medal images (ASSIGNMENT REQUIREMENT)

local GOLD_MEDAL_IMAGE = love.graphics.newImage('GoldMedal.png')
local SILVER_MEDAL_IMAGE = love.graphics.newImage('SilverMedal.png')
local BRONZE_MEDAL_IMAGE = love.graphics.newImage('BronzeMedal.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)

    -- Defined the score requirements to achieve and display medals at the end of a playthrough (ASSIGNMENT REQUIREMENT)
    if self.score >= 20 then -- gold medal acieved
        love.graphics.draw(GOLD_MEDAL_IMAGE, VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, 0, 1, 1, GOLD_MEDAL_IMAGE:getWidth()/2, GOLD_MEDAL_IMAGE:getHeight()/2)
        love.graphics.printf('Congratulations, you win the gold medal!', 0, 32, VIRTUAL_WIDTH, 'center')

    elseif self.score >= 10 and self.score < 20 then -- silver medal achieved
        love.graphics.draw(SILVER_MEDAL_IMAGE, VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, 0, 1, 1, SILVER_MEDAL_IMAGE:getWidth()/2, SILVER_MEDAL_IMAGE:getHeight()/2)
        love.graphics.printf('Congratulations, you win the silver medal!', 0, 32, VIRTUAL_WIDTH, 'center')

    elseif self.score >= 5 and self.score < 10 then -- bronze medal achieved
        love.graphics.draw(BRONZE_MEDAL_IMAGE, VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, 0, 1, 1, BRONZE_MEDAL_IMAGE:getWidth()/2, BRONZE_MEDAL_IMAGE:getHeight()/2)
        love.graphics.printf('Congratulations, you win the bronze medal!', 0, 32, VIRTUAL_WIDTH, 'center')
    else

    love.graphics.printf('You did not win a medal. Better luck next time', 0, 32, VIRTUAL_WIDTH, 'center')
    end

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 180, VIRTUAL_WIDTH, 'center')
end