local point_sprite = {
    filename = "__ruler__/graphics/point.png",
    name = "point-sprite",
    type = "sprite",
    priority = "extra-high",
    width = 64,
    height = 64,
    size = 32,
    shift = {0, 0}
}

local pointA_hotkey = {
    type = "custom-input",
    name = "ruler-set-pointA",
    localised_name = {"controls.start-measuring"},
    key_sequence = "SHIFT + C",
    consuming = "none"
}

local pointB_hotkey = {
    type = "custom-input",
    name = "ruler-set-pointB",
    localised_name = {"controls.end-measuring"},
    key_sequence = "mouse-button-1",
    consuming = "none",
    linked_game_control = "build"
}

data:extend{point_sprite, pointA_hotkey, pointB_hotkey}
