-- Load KeceHub Library
local KeceHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Variables
local isKeyValid = false
local keyInput = ""
local validKey = "CRACKBYANDRE" -- Ganti dengan key yang valid

-- Main Window
local Window = KeceHub:MakeWindow({
    Name = "Ini 100% Punya Kece Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "KeceHubV2"
})

-- Tab: Key System
local KeyTab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

KeyTab:AddLabel("Masukkan kunci untuk mengakses fitur Kece Hub")

KeyTab:AddTextbox({
    Name = "Input Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        keyInput = value
    end
})

KeyTab:AddButton({
    Name = "Submit Key",
    Callback = function()
        if keyInput == validKey then
            isKeyValid = true
            KeceHub:MakeNotification({
                Name = "Success",
                Content = "Key valid! Anda sekarang dapat mengakses fitur.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        else
            KeceHub:MakeNotification({
                Name = "Error",
                Content = "Key salah! Coba lagi.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

-- Tab: Main (Hanya jika key valid)
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MainTab:AddLabel("Aktifkan fitur setelah validasi key.")
MainTab:AddButton({
    Name = "Start Features",
    Callback = function()
        if isKeyValid then
            KeceHub:MakeNotification({
                Name = "Access Granted",
                Content = "Anda sekarang dapat menggunakan fitur utama.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            
            -- Masukkan semua fitur utama di sini
            loadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua"))()
        else
            KeceHub:MakeNotification({
                Name = "Access Denied",
                Content = "Key belum valid! Harap validasi terlebih dahulu.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

-- Initialize UI
KeceHub:Init()
