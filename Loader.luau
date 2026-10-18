if getgenv and getgenv().Abysall then
    return 
end
if getgenv then
    getgenv().Abysall = { Legit = true }
end

local UIBaseUrl = "https://raw.githubusercontent.com/q2674791739/Library/main/Abysall/"
local HubBaseUrl = "https://raw.githubusercontent.com/q2674791739/Hub/main/"

getgenv().Abysall = {
    Environment = loadstring(game:HttpGet(UIBaseUrl .. "Environment.luau"))(),
    ESPLibrary = loadstring(game:HttpGet(UIBaseUrl .. "ESP.luau"))(),
    Legit = true,
}

local function CloneReference(Object)
    if Abysall and Abysall.Environment.cloneref then
        return Abysall.Environment.cloneref(Object)
    else
        return Object
    end
end

local Services = setmetatable({}, {
    __index = function(self, Name)
        return CloneReference(game:GetService(Name))
    end
})

if Abysall.Environment.writefile and Abysall.Environment.readfile then
    if not Abysall.Environment.isfile("Abysall/UserData.json") then
        local Data = { TotalExecutions = 0, UILibrary = "Obsidian" }
        Abysall.Environment.writefile("Abysall/UserData.json", Services.HttpService:JSONEncode(Data))
    end

    local UserData = Abysall.Environment.readfile("Abysall/UserData.json")
    local Decoded = Services.HttpService:JSONDecode(UserData)
    
    if not Decoded.TotalExecutions then Decoded.TotalExecutions = 0 end
    Decoded.TotalExecutions = Decoded.TotalExecutions + 1
    if not Decoded.UILibrary then Decoded.UILibrary = "Obsidian" end

    Abysall.TotalExecutions = Decoded.TotalExecutions
    Abysall.UILibrary = Decoded.UILibrary
    Abysall.Environment.writefile("Abysall/UserData.json", Services.HttpService:JSONEncode(Decoded))
end

Abysall.Interface = loadstring(game:HttpGet(UIBaseUrl .. "Interface.luau"))()

if game.PlaceId == 6516141723 then
    loadstring(game:HttpGet(HubBaseUrl .. "Lobby.luau"))()
else
    loadstring(game:HttpGet(HubBaseUrl .. "Abysall.lua"))()
end
