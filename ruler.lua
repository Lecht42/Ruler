local invisible = {r=0, g=0, b=0, a=0}

local rulerHotkey = {
    type = "custom-input",
    name = "ruler-hotkey",
    key_sequence = "SHIFT + C",
    consuming = "none"
}

local mouseMemorizer = {
    type = "custom-input",
    name = "mouse-memorizer",
    key_sequence = "mouse-button-1",
    consuming = "none"
}

local ruler = {
    type = "selection-tool",
    name = "ruler-selection",
    stack_size = 1,
    icon = "__base__/graphics/icons/fluid/barreling/barrel-empty.png",
    icon_size = 32,
    selection_color = invisible,
    alt_selection_color = invisible,
    selection_mode = "nothing",
    alt_selection_mode = "any-tile",
    selection_cursor_box_type = "pair",
    alt_selection_cursor_box_type = "pair",
}

data:extend{ruler, rulerHotkey, mouseMemorizer}