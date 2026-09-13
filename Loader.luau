-- ==================== 完整汉化加载器 ====================
local BaseUrl = "https://raw.githubusercontent.com/bocaj111004/Abysall/refs/heads/main/"
-- 下面这个是你的汉化主脚本链接
local MyUrl = "https://raw.githubusercontent.com/Q2674791739/Hub/main/2674713730Abysall.lua"

-- 1. 兼容部分执行器没有 getgenv 的情况
local getgenv = getgenv or function() return _G end

-- 2. 初始化 Abysall 全局表，防止报错 attempt to index nil
getgenv().Abysall = getgenv().Abysall or {}

-- 3. 封装一个安全加载函数，能精准报错
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

-- 4. 按顺序加载核心库，并把返回值赋给 Abysall 对应字段
-- 提示：Interface.luau 只有 3.7KB，它可能只是个壳，真正的库可能在别的地方
getgenv().Abysall.Environment = SafeLoad(BaseUrl .. "Components/Environment.luau", "Environment") or getgenv().Abysall.Environment
getgenv().Abysall.Interface   = SafeLoad(BaseUrl .. "Components/Interface.luau", "Interface") or getgenv().Abysall.Interface
getgenv().Abysall.ESPLibrary  = SafeLoad(BaseUrl .. "Components/ESP.luau", "ESP") or getgenv().Abysall.ESPLibrary

-- 5. 加载其余可能需要的组件（根据原仓库 Components 文件夹里的截图）
SafeLoad(BaseUrl .. "Components/STX.luau", "STX")

-- 6. 最后加载你的汉化主脚本
SafeLoad(MyUrl, "汉化主脚本")
-- =====================================================
