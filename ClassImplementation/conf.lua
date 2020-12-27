function love.conf(t)
    require("class")
    RENDER_SCALE = 4
    ASSETS_PATH = "assets/"
    IMAGES_PATH = ASSETS_PATH .. "images/"
    t.window.width = 500
    t.window.height = 500
    t.window.fullscreen = false
end
