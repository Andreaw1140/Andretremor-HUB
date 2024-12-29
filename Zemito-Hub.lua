-- Load KeceHub Library
local KeceHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/Andreaw1140/Andretremor-HUB/refs/heads/main/source"))()

-- Tema Frost
KeceHub.Themes["FrostTheme"] = {
    Main = Color3.fromRGB(173, 216, 230),  -- Warna utama biru muda (Ice Blue)
    Background = Color3.fromRGB(20, 30, 40),  -- Warna background gelap dengan sedikit biru
    Accent = Color3.fromRGB(135, 206, 250),  -- Warna aksen biru langit terang
    LightContrast = Color3.fromRGB(240, 248, 255),  -- Warna kontras terang (white smoke)
    DarkContrast = Color3.fromRGB(0, 0, 50),  -- Warna kontras gelap biru gelap
    TextColor = Color3.fromRGB(255, 255, 255)  -- Warna teks putih
}

-- Ganti tema yang digunakan di Window
local Window = KeceHub:MakeWindow({
    Name = "Zemito Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "KeceHubV2",
    Theme = "FrostTheme"  -- Ganti tema di sini
})

-- Variables
local bypassStatus = false
local keyInput = ""

-- Tab: Status
local StatusTab = Window:MakeTab({
    Name = "Status",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Status Display
StatusTab:AddLabel("vozxcXandre")
StatusTab:AddLabel("Masih Tahap Pengembangan")
StatusTab:AddLabel("Ada Bug dm @andretremor")
StatusTab:AddLabel("Atau gk kl Ada Bug dm @vozxc")

-- Tab: Main
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Toggles
MainTab:AddToggle({
    Name = "Bypass ON/OFF",
    Default = false,
    Callback = function(value)
        bypassStatus = value
        KeceHub:MakeNotification({
            Name = "Info",
            Content = "Bypass " .. (value and "Enabled" or "Disabled"),
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

MainTab:AddToggle({
    Name = "Clear Report ON/OFF",
    Default = false,
    Callback = function(value)
        KeceHub:MakeNotification({
            Name = "Info",
            Content = "Clear Report " .. (value and "Enabled" or "Disabled"),
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

-- Buttons
MainTab:AddButton({
    Name = "W-Azure (idk keyless or premium)",
    Callback = function()
        getgenv().Team = "Pirates"
        getgenv().AutoLoad = false --Will Load Script On Server Hop
        getgenv().SlowLoadUi = false
        getgenv().ForceUseSilentAimDashModifier = false --Force turn on silent aim, if error then executor problem
        getgenv().ForceUseWalkSpeedModifier = false --Force turn on Walk Speed Modifier, if error then executor problem

        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
    end
})

MainTab:AddButton({
    Name = "Speed Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

MainTab:AddButton({
    Name = "Quantum Script (BETA)",
    Callback = function()
        loadstring(game:HttpGet("https://quantumonyx.xyz/MainHub/BetaTesting.lua"))()
    end
})

MainTab:AddButton({
    Name = "RedzHub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
    end
})

-- Tab: BANANA
local BananaTab = Window:MakeTab({
    Name = "BANANA (keyless)",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

BananaTab:AddButton({
    Name = "Get Key",
    Callback = function()
        if setclipboard then
            setclipboard("https://ads.luarmor.net/get_key?for=VHFslhWdrPey")
            KeceHub:MakeNotification({
                Name = "Key Copied",
                Content = "Key URL has been copied to clipboard!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        else
            KeceHub:MakeNotification({
                Name = "Error",
                Content = "Your executor does not support clipboard functionality.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

BananaTab:AddTextbox({
    Name = "Input Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        keyInput = value
        writefile("KeceHubKey.txt", keyInput)
    end
})

BananaTab:AddButton({
    Name = "Start",
    Callback = function()
        if keyInput ~= "" then
            getgenv().Key = keyInput
            loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
        else
            KeceHub:MakeNotification({
                Name = "Error",
                Content = "Please input a key before starting!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

-- Tab: Ganteng Hub
local GantengHubTab = Window:MakeTab({
    Name = "Ganteng Hub",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

GantengHubTab:AddLabel("Coming Soon")

-- Tab: Join Server
local ServerTab = Window:MakeTab({
    Name = "Join Server",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local jobID = ""

ServerTab:AddTextbox({
    Name = "Input Job ID",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        jobID = value:gsub("`", "")
        if jobID ~= "" then
            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", jobID)
        end
    end
})

-- Initialize UI
KeceHub:Init()
