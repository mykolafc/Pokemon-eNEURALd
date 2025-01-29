-- Generative Neural Network for Pokemon Emerald Auto Battling by Mykola Forest-Chomyn
-- Inspired by the work of SethBling and his MarI/O project

Filename = "Pokemon - Emerald Version (USA, Europe).gba"

inputs = {
    ["A"] = false,
    ["B"] = false,
    ["L"] = false,
    ["R"] = false,
    ["Up"] = false,
    ["Down"] = false,
    ["Left"] = false,
    ["Right"] = false,
    ["Select"] = false,
    ["Start"] = false,
}





while true do
    joypad.set(inputs)
    emu.frameadvance()
end