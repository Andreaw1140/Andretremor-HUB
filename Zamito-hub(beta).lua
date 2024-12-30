-- Key validation variables
local validKey = "BanuIsReal" -- Ganti dengan key valid Anda
local keyInput = ""

Tabs.Main:AddInput("KeyInput", {
    Title = "Enter Key",
    Placeholder = "Enter your key here",
    Callback = function(Value)
        keyInput = Value
    end
})

Tabs.Main:AddButton({
    Title = "Validate Key",
    Description = "Click to validate your key",
    Callback = function()
        if keyInput == validKey then
            Fluent:Notify({
                Title = "Success",
                Content = "Key is valid. Loading script...",
                Duration = 5
            })
            -- Load main script
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Andreaw1140/Andretremor-HUB/refs/heads/main/Zemito-Hub.lua", true))()
        else
            Fluent:Notify({
                Title = "Error",
                Content = "Invalid key. Please try again.",
                Duration = 5
            })
        end
    end
})
