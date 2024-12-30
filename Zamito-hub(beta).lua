-- Define the valid key
local validKey = "BanuIsReal"  -- Ganti dengan key yang sesuai

-- Define UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Andreaw1140/Andretremor-HUB/refs/heads/main/source"))()
local Window = Library:MakeWindow({
    Name = "ZamitoHub - Key System",
    HidePremium = false,
    SaveConfig = false
})

-- Variables
local keyInput = ""

-- Tab: Key System
local KeyTab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Button to Get Key Link
KeyTab:AddButton({
    Name = "Get Key",
    Callback = function()
        if setclipboard then
            setclipboard("https://linkvertise.com/1272037/key-for-script-andrehub?o=sharing")  -- Link ke key
            Library:MakeNotification({
                Name = "Key Copied",
                Content = "Key URL has been copied to clipboard!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        else
            Library:MakeNotification({
                Name = "Error",
                Content = "Your executor does not support clipboard functionality.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

-- Textbox for Key Input
KeyTab:AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        keyInput = value
    end
})

-- Button to Validate Key and Load Script
KeyTab:AddButton({
    Name = "Start Script",
    Callback = function()
        if keyInput == validKey then
            Library:MakeNotification({
                Name = "Success",
                Content = "Key is valid. Loading script...",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            -- Load your main script
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Andreaw1140/Andretremor-HUB/refs/heads/main/Zemito-Hub.lua", true))()
        else
            Library:MakeNotification({
                Name = "Error",
                Content = "Invalid key. Please try again.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})
