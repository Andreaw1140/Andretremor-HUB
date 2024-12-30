local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fluent " .. Fluent.Version,
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-- Key validation variables
local validKey = "BanuIsReal" -- Ganti dengan key valid Anda
local keyInput = ""

-- Tab untuk Key System
local KeyTab = Tabs.Main:AddTab({ Title = "Key System", Icon = "key" })

-- Input untuk key
KeyTab:AddInput("KeyInput", {
    Title = "Enter Key",
    Placeholder = "Enter your key here",
    Callback = function(Value)
        keyInput = Value
    end
})

-- Tombol untuk validasi key
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
            -- Load main script
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

-- Menambahkan opsi lain (misalnya slider dan dropdown) di tab utama
Tabs.Main:AddParagraph({
    Title = "Fluent Script UI",
    Content = "This is a UI for your script!"
})

local Slider = Tabs.Main:AddSlider("Slider", {
    Title = "Slider",
    Description = "This is a slider",
    Default = 2,
    Min = 0,
    Max = 5,
    Rounding = 1,
    Callback = function(Value)
        print("Slider was changed:", Value)
    end
})

Slider:SetValue(3)

-- Menambahkan pengaturan dan opsi lainnya
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Membangun interface dan menyimpan pengaturan
SaveManager:SetFolder("FluentScriptHub")
InterfaceManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

-- Memilih tab pertama (Key System)
Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- Memuat konfigurasi otomatis
SaveManager:LoadAutoloadConfig()
