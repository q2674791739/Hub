local BaseUrl = "https://raw.githubusercontent.com/Q2674791739/UI/main/Abysall/"
local MyUrl = "https://raw.githubusercontent.com/Q2674791739/Hub/main/Abysall.lua"

local getgenv = getgenv or function() return _G end

getgenv().Abysall = getgenv().Abysall or {}

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
getgenv().Abysall.Interface   = SafeLoad(BaseUrl .. "Interface.luau", "Interface") or getgenv().Abysall.Interface
getgenv().Abysall.ESPLibrary  = SafeLoad(BaseUrl .. "ESP.luau", "ESPLibrary") or getgenv().Abysall.ESPLibrary

SafeLoad(BaseUrl .. "STX.luau", "STX")

SafeLoad(MyUrl, "汉化主脚本")
