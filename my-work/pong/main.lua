
push = require 'push'  --[[ A library ]]

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRT_WIDTH = 432
VIRT_HEIGHT = 243

function love.load()
    --[[    love.window.setMode( WINDOW_WIDTH, WINDOW_HEIGHT, {
            fullscreen = false,
            resizable = false,
            vsync = true
        })
    ]]
    love.graphics.setDefaultFilter( 'nearest', 'nearest' )

    smallFont = love.graphics.newFont( 'font.ttf', 8 )
    love.graphics.setFont( smallFont )

    push:setupScreen( VIRT_WIDTH, VIRT_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    } )
end

function love.keypressed()
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    --[[ love.graphics.printf(
        'Hello Vishal!',
        0,
        WINDOW_HEIGHT / 2,
        WINDOW_WIDTH,
        'center')
    ]]
    push:apply( 'start' )

    love.graphics.clear( 40 / 255, 45 / 255, 52 / 255, 255 / 255 )

    love.graphics.printf(
        'Hello Procedural Pong!',
        0,
        20,
        VIRT_WIDTH,
        'center'
    )

    love.graphics.rectangle( 'fill', 10, 30, 5, 20 )
    love.graphics.rectangle( 'fill', VIRT_WIDTH - 10, VIRT_HEIGHT - 50, 5, 20 )
    love.graphics.rectangle( 'fill', VIRT_WIDTH / 2 - 2, VIRT_HEIGHT / 2 - 2, 4, 4 )

    push:apply( 'end' )
end

