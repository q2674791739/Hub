local BaseUrl = "https://raw.githubusercontent.com/Q2674791739/UI/main/Abysall/"
local MyUrl = "https://raw.githubusercontent.com/Q2674791739/Hub/main/Abysall.lua"
local LobbyUrl = "https://raw.githubusercontent.com/Q2674791739/Hub/main/Lobby.luau"

local getgenv = getgenv or function() return _G end

getgenv().Abysall = getgenv().Abysall or {}
getgenv().Abysall.UILibrary = getgenv().Abysall.UILibrary or "Obsidian"

local function SafeLoad(Url, Name)
    local Success, Result = pcall(function()
        return loadstring(game:HttpGet(Url))()
    end)
    if not Success then
        warn("【加载失败】 " .. Name .. " -> " .. tostring(Result))
        return nil
    end
    print("【加载成功】 " .. Name)
    return Result
end

getgenv().Abysall.Environment = SafeLoad(BaseUrl .. "Environment.luau", "Environment") or getgenv().Abysall.Environment
-- ================= 新增：读取 JSON 恢复上次设置 =================
getgenv().Abysall.UILibrary = getgenv().Abysall.UILibrary or "Obsidian" -- 保底默认值

if getgenv().Abysall.Environment and getgenv().Abysall.Environment.isfile and getgenv().Abysall.Environment.readfile then
    local filePath = "Abysall/UserData.json"
    if getgenv().Abysall.Environment.isfile(filePath) then
        local ok, data = pcall(function()
            return getgenv().Abysall.Environment.readfile(filePath)
        end)
        if ok and data then
            local decodeOk, decoded = pcall(function()
                return game:GetService("HttpService"):JSONDecode(data)
            end)
            if decodeOk and decoded and decoded.UILibrary then
                getgenv().Abysall.UILibrary = decoded.UILibrary -- 👈 读取并覆盖
            end
        end
    end
end
-- ==============================================================
getgenv().Abysall.Interface   = SafeLoad(BaseUrl .. "Interface.luau", "Interface") or getgenv().Abysall.Interface
getgenv().Abysall.ESPLibrary  = SafeLoad(BaseUrl .. "ESP.luau", "ESPLibrary") or getgenv().Abysall.ESPLibrary

SafeLoad(BaseUrl .. "STX.luau", "STX")

if workspace:FindFirstChild("Lobby") then
    SafeLoad(LobbyUrl, "汉化大厅脚本")
else
    SafeLoad(MyUrl, "汉化主脚本")
end
