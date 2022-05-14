--[[Dependencies]]--
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")

--[[Module]]--
local HWID = ""
local HWIDList = {"Syn-Fingerprint"}

local Body = syn.request({Url = "https://httpbin.org/get", Method = "GET"}).Body
local Decode = HttpService:JSONDecode(Body)

for _,v in next, HWIDList do
    if Decode.headers[v] then
        HWID = Decode.headers[v]
        break
    end
end

if HWID then
    setclipboard(HWID)
    LocalPlayer:Kick("HWID has been copied to your clipboard.")
else
    LocalPlayer:Kick("Verification process has failed.")
end
