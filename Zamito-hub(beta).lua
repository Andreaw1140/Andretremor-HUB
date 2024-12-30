- Load Fluent Library
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/NotLynix/Fluent/main/source.lua"))()

-- Variables
local validKey = "BanuIsReal"  -- Ganti dengan key Anda
local keyInput = ""

-- Fluent UI Creation
local Window = Fluent:Create("ZamitoHub - Key System")
local Tab = Window:Tab("Key System")
local Section = Tab:Section("Validation")

-- Get Key Button
Section:Button("Get Key", function()
    if setclipboard then
        setclipboard("https://linkvertise.com/1272037/key-for-script-andrehub?o=sharing")
        Fluent:Notify("Key Copied", "Key URL has been copied to clipboard!", 3)
    else
        Fluent:Notify("Error", "Your executor does not support clipboard functionality.", 3)
    end
end)

-- Key Input
Section:Textbox("Enter Key", "", function(value)
    keyInput = value
end)

-- Start Script Button
Section:Button("Start Script", function()
    if keyInput == validKey then
        Fluent:Notify("Success", "Key is valid. Loading script...", 3)
        -- Load your main script
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Andreaw1140/Andretremor-HUB/refs/heads/main/Zemito-Hub.lua", true))()
    else
        Fluent:Notify("Error", "Invalid key. Please try again.", 3)
    end
end)

-- Show the UI
Window:Display()
