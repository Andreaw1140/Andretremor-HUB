local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
if not Fluent then
    warn("Fluent failed to load.")
    return
end

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "FluentV1 " .. Fluent.Version,
    SubTitle = "@AndreTremor",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local KeyTab = Tabs.Main:AddTab({ Title = "Key System", Icon = "key" })

-- Get Key Button
KeyTab:AddButton({
    Title = "Get Key",
    Description = "Click to copy the key URL",
    Callback = function()
        if setclipboard then
            setclipboard("https://linkvertise.com/1272037/key-for-script-andrehub?o=sharing")
            Fluent:Notify("Key Copied", "Key URL has been copied to clipboard!", 3)
        else
            Fluent:Notify("Error", "Your executor does not support clipboard functionality.", 3)
        end
    end
})

local validKey = "BanuIsReal"
local keyInput = ""

KeyTab:AddInput("KeyInput", {
    Title = "Enter Key",
    Placeholder = "Enter your key here",
    Callback = function(Value)
        keyInput = Value
    end
})

KeyTab:AddButton({
    Title = "Validate Key",
    Description = "Click to validate your key",
    Callback = function()
        if keyInput == validKey then
            Fluent:Notify({
                Title = "Success",
                Content = "Key is valid. Loading script...",
                Duration = 5
            })
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

Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:SetFolder("FluentScriptHub")
InterfaceManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

SaveManager:LoadAutoloadConfig()
