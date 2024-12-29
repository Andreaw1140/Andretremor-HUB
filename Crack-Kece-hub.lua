-- Load KeceHub Library
local KeceHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Main Window
local Window = KeceHub:MakeWindow({
    Name = "Ini 100% Punya Kece Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "KeceHubV2"
})
-- Sistem Key
local Authenticated = false
local RequiredKey = "BanuIsReal"
local KeyStorage = game:GetService("Workspace"):FindFirstChild("LawwScriptKey") -- Autosave Key di Workspace

-- Fungsi untuk menyimpan key ke Workspace
local function SaveKeyToWorkspace(key)
    if not game:GetService("Workspace"):FindFirstChild("LawwScriptKey") then
        local KeyObject = Instance.new("StringValue", game:GetService("Workspace"))
        KeyObject.Name = "LawwScriptKey"
        KeyObject.Value = key
    end
end

-- Jika Key sudah tersimpan dan valid, otomatis autentikasi
if KeyStorage and KeyStorage.Value == RequiredKey then
    Authenticated = true
    LawwLib:MakeNotification({
        Name = "Welcome Back",
        Content = "Key valid! Welcome to LawwScriptHUB!",
        Time = 5,
        Image = "rbxassetid://4483345998"
    })
else
    -- Key Validation Tab
    local KeyTab = LawwScriptHUB:MakeTab({
        Name = "KEY AUTH",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    KeyTab:AddTextbox({
        Name = "Enter Key",
        Default = "",
        TextDisappear = true,
        Callback = function(value)
            if value == RequiredKey then
                Authenticated = true
                SaveKeyToWorkspace(value) -- Simpan key ke Workspace

                LawwLib:MakeNotification({
                    Name = "Success",
                    Content = "Key accepted! Welcome to LawwScriptHUB!",
                    Time = 5,
                    Image = "rbxassetid://4483345998"
                })

                -- Hapus KeyTab setelah key benar
                LawwLib:DestroyTab(KeyTab)
            else
                LawwLib:MakeNotification({
                    Name = "Invalid Key",
                    Content = "Incorrect key, please try again.",
                    Time = 5,
                    Image = "rbxassetid://4483345998"
                })
            end
        end
    })

    -- Tunggu hingga key benar sebelum melanjutkan
    while not Authenticated do
        task.wait(1)
    end
end
})

-- Welcome Notification
local function ShowWelcomeNotification()
    local player = game.Players.LocalPlayer
    local displayName = player.DisplayName
    local userId = player.UserId
    local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(userId) .. "&width=420&height=420&format=png"

    LawwLib:MakeNotification({
        Name = "Welcome " .. displayName,
        Content = "Enjoy using LawwScriptHUB!",
        Image = avatarUrl,
        Time = 2
    })
end
ShowWelcomeNotification()
task.wait(2)
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
StatusTab:AddLabel("STATUS SC: VIP(Got Crack)")
StatusTab:AddLabel("DEV: tiktok @lawwstore,Andretremor")
StatusTab:AddLabel("INFO: Penjual SC ini hanya @lawwstore, Dan SC nya Gwh kasih free")

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
    Name = "COKKA HUB NO KEY",
    Callback = function()
        _G.Key = "Xzt7M9IAfF"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua"))()
    end
})

MainTab:AddButton({
    Name = "Speed Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

MainTab:AddButton({
    Name = "Mokuro Hub",
    Callback = function()
        loadstring(game:HttpGet("https://auth.quartyz.com/scripts/Loader.lua"))()
    end
})

MainTab:AddButton({
    Name = "RedzHub V2 (Smooth)",
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

local keyInput = ""
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

-- Tab: ALCHEMY
local AlchemyTab = Window:MakeTab({
    Name = "ALCHEMY",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

AlchemyTab:AddButton({
    Name = "Start",
    Callback = function()
        loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()
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
KeceHub:Init()

-- Override Welcome Message
local notificationFrame = game:GetService("CoreGui"):FindFirstChild("Kece Hub"):FindFirstChild("Notifications")
if notificationFrame then
    for _, child in pairs(notificationFrame:GetChildren()) do
        if child.Name == "Welcome" then
            child.Message.Text = "KECE HUB V5"
        end
    end
end
