
push = require 'push'  --[[ A library: Ulydev/push ]]

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRT_WIDTH = 432
VIRT_HEIGHT = 243

PADDLE_SPEED = 200  --[[ The speed of the paddle ]]

function love.load()
    --[[ Commenting out the default method, instead using push script GD50 here, which mush be using something like this ]]
    --[[    love.window.setMode( WINDOW_WIDTH, WINDOW_HEIGHT, {
            fullscreen = false,
            resizable = false,
            vsync = true
        })
    ]]

    --[[ Sets the default filter while scaling down and scaling up respectively ]]
    love.graphics.setDefaultFilter( 'nearest', 'nearest' )

    --[[ font objects are immutable ]]
    smallFont = love.graphics.newFont( 'font.ttf', 8 )  --[[ for the welcome message ]]
    scoreFont = love.graphics.newFont( 'font.ttf', 32 )  --[[ for the scores ]]
    love.graphics.setFont( smallFont )  --[[ changing the default font ]]

    --[[ setting the vitual screen, on the main screen ]]
    push:setupScreen( VIRT_WIDTH, VIRT_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    } )

    --[[ the scores ]]
    player1Score = 0
    player2Score = 0

    --[ the positions of the paddle ]]
    player1Y = 30
    player2Y = VIRT_HEIGHT - 50
end

function love.update( dt )
    --[[ The player movements, I do not understand why this is not inside the event/keypressed ]]
    --[[ traditional ws and up-down ]]

    -- Player 1 movements
    if love.keyboard.isDown( 'w' ) then
        -- closer to Y=0
        player1Y = player1Y + -1 * PADDLE_SPEED * dt
    elseif love.keyboard.isDown( 's' ) then
        -- closer to Y = VIRT_HEIGHT
        player1Y = player1Y + PADDLE_SPEED * dt
    end

    -- Player 2 movement
    if love.keyboard.isDown( 'up' ) then
        -- closer to Y=0
        player2Y = player2Y + -1 * PADDLE_SPEED * dt
    elseif love.keyboard.isDown( 'down' ) then
        player2Y = player2Y + PADDLE_SPEED * dt
    end
end

function love.keypressed()
    --[[ again a default function, we overload ]]
    if key == 'escape' then
        love.event.quit()
    end
end

--[[
    Called after update by love2D
]]
function love.draw()
    --[[ love.graphics.printf(
        'Hello Vishal!',
        0,
        WINDOW_HEIGHT / 2,
        WINDOW_WIDTH,
        'center')
    ]]
    --[[ much like open-gl ]]
    push:apply( 'start' )

    --[[ sets the color in th beginning ]]
    love.graphics.clear( 40 / 255, 45 / 255, 52 / 255, 255 / 255 )

    --[[ the font ]]
    love.graphics.setFont( smallFont )
    love.graphics.printf(
        'Hello Procedural Pong!',
        0,
        20,
        VIRT_WIDTH,
        'center'
    )

    -- drawing the score fonts
    love.graphics.setFont( scoreFont )

    --[[ no matter how we scale, always 50 and 30 ( because the paddle has width of 20 ? ) from center of width ]]
    love.graphics.print( tostring( player1Score ), VIRT_WIDTH / 2 - 50, VIRT_HEIGHT / 3 )
    love.graphics.print( tostring( player2Score ), VIRT_WIDTH / 2 + 30, VIRT_HEIGHT / 3 )

    love.graphics.rectangle( 'fill', 10, player1Y, 5, 20 )  --[[ paddle player1 ]]
    love.graphics.rectangle( 'fill', VIRT_WIDTH - 10, player2Y, 5, 20 )  --[[ paddle player2 ]]
    love.graphics.rectangle( 'fill', VIRT_WIDTH / 2 - 2, VIRT_HEIGHT / 2 - 2, 4, 4 )  --[[ paddle ]]

    push:apply( 'end' )
end
