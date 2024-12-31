-- Load Fluent Library
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Verify Fluent is loaded
if not Fluent then
    warn("Failed to load Fluent.")
    return
end

-- Create Main Window
local Window = Fluent:CreateWindow({
    Title = "ZamitoHUB (Fluent Version)",
    SubTitle = "By @AndreTremor",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Define Tabs
local Tabs = {
    Status = Window:AddTab({ Title = "Status", Icon = "rbxassetid://4483345998" }),
    Main = Window:AddTab({ Title = "Main", Icon = "rbxassetid://4483345998" }),
    Banana = Window:AddTab({ Title = "Banana", Icon = "rbxassetid://4483345998" }),
    Ganteng = Window:AddTab({ Title = "Ganteng", Icon = "rbxassetid://4483345998" }),
    Hutao = Window:AddTab({ Title = "Hutao", Icon = "rbxassetid://4483345998" }),
    Alchemy = Window:AddTab({ Title = "Alchemy", Icon = "rbxassetid://4483345998" }),
    Server = Window:AddTab({ Title = "Join Server", Icon = "rbxassetid://4483345998" })
}

-- Status Tab
Tabs.Status:AddLabel("STATUS SC: Free")
Tabs.Status:AddLabel("DEV: DC(@andretremor)")
Tabs.Status:AddLabel("INFO: For Bug @Andretremor(discord)")
Tabs.Status:AddLabel("INFO: Kalo Ada Bug @vozxc")

-- Main Tab
Tabs.Main:AddToggle({
    Title = "Bypass ON/OFF",
    Callback = function(value)
        Fluent:Notify("Info", "Bypass " .. (value and "Enabled" or "Disabled"), 5)
    end
})

Tabs.Main:AddButton({
    Title = "Zen (Keyless)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zenhubtop/zen_hub_pr/main/zennewwwwui.lua", true))()
    end
})

Tabs.Main:AddButton({
    Title = "Speed Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

-- Banana Tab
Tabs.Banana:AddButton({
    Title = "Get Key",
    Callback = function()
        if setclipboard then
            setclipboard("https://ads.luarmor.net/get_key?for=VHFslhWdrPey")
            Fluent:Notify("Key Copied", "Key URL has been copied to clipboard!", 5)
        else
            Fluent:Notify("Error", "Clipboard functionality is not supported.", 5)
        end
    end
})

local bananaKeyInput = ""
Tabs.Banana:AddInput("KeyInput", {
    Title = "Input Key",
    Placeholder = "Enter your key here",
    Callback = function(value)
        bananaKeyInput = value
    end
})

Tabs.Banana:AddButton({
    Title = "Start",
    Callback = function()
        if bananaKeyInput ~= "" then
            getgenv().Key = bananaKeyInput
            loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
        else
            Fluent:Notify("Error", "Please input a key before starting!", 5)
        end
    end
})

-- Ganteng Tab
Tabs.Ganteng:AddButton({
    Title = "GantengHUB (REMAKE V1)",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/516a5669fc39b4945cd0609a08264505.lua"))()
    end
})

-- Hutao Tab
local hutaoKeyInput = ""
Tabs.Hutao:AddInput("KeyInputHutao", {
    Title = "Input Key",
    Placeholder = "Enter your key here",
    Callback = function(value)
        hutaoKeyInput = value
    end
})

Tabs.Hutao:AddButton({
    Title = "Start",
    Callback = function()
        if hutaoKeyInput ~= "" then
            getgenv().Key = hutaoKeyInput
            loadstring(game:HttpGet("https://raw.githubusercontent.com/HutaoHubs/Hutaohubs2.0/refs/heads/main/Bloxfruit3.lua"))()
        else
            Fluent:Notify("Error", "Please input a key before starting!", 5)
        end
    end
})

Tabs.Hutao:AddButton({
    Title = "Get Key",
    Callback = function()
        if setclipboard then
            setclipboard("https://linkvertise.com/1232655/key-fisch-hutao-hub?o=sharing")
            Fluent:Notify("Key Copied", "Key URL has been copied to clipboard!", 5)
        else
            Fluent:Notify("Error", "Clipboard functionality is not supported.", 5)
        end
    end
})

-- Alchemy Tab
Tabs.Alchemy:AddButton({
    Title = "Alchemy(Keyless)",
    Callback = function()
        loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()
    end
})

-- Server Tab
local jobID = ""
Tabs.Server:AddInput("JobInput", {
    Title = "Input Job ID",
    Placeholder = "Enter Job ID here",
    Callback = function(value)
        jobID = value
    end
})

Tabs.Server:AddButton({
    Title = "Join Server",
    Callback = function()
        if jobID ~= "" then
            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", jobID)
        else
            Fluent:Notify("Error", "Please input a valid Job ID!", 5)
        end
    end
})

-- Save Configuration
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:SetFolder("ZamitoHubFluent")
InterfaceManager:SetFolder("ZamitoHubFluent/config")

InterfaceManager:BuildInterfaceSection(Tabs.Status)
SaveManager:BuildConfigSection(Tabs.Status)

SaveManager:LoadAutoloadConfig()

-- Finish UI
Fluent:Notify("ZamitoHub", "The script has been loaded successfully.", 8)
