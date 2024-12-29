-- Memuat ZemitoHub Library
local ZemitoHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source", true))()

-- Pengecekan apakah ZemitoHub berhasil dimuat
if not ZemitoHub then
    warn("Gagal memuat ZemitoHub!")
else
    print("ZemitoHub berhasil dimuat!")
end

-- Mengubah warna tema Frost setelah memuat ZemitoHub
ZemitoHub.Themes.Frost.Main = Color3.fromRGB(173, 216, 230)  -- Biru muda
ZemitoHub.Themes.Frost.Second = Color3.fromRGB(135, 206, 250)  -- Biru langit terang
ZemitoHub.Themes.Frost.Stroke = Color3.fromRGB(0, 191, 255)  -- Biru terang
ZemitoHub.Themes.Frost.Divider = Color3.fromRGB(240, 248, 255)  -- Putih kebiruan
ZemitoHub.Themes.Frost.Text = Color3.fromRGB(255, 255, 255)  -- Teks putih
ZemitoHub.Themes.Frost.TextDark = Color3.fromRGB(0, 0, 50)  -- Teks gelap biru gelap

-- Terapkan tema yang sudah diubah
ZemitoHub:ApplyTheme(ZemitoHub.Themes.Frost)
print("Tema Frost diterapkan.")

-- Membuat Window dengan tema Frost
local Window = ZemitoHub:MakeWindow({
    Name = "Zemito Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "ZemitoHubV2",
    Theme = "Frost"  -- Terapkan tema Frost yang telah diubah
})

-- Pengecekan apakah Window berhasil dibuat
if Window then
    print("Window berhasil dibuat.")
else
    warn("Gagal membuat Window!")
end

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
        ZemitoHub:MakeNotification({
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
        ZemitoHub:MakeNotification({
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
            ZemitoHub:MakeNotification({
                Name = "Key Copied",
                Content = "Key URL has been copied to clipboard!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        else
            ZemitoHub:MakeNotification({
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
        writefile("ZemitoHubKey.txt", keyInput)
    end
})

BananaTab:AddButton({
    Name = "Start",
    Callback = function()
        if keyInput ~= "" then
            getgenv().Key = keyInput
            loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
        else
            ZemitoHub:MakeNotification({
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

-- Inisialisasi UI
ZemitoHub:Init()
print("ZemitoHub UI telah diinisialisasi.")
