-- Key Verification Script
local userKey = "" -- Key yang diinput user
local validKey = "BanuIsReal" -- Key yang valid
local rawURL = "https://raw.githubusercontent.com/username/repo/branch/script.lua" -- Link raw script
local monetizedLink = "https://link-center.net/1272037/key-for-script-andrehub" -- Link monetized untuk mendapatkan key

-- Fungsi untuk mendapatkan raw key (misalnya, script dari URL raw)
local function getRawScriptFromKey(key)
    -- Jika key valid, kita ambil raw script dari URL
    if key == validKey then
        return game:HttpGet(rawURL)
    else
        return nil
    end
end

-- Fungsi untuk mengecek key
if userKey == validKey then
    print("Key valid! Loading script...")
    local rawScript = getRawScriptFromKey(userKey) -- Dapatkan script raw berdasarkan key
    if rawScript then
        loadstring(rawScript)() -- Load script dari raw URL jika key valid
    else
        print("Error: Unable to fetch raw script.")
    end
else
    print("Invalid key. Please enter the correct key!")
end

-- Fungsi untuk menyalin link monetized ke clipboard (optional)
if setclipboard then
    setclipboard(monetizedLink) -- Menyalin link monetized untuk mendapatkan key
    print("Link to get the key has been copied to clipboard!")
else
    print("Error: Your executor does not support clipboard functionality.")
end
