-- Load KeceHub Library
local KeceHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Main Window
local Window = KeceHub:MakeWindow({
    Name = "True V4",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "KeceHubV2"
})

-- Variables
local bypassStatus = false
local startTime = os.clock()
local Authenticated = false
local RequiredKey = "BanuIsReal"  -- Ganti dengan key yang valid
local userKey = ""  -- Key yang diinput user

-- Link untuk mendapatkan Key
local keyURL = "https://link-center.net/1272037/key-for-script-andrehub"

-- Fungsi untuk mengambil key dari link
local function GetKeyFromLink()
    return game:HttpGet(keyURL)
end

-- Key Authentication
local function SaveKeyToWorkspace(key)
    local keyStorage = game:GetService("Workspace"):FindFirstChild("KeceHubKey")
    if not keyStorage then
        local KeyObject = Instance.new("StringValue", game:GetService("Workspace"))
        KeyObject.Name = "KeceHubKey"
        KeyObject.Value = key
    end
end

-- Tab: Key Authentication
local KeyTab = Window:MakeTab({
    Name = "KEY AUTH",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

KeyTab:AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        userKey = value
        if userKey == GetKeyFromLink() then
            Authenticated = true
            SaveKeyToWorkspace(userKey)  -- Simpan key ke Workspace

            KeceHub:MakeNotification({
                Name = "Success",
                Content = "Key accepted! Welcome to KeceHub!",
                Time = 5,
                Image = "rbxassetid://4483345998"
            })

            -- Hapus KeyTab setelah key benar
            Window:DestroyTab(KeyTab)
        else
            KeceHub:MakeNotification({
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

-- Tab: Status
local StatusTab = Window:MakeTab({
    Name = "Status",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

StatusTab:AddLabel("STATUS SC: VIP")
StatusTab:AddLabel("DEV: tiktok @lawwstore")
StatusTab:AddLabel("INFO: Penjual SC ini hanya @lawwstore")

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

-- Initialize UI
KeceHub:Init()

-- Show a welcome notification after authentication
KeceHub:MakeNotification({
    Name = "Welcome!",
    Content = "Enjoy using KeceHub!",
    Time = 5,
    Image = "rbxassetid://4483345998"
})
