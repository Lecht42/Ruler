local pointA_sprite = {
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
    key_sequence = "SHIFT + C",
    consuming = "none"
}

local pointB_hotkey = {
    type = "custom-input",
    name = "ruler-set-pointB",
    key_sequence = "mouse-button-1",
    consuming = "none"
}


data:extend{pointA_sprite, pointA_hotkey, pointB_hotkey}