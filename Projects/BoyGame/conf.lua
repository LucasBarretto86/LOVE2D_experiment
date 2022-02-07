function love.conf(t)
    require("lib.class")
    RENDER_SCALE = 4
    ASSETS_PATH = "assets/"
    IMAGES_PATH = ASSETS_PATH .. "images/"
    SOUNDS_PATH = ASSETS_PATH .. "sounds/"
    SFX_PATH = SOUNDS_PATH .. "sfx/"
    t.window.width = 500
    t.window.height = 500
    t.window.fullscreen = false
end
