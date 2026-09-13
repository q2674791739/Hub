local BaseUrl = "https://raw.githubusercontent.com/bocaj111004/Abysall/refs/heads/main/"
local MyUrl = "https://raw.githubusercontent.com/Q2674791739/Hub/main/2674713730Abysall.lua"
local getgenv = getgenv or function() return _G end
getgenv().Abysall = getgenv().Abysall or {}

loadstring(game:HttpGet(BaseUrl .. "Components/Environment.luau"))()
loadstring(game:HttpGet(BaseUrl .. "Components/Interface.luau"))()
loadstring(game:HttpGet(BaseUrl .. "Components/ESP.luau"))()
loadstring(game:HttpGet(BaseUrl .. "Components/STX.luau"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Q2674791739/Hub/main/2674713730Abysall.lua"))()
