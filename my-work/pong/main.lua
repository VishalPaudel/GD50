
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

    love.graphics.printf(
        'Hello Pixelated Filter',
        0,
        VIRT_HEIGHT / 2,
        VIRT_WIDTH,
        'center'
    )
    
    push:apply( 'end' )
end

