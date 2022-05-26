local rulerStartHotkey = {
    type = "custom-input",
    name = "ruler-start",
    key_sequence = "SHIFT + S",
    consuming = "none"
}

local rulerEndHotkey = {
    type = "custom-input",
    name = "ruler-end",
    key_sequence = "SHIFT + A",
    consuming = "none"
}

data:extend{rulerStartHotkey}