-- Load ZamitoHub Library
local ZamitoHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/Andreaw1140/Andretremor-HUB/refs/heads/main/source"))()

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

-- Tab: Main
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Toggles
MainTab:AddToggle({
    Name = "Anti AFK ON/OFF",
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
    Name = "Speed Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

MainTab:AddButton({
    Name = "W-Azure",
    Callback = function()
        getgenv().Team = "Pirates"
        getgenv().FixCrash = false -- Turn it On For Hopping Server
        getgenv().FixCrash2 = false -- Turn it On For Hopping Server
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
    end
})

-- Key Input and Buttons
local keyInput = ""
MainTab:AddTextbox({
    Name = "Input Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        keyInput = value
        writefile("ZamitoHubKey.txt", keyInput)  -- Menyimpan key input ke file jika dibutuhkan
    end
})

MainTab:AddButton({
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

-- Tab: Hutao Hub
local HutaoTab = Window:MakeTab({
    Name = "Hutao Hub",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

HutaoTab:AddButton({
    Name = "Get Key",
    Callback = function()
        if setclipboard then
            setclipboard("https://linkvertise.com/1232655/key-fisch-hutao-hub?o=sharing") 
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

HutaoTab:AddTextbox({
    Name = "Input Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        keyInput = value
        writefile("ZamitoHubKey.txt", keyInput)
    end
})

HutaoTab:AddButton({
    Name = "Start",
    Callback = function()
        if keyInput ~= "" then
            getgenv().Key = keyInput
            loadstring(game:HttpGet("https://raw.githubusercontent.com/HutaoHubs/Hutaohubs2.0/refs/heads/main/Bloxfruit3.lua"))()
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

-- Tab: Alchemy
local AlchemyTab = Window:MakeTab({
    Name = "Alchemy",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

AlchemyTab:AddButton({
    Name = "Alchemy(Keyless)",
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
        jobID = value
        if jobID ~= "" then
            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", jobID)
        end
    end
})

-- Tab: Sound
local SoundTab = Window:MakeTab({
    Name = "Music",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

SoundTab:AddButton({
    Name = "Play Relax",
    Callback = function()
        local SoundService = game:GetService("SoundService")
        local song = Instance.new("Sound")
        song.SoundId = "rbxassetid://1848354536"
        song.Volume = 0.5
        song.Looped = true
        song.Parent = SoundService
        song:Play()

        ZamitoHub:MakeNotification({
            Name = "Song Playing",
            Content = "Santai Dulu Kawan",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

-- Tombol untuk Menghentikan Lagu
SoundTab:AddButton({
    Name = "Stop Relax Sound",
    Callback = function()
        local SoundService = game:GetService("SoundService")
        for _, sound in ipairs(SoundService:GetChildren()) do
            if sound:IsA("Sound") then
                sound:Stop() -- Hentikan semua lagu yang sedang diputar
                sound:Destroy() -- Hapus objek Sound
            end
        end

        -- Notifikasi
        ZamitoHub:MakeNotification({
            Name = "Song Stopped",
            Content = "Relax Sound dihentikan!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

-- Apply Theme Frost
ZamitoHub.Themes.Frost.Main = Color3.fromRGB(50, 50, 50)  -- Abu-abu gelap
ZamitoHub.Themes.Frost.Second = Color3.fromRGB(139, 0, 0)  -- Merah gelap (lebih misterius)
ZamitoHub.Themes.Frost.Stroke = Color3.fromRGB(205, 92, 92)  -- Merah lembut (soft red)
ZamitoHub.Themes.Frost.Divider = Color3.fromRGB(70, 70, 70)  -- Divider gelap
ZamitoHub.Themes.Frost.Text = Color3.fromRGB(240, 240, 240)  -- Teks putih agak terang
ZamitoHub.Themes.Frost.TextDark = Color3.fromRGB(255, 69, 0)  -- Teks gelap dengan aksen merah terang

-- Terapkan tema yang sudah diubah
ZamitoHub:ApplyTheme(ZamitoHub.Themes.Frost)

-- Initialize UI
ZamitoHub:Init()

-- Override Welcome Message
local notificationFrame = game:GetService("CoreGui"):FindFirstChild("Zamito Hub")
if notificationFrame then
    local welcomeMessage = notificationFrame:FindFirstChild("Notifications"):FindFirstChild("Welcome")
    if welcomeMessage then
        welcomeMessage.Message.Text = "ZAMITO HUB (BETA)"
    end
end
