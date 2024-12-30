-- Load ZamitoHub Library
local ZamitoHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/Andreaw1140/Andretremor-HUB/refs/heads/main/source"))()

-- Main Window
local Window = ZamitoHub:MakeWindow({
    Name = "ZamitoHUB",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "ZamitoHubV2"
})

-- Sistem Key untuk Login
local Authenticated = false
local RequiredKey = "BanuIsReal"  -- Password yang diperlukan untuk login
local KeyStorage = game:GetService("Workspace"):FindFirstChild("ZamitoHubKey")  -- Menyimpan key di Workspace

-- Fungsi untuk menyimpan key ke Workspace
local function SaveKeyToWorkspace(key)
    if not game:GetService("Workspace"):FindFirstChild("ZamitoHubKey") then
        local KeyObject = Instance.new("StringValue", game:GetService("Workspace"))
        KeyObject.Name = "ZamitoHubKey"
        KeyObject.Value = key
    end
end

-- URL Key yang akan disalin
local keyURL = "https://linkvertise.com/1272037/key-for-script-andrehub?o=sharing"

-- Jika Key sudah tersimpan dan valid, otomatis autentikasi
if KeyStorage and KeyStorage.Value == RequiredKey then
    Authenticated = true
    ZamitoHub:MakeNotification({
        Name = "Welcome Back",
        Content = "Key valid! Welcome to ZamitoHub!",
        Time = 5,
        Image = "rbxassetid://4483345998"
    })
else
    -- Tab Key Authentication
    local KeyTab = ZamitoHub:MakeTab({
        Name = "Key Authentication",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    KeyTab:AddTextbox({
        Name = "Enter Key",
        Default = "",
        TextDisappear = true,
        Callback = function(value)
            -- Validasi Key
            if value == RequiredKey then
                Authenticated = true
                SaveKeyToWorkspace(value)  -- Simpan key ke Workspace

                ZamitoHub:MakeNotification({
                    Name = "Success",
                    Content = "Key accepted! Welcome to ZamitoHub!",
                    Time = 5,
                    Image = "rbxassetid://4483345998"
                })

                -- Tambahkan tombol "Get Key" setelah key diterima
                KeyTab:AddButton({
                    Name = "Get Key",
                    Callback = function()
                        setclipboard(keyURL)  -- Salin URL key ke clipboard
                        ZamitoHub:MakeNotification({
                            Name = "Key Copied",
                            Content = "Key URL has been copied to clipboard!",
                            Time = 5,
                            Image = "rbxassetid://4483345998"
                        })
                    end
                })

                -- Hapus KeyTab setelah key benar
                ZamitoHub:DestroyTab(KeyTab)
            else
                ZamitoHub:MakeNotification({
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

-- Tab: GantengTab
local GantengTab = Window:MakeTab({
    Name = "Ganteng Hub",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

GantengTab:AddButton({
    Name = "GantengHUB (REMAKE V1)",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/516a5669fc39b4945cd0609a08264505.lua"))()
    end
})

GantengTab:AddButton({
    Name = "GantengHUB(SEPUH/OLD)",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/a5c3af437cd698d64379cf75cacb9281.lua"))()
    end
})

-- Tab: HutaoTab (Corrected)
local HutaoTab = Window:MakeTab({
    Name = "Hutao (keyless)",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Add Textbox for Key Input
HutaoTab:AddTextbox({
    Name = "Input Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        keyInput = value
        writefile("ZamitoHubKey.txt", keyInput)  -- Menyimpan key input ke file jika dibutuhkan
    end
})

-- Button untuk Menjalankan Skrip menggunakan Key
HutaoTab:AddButton({
    Name = "Start",
    Callback = function()
        if keyInput ~= "" then
            -- Menjalankan skrip berdasarkan key yang dimasukkan
            getgenv().Key = keyInput
            loadstring(game:HttpGet("https://raw.githubusercontent.com/HutaoHubs/Hutaohubs2.0/refs/heads/main/Bloxfruit3.lua"))()  -- Ganti dengan URL yang sesuai
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

HutaoTab:AddButton({
    Name = "Get Key",
    Callback = function()
        if setclipboard then
            setclipboard("https://linkvertise.com/1232655/key-fisch-hutao-hub?o=sharing")  -- Link untuk key
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

-- Tab: Main
local AlchemyTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Buttons
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

-- Job ID
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
