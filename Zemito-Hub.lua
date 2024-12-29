-- Load ZamitoHub Library
local ZamitoHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Main Window
local Window = ZamitoHub:MakeWindow({
    Name = "ZamitoHUB",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "ZamitoHubV2"
})

-- Variables
local bypassStatus = false
local startTime = os.clock()

-- Tab: Status
local StatusTab = Window:MakeTab({
    Name = "Status",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Status Display
StatusTab:AddLabel("STATUS SC: Free")
StatusTab:AddLabel("DEV: DC(@andretremor)")
StatusTab:AddLabel("INFO: For Bug @Andretremor(discord)")
StatusTab:AddLabel("INFO: Kalo Ada Bug @vozxc")
-- Update Ping and Bypass Status
task.spawn(function()
    while true do
        task.wait(1) -- Interval pembaruan setiap 1 detik
    end
end)

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
        ZamitoHub:MakeNotification({
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
        ZamitoHub:MakeNotification({
            Name = "Info",
            Content = "Clear Report " .. (value and "Enabled" or "Disabled"),
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

-- Buttons
MainTab:AddButton({
    Name = "Zen (Keyless)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zenhubtop/zen_hub_pr/main/zennewwwwui.lua", true))()
    end
})

MainTab:AddButton({
    Name = "Speed Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

MainTab:AddButton({
    Name = "W-Azure",
    Callback = function()
        getgenv().Team = "Pirates"
        getgenv().FixCrash = false -- Turn it On For Hopping Server, Improve Performance But Silent Aim On Mob And Player
        getgenv().FixCrash2 = false -- Turn it On For Hopping Server, Improve Performance But Will Remove Speed Changer
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
    end
})

MainTab:AddButton({
    Name = "RedzHub (Not Support Luna)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
    end
})

-- Tab: BANANA
local BananaTab = Window:MakeTab({
    Name = "BANANA",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

BananaTab:AddButton({
    Name = "Get Key",
    Callback = function()
        if setclipboard then
            setclipboard("https://ads.luarmor.net/get_key?for=VHFslhWdrPey")
            ZamitoHub:MakeNotification({
                Name = "Key Copied",
                Content = "Key URL has been copied to clipboard!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        else
            ZamitoHub:MakeNotification({
                Name = "Error",
                Content = "Your executor does not support clipboard functionality.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

local keyInput = ""
BananaTab:AddTextbox({
    Name = "Input Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        keyInput = value
        writefile("ZamitoHubKey.txt", keyInput)
    end
})

BananaTab:AddButton({
    Name = "Start",
    Callback = function()
        if keyInput ~= "" then
            getgenv().Key = keyInput
            loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
        else
            ZamitoHub:MakeNotification({
                Name = "Error",
                Content = "Please input a key before starting!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

-- Tab: ALCHEMY
local GantengTab = Window:MakeTab({
    Name = "Ganteng Hub",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MainTab:AddButton({
    Name = "GantengHUB (OLD/SEPUH)",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/a5c3af437cd698d64379cf75cacb9281.lua"))()
    end
})

MainTab:AddButton({
    Name = "GantengHUB REMAKE V1",
    Callback = function()
        getgenv().Team = "Pirates"
        getgenv().FixCrash = false -- Turn it On For Hopping Server, Improve Performance But Silent Aim On Mob And Player
        getgenv().FixCrash2 = false -- Turn it On For Hopping Server, Improve Performance But Will Remove Speed Changer
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
    end
})
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
        -- Hapus karakter backtick dan simpan Job ID
        jobID = value:gsub("`", "")
        if jobID ~= "" then
            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", jobID)
        end
    end
})

-- Initialize UI
ZamitoHub:Init()

-- Override Welcome Message
local notificationFrame = game:GetService("CoreGui"):FindFirstChild("Zamito Hub"):FindFirstChild("Notifications")
if notificationFrame then
    for _, child in pairs(notificationFrame:GetChildren()) do
        if child.Name == "Welcome" then
            child.Message.Text = "ZAMITO HUB (BETA)"
        end
    end
end

-- Menambahkan warna pada beberapa elemen UI
ZamitoHub.Themes.Frost.Main = Color3.fromRGB(173, 216, 230)  -- Biru muda
ZamitoHub.Themes.Frost.Second = Color3.fromRGB(135, 206, 250)  -- Biru langit terang
ZamitoHub.Themes.Frost.Stroke = Color3.fromRGB(0, 191, 255)  -- Biru terang
ZamitoHub.Themes.Frost.Divider = Color3.fromRGB(240, 248, 255)  -- Putih kebiruan
ZamitoHub.Themes.Frost.Text = Color3.fromRGB(255, 255, 255)  -- Teks putih
ZamitoHub.Themes.Frost.TextDark = Color3.fromRGB(0, 0, 50)  -- Teks gelap biru gelap

-- Terapkan tema yang sudah diubah
ZamitoHub:ApplyTheme(ZamitoHub.Themes.Frost)
