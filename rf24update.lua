--[[
    Kesici Hub - Professional Edition
    PC & Mobile Supported
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

-- ================================================================
--                    KEY SYSTEM ENTEGRASYONU
-- ================================================================
local DiscordLink = "https://discord.gg/ababtVNjTb"

local currentExecutor = (identifyexecutor and identifyexecutor()) or "Unknown"
if string.find(string.lower(currentExecutor), "xeno") then
    game:GetService("StarterGui"):SetCore("SendNotification", { Title = "KESICI HUB", Text = "Unsupported executor.", Duration = 5 })
    error("KESICI HUB: Unsupported executor detected.")
    return
end

local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Player
local uiTarget = pcall(function() return CoreGui.Name end) and CoreGui or LocalPlayer:WaitForChild("PlayerGui")
if uiTarget:FindFirstChild("KesiciHubV2") then uiTarget.KesiciHubV2:Destroy() end
if uiTarget:FindFirstChild("KeySystemUI") then uiTarget.KeySystemUI:Destroy() end

-- ==========================================
-- PLATOBOOST KEY SYSTEM CONFIG
-- ==========================================
local Config = {
    ServiceId       = 24522, 
    PlatoSecret     = "e03c3889-3419-4114-a1f9-84d46d311c35", 
    KeyFileName     = "KesiciHubKey.txt" 
}

-------------------------------------------------------------------------------
-- PLATOBOOST LIBRARIES & ENCRYPTION
-------------------------------------------------------------------------------
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return q(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(p,r)+lshift(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(x,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),s(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=k(n(Q,R),n(o(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+d)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%a end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return w(y(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(l[T]or string.format("u%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(_,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local j={["nil"]=B,["table"]=v,["string"]=g,["number"]=a1,["boolean"]=tostring}e=function(M,z)local x=type(M)local a2=j[x]if a2 then return a2(M,z)end;error("unexpected type '"..x.."'")end;local a3=function(M)return e(M)end;local a4;local N=function(...)local _={}for a0=1,select("#",...)do _[select(a0,...)]=true end;return _ end;local L=N(" ","\t","\r","\n")local p=N(" ","\t","\r","\n","]","}",",")local a5=N("\\","/",'"',"b","f","n","r","t","u")local m=N("true","false","null")local a6={["true"]=true,["false"]=false,["null"]=nil}local a7=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]~=ab then return a0 end end;return#a8+1 end;local ac=function(a8,a9,J)local ad=1;local ae=1;for a0=1,a9-1 do ae=ae+1;if a8:sub(a0,a0)=="\n"then ad=ad+1;ae=1 end end;error(string.format("%s at line %d col %d",J,ad,ae))end;local af=function(A)local a2=math.floor;if A<=0x7f then return string.char(A)elseif A<=0x7ff then return string.char(a2(A/64)+192,A%64+128)elseif A<=0xffff then return string.char(a2(A/4096)+224,a2(A%4096/64)+128,A%64+128)elseif A<=0x10ffff then return string.char(a2(A/262144)+240,a2(A%262144/4096)+128,a2(A%4096/64)+128,A%64+128)end;error(string.format("invalid unicode codepoint '%x'",A))end;local ag=function(ah)local ai=tonumber(ah:sub(1,4),16)local aj=tonumber(ah:sub(7,10),16)if aj then return af((ai-0xd800)*0x400+aj-0xdc00+0x10000)else return af(ai)end end;local ak=function(a8,a0)local _=""local al=a0+1;local Q=al;while al<=#a8 do local am=a8:byte(al)if am<32 then ac(a8,al,"control character in string")elseif am==92 then _=_..a8:sub(Q,al-1)al=al+1;local T=a8:sub(al,al)if T=="u"then local an=a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",al+1)or a8:match("^%x%x%x%x",al+1)or ac(a8,al-1,"invalid unicode escape in string")_=_..ag(an)al=al+#an else if not a5[T]then ac(a8,al-1,"invalid escape char '"..T.."' in string")end;_=_..P[T]end;Q=al+1 elseif am==34 then _=_..a8:sub(Q,al-1)return _,al+1 end;al=al+1 end;ac(a8,a0,"expected closing quote for string")end;local ao=function(a8,a0)local am=a7(a8,a0,p)local ah=a8:sub(a0,am-1)local A=tonumber(ah)if not A then ac(a8,a0,"invalid number '"..ah.."'")end;return A,am end;local ap=function(a8,a0)local am=a7(a8,a0,p)local aq=a8:sub(a0,am-1)if not m[aq]then ac(a8,a0,"invalid literal '"..aq.."'")end;return a6[aq],am end;local ar=function(a8,a0)local _={}local A=1;a0=a0+1;while 1 do local am;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="]"then a0=a0+1;break end;am,a0=a4(a8,a0)_[A]=am;A=A+1;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="]"then break end;if as~=","then ac(a8,a0,"expected ']' or ','")end end;return _,a0 end;local at=function(a8,a0)local _={}a0=a0+1;while 1 do local au,M;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="}"then a0=a0+1;break end;if a8:sub(a0,a0)~='"'then ac(a8,a0,"expected string for key")end;au,a0=a4(a8,a0)a0=a7(a8,a0,L,true)if a8:sub(a0,a0)~=":"then ac(a8,a0,"expected ':' after key")end;a0=a7(a8,a0+1,L,true)M,a0=a4(a8,a0)_[au]=M;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="}"then break end;if as~=","then ac(a8,a0,"expected '}' or ','")end end;return _,a0 end;local av={['"']=ak,["0"]=ao,["1"]=ao,["2"]=ao,["3"]=ao,["4"]=ao,["5"]=ao,["6"]=ao,["7"]=ao,["8"]=ao,["9"]=ao,["-"]=ao,["t"]=ap,["f"]=ap,["n"]=ap,["["]=ar,["{"]=at}a4=function(a8,a9)local as=a8:sub(a9,a9)local a2=av[as]if a2 then return a2(a8,a9)end;ac(a8,a9,"unexpected character '"..as.."'")end;local aw=function(a8)if type(a8)~="string"then error("expected argument of type string, got "..type(a8))end;local _,a9=a4(a8,a7(a8,1,L,true))a9=a7(a8,a9,L,true)if a9<=#a8 then ac(a8,a9,"trailing garbage")end;return _ end;
local lEncode, lDecode, lDigest = a3, aw, Z;

local useNonce = true

local function safeRequest(options)
    local req = request or http_request or syn_request 
        or (http and http.request) 
        or fluxus_request 
        or (syn and syn.request)
        or httprequest
    if not req then return nil, "HTTP not supported on this executor" end
    local success, response = pcall(function() return req(options) end)
    if success and response then 
        return response 
    else 
        local errMsg = (not success and tostring(response)) or "Connection Error"
        return nil, errMsg
    end
end

local fStringChar, fToString, fOsTime, fMathRandom, fMathFloor = string.char, tostring, os.time, math.random, math.floor
local fGetHwid = gethwid or hwid or getdeviceid or function()
    local ok, result = pcall(function() return game:GetService("RbxAnalyticsService"):GetClientId() end)
    if ok and result then return result end
    local ok2, result2 = pcall(function() return game:GetService("HttpService"):GenerateGUID(false) end)
    if ok2 and result2 then return result2 end
    return Player.UserId .. "_" .. tostring(game.PlaceId) .. "_ios_fallback"
end

-- iOS Safe Copy ve TextBox Otomatik Odaklanma Entegrasyonu
local function safeCopy(text)
    local function getGlobal(name)
        local ok, val = pcall(function() return _G[name] or shared[name] or (getfenv and getfenv()[name]) end)
        if ok and val then return val end
        return nil
    end

    local setclip = getGlobal("setclipboard") or setclipboard
    if typeof(setclip) == "function" or typeof(setclip) == "table" then
        local ok = pcall(function() setclip(text) end)
        if ok then return true end
    end

    local toclip = getGlobal("toclipboard") or toclipboard
    if typeof(toclip) == "function" or typeof(toclip) == "table" then
        local ok = pcall(function() toclip(text) end)
        if ok then return true end
    end

    local set_clip = getGlobal("set_clipboard") or set_clipboard
    if typeof(set_clip) == "function" or typeof(set_clip) == "table" then
        local ok = pcall(function() set_clip(text) end)
        if ok then return true end
    end

    local clip = getGlobal("Clipboard") or Clipboard
    if typeof(clip) == "table" and clip.set then
        local ok = pcall(function() clip.set(text) end)
        if ok then return true end
    end

    return false
end

local cachedLink, cachedTime = "", 0
local host = "https://api.platoboost.com"

local function checkConnectivity()
    local response = safeRequest({Url = host .. "/public/connectivity", Method = "GET"})
    if not response or (response.StatusCode ~= 200 and response.StatusCode ~= 429) then
        host = "https://api.platoboost.net"
    end
end
checkConnectivity()

local function generateNonce()
    local str = ""
    for _ = 1, 16 do str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97) end
    return str
end

local function cacheLink()
    if cachedTime + (10*60) < fOsTime() then
        local response, err = safeRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({service = Config.ServiceId, identifier = lDigest(fGetHwid())}),
            Headers = {["Content-Type"] = "application/json"}
        })
        if response and response.StatusCode == 200 then
            local decoded = lDecode(response.Body)
            if decoded.success then
                cachedLink = decoded.data.url
                cachedTime = fOsTime()
                return true, cachedLink
            end
        end
        return false, err or "Server Unreachable"
    end
    return true, cachedLink
end

local function redeemKey(key)
    local nonce = generateNonce()
    local body = {identifier = lDigest(fGetHwid()), key = key}
    if useNonce then body.nonce = nonce end
    
    local response, err = safeRequest({
        Url = host .. "/public/redeem/" .. fToString(Config.ServiceId),
        Method = "POST",
        Body = lEncode(body),
        Headers = {["Content-Type"] = "application/json"}
    })
    
    if response and response.StatusCode == 200 then
        local decoded = lDecode(response.Body)
        if decoded.success and decoded.data.valid then
            if useNonce then
                if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. Config.PlatoSecret) then 
                    if writefile then writefile(Config.KeyFileName, key) end
                    return true, "Success" 
                end
                return false, "Integrity Check Failed"
            end
            if writefile then writefile(Config.KeyFileName, key) end
            return true, "Success"
        end
        return false, decoded.message or "Invalid Key"
    end
    return false, err or "Server Error"
end

-- ==========================================
-- KESICIHUB KEY SYSTEM UI & ADMIN BYPASS
-- ==========================================
_G.KeyValidated = false

local function CreateKeyUI()
    local TweenService = game:GetService("TweenService")
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "KeySystemUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = uiTarget

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 400, 0, 260)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -130)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui

    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
    
    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = Color3.fromRGB(60, 60, 70)
    MainStroke.Thickness = 1
    MainStroke.Parent = MainFrame

    local Title = Instance.new("TextLabel")
    Title.Text = "KesiciHub v2 Key System"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 16
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.Size = UDim2.new(0.6, 0, 0, 40)
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = MainFrame

    local ExitBtn = Instance.new("TextButton")
    ExitBtn.Size = UDim2.new(0, 30, 0, 30)
    ExitBtn.Position = UDim2.new(1, -40, 0, 5)
    ExitBtn.Text = "X"
    ExitBtn.Font = Enum.Font.GothamBold
    ExitBtn.TextSize = 14
    ExitBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    ExitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ExitBtn.Parent = MainFrame
    Instance.new("UICorner", ExitBtn).CornerRadius = UDim.new(0, 8)

    local MinBtn = Instance.new("TextButton")
    MinBtn.Size = UDim2.new(0, 30, 0, 30)
    MinBtn.Position = UDim2.new(1, -75, 0, 5)
    MinBtn.Text = "-"
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 18
    MinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinBtn.Parent = MainFrame
    Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 8)

    local KeyInput = Instance.new("TextBox")
    KeyInput.Size = UDim2.new(0.9, 0, 0, 45)
    KeyInput.Position = UDim2.new(0.05, 0, 0, 60)
    KeyInput.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    KeyInput.PlaceholderText = "Enter your key here..."
    KeyInput.Text = ""
    KeyInput.Font = Enum.Font.Gotham
    KeyInput.TextSize = 14
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.Parent = MainFrame
  
    Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 8)
    
    local InputStroke = Instance.new("UIStroke")
    InputStroke.Color = Color3.fromRGB(80, 80, 90)
    InputStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    InputStroke.Parent = KeyInput

    local GetKeyBtn = Instance.new("TextButton")
    GetKeyBtn.Size = UDim2.new(0.42, 0, 0, 40)
    GetKeyBtn.Position = UDim2.new(0.05, 0, 0, 115)
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    GetKeyBtn.Text = "Get Key"
    GetKeyBtn.Font = Enum.Font.GothamBold
    GetKeyBtn.TextSize = 14
    GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    GetKeyBtn.Parent = MainFrame
    Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 8)

    local CheckKeyBtn = Instance.new("TextButton")
    CheckKeyBtn.Size = UDim2.new(0.42, 0, 0, 40)
    CheckKeyBtn.Position = UDim2.new(0.53, 0, 0, 115)
    CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 255) 
    CheckKeyBtn.Text = "Check Key"
    CheckKeyBtn.Font = Enum.Font.GothamBold
    CheckKeyBtn.TextSize = 14
    CheckKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CheckKeyBtn.Parent = MainFrame
    Instance.new("UICorner", CheckKeyBtn).CornerRadius = UDim.new(0, 8)

    local KeyAlamadinMi = Instance.new("TextLabel")
    KeyAlamadinMi.Size = UDim2.new(0.9, 0, 0, 15)
    KeyAlamadinMi.Position = UDim2.new(0.05, 0, 0, 160)
    KeyAlamadinMi.BackgroundTransparency = 1
    KeyAlamadinMi.Text = "Need a key?"
    KeyAlamadinMi.Font = Enum.Font.Gotham
    KeyAlamadinMi.TextSize = 11
    KeyAlamadinMi.TextColor3 = Color3.fromRGB(180, 180, 180)
    KeyAlamadinMi.Parent = MainFrame

    local DiscordBtn = Instance.new("TextButton")
    DiscordBtn.Size = UDim2.new(0.9, 0, 0, 35)
    DiscordBtn.Position = UDim2.new(0.05, 0, 0, 175)
    DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    DiscordBtn.Text = "Join Discord"
    DiscordBtn.Font = Enum.Font.GothamBold
    DiscordBtn.TextSize = 14
    DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    DiscordBtn.Parent = MainFrame
    Instance.new("UICorner", DiscordBtn).CornerRadius = UDim.new(0, 8)

    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(0.9, 0, 0, 20)
    StatusLabel.Position = UDim2.new(0.05, 0, 0, 225)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = "Waiting for input..."
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.TextSize = 12
    StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    StatusLabel.Parent = MainFrame

    local function AddHoverEffect(btn, originalColor, hoverColor)
        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = originalColor}):Play()
        end)
    end

    AddHoverEffect(ExitBtn, Color3.fromRGB(200, 50, 50), Color3.fromRGB(255, 80, 80))
    AddHoverEffect(MinBtn, Color3.fromRGB(50, 50, 60), Color3.fromRGB(70, 70, 80))
    AddHoverEffect(GetKeyBtn, Color3.fromRGB(45, 45, 55), Color3.fromRGB(65, 65, 75))
    AddHoverEffect(CheckKeyBtn, Color3.fromRGB(80, 140, 255), Color3.fromRGB(100, 160, 255))
    AddHoverEffect(DiscordBtn, Color3.fromRGB(88, 101, 242), Color3.fromRGB(110, 125, 255))

    ExitBtn.MouseButton1Click:Connect(function() 
        ScreenGui:Destroy() 
    end)
    
    local isMinimized = false
    MinBtn.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 400, 0, 40)}):Play()
            for _, v in pairs(MainFrame:GetChildren()) do
                if v:IsA("GuiObject") and v ~= Title and v ~= ExitBtn and v ~= MinBtn and v ~= MainStroke and v.Name ~= "UICorner" then
                    v.Visible = false
                end
            end
        else
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 400, 0, 260)}):Play()
            for _, v in pairs(MainFrame:GetChildren()) do
                if v:IsA("GuiObject") then v.Visible = true end
            end
        end
    end)

    DiscordBtn.MouseButton1Click:Connect(function()
        if safeCopy(DiscordLink) then
            StatusLabel.Text = "Discord link copied to clipboard!"
            StatusLabel.TextColor3 = Color3.fromRGB(88, 101, 242)
        else
            KeyInput.Text = DiscordLink
            pcall(function() KeyInput:CaptureFocus() end)
            StatusLabel.Text = "Pasted in box — long press to copy!"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 60)
        end
        task.wait(3)
        StatusLabel.Text = "Waiting for input..."
        StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    end)

    CheckKeyBtn.MouseButton1Click:Connect(function()
        local enteredKey = KeyInput.Text
        if enteredKey == "" then
            StatusLabel.Text = "Please enter a key!"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            task.wait(1.5)
            StatusLabel.Text = "Waiting for input..."
            StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
            return
        end

        if enteredKey == "525252" then
            StatusLabel.Text = "Master Key Accepted! Welcome Deniz."
            StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 100)
            if writefile then pcall(function() writefile(Config.KeyFileName, enteredKey) end) end
            task.wait(0.5)
            ScreenGui:Destroy()
            _G.KeyValidated = true
            return
        end

        StatusLabel.Text = "Verifying..."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        local success, msg = redeemKey(enteredKey)

        if success then
            StatusLabel.Text = "Success! Loading..."
            StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 100)
            task.wait(0.5)
            ScreenGui:Destroy()
            _G.KeyValidated = true
        else
            StatusLabel.Text = msg
            StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            task.wait(2)
            StatusLabel.Text = "Waiting for input..."
            StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
    end)

    GetKeyBtn.MouseButton1Click:Connect(function()
        StatusLabel.Text = "Getting Link..."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        local success, link = cacheLink()
        if success and link then
            if safeCopy(link) then
                StatusLabel.Text = "Link Copied to Clipboard!"
                StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 100)
            else
                KeyInput.Text = link
                pcall(function() KeyInput:CaptureFocus() end)
                StatusLabel.Text = "Pasted in box — long press to copy!"
                StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 60)
            end
        else
            local errDetail = link or "Unknown error"
            StatusLabel.Text = "Error: " .. tostring(errDetail):sub(1, 40)
            StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        end
        task.wait(3)
        StatusLabel.Text = "Waiting for input..."
        StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    end)

    if isfile and isfile(Config.KeyFileName) then
        local savedKey = readfile(Config.KeyFileName)
        if savedKey ~= "" then
            StatusLabel.Text = "Checking saved key..."
            StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            task.spawn(function()
                if savedKey == "525252" then
                    StatusLabel.Text = "Master Auto-login success!"
                    StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 100)
                    task.wait(0.5)
                    ScreenGui:Destroy()
                    _G.KeyValidated = true
                    return
                end

                local success, msg = redeemKey(savedKey)
                if success then
                    StatusLabel.Text = "Auto-login success!"
                    StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 100)
                    task.wait(0.5)
                    ScreenGui:Destroy()
                    _G.KeyValidated = true
                else
                    StatusLabel.Text = "Saved key expired."
                    StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
                    task.wait(2)
                    StatusLabel.Text = "Waiting for input..."
                    StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
                end
            end)
        end
    end
end

CreateKeyUI()

-- KEY ONAYLANANA KADAR SİSTEMİ BEKLET
repeat task.wait(0.1) until _G.KeyValidated

-- ================================================================
--                    BURADAN İTİBAREN ANA DOSYA DEVAM EDER
-- ================================================================

local MenuToggleKey = Enum.KeyCode.RightShift

local Themes = {
	Ghost = {Name = "Ghost", Color = Color3.fromRGB(80, 140, 255), Font = Enum.Font.GothamBold, Trans = 0.45},
	Bloodline = {Name = "Bloodline", Color = Color3.fromRGB(220, 50, 50), Font = Enum.Font.Michroma, Trans = 0.3},
	Emerald = {Name = "Emerald", Color = Color3.fromRGB(40, 220, 120), Font = Enum.Font.Code, Trans = 0.4},
	Midnight = {Name = "Midnight", Color = Color3.fromRGB(160, 80, 255), Font = Enum.Font.Gotham, Trans = 0.55}
}
local CTheme = Themes.Ghost

local ThemeElements = {
	Backgrounds = {},
	Texts = {},
	Fonts = {},
	Toggles = {},
	Scrolls = {},
	Strokes = {}
}

local T = {
	BG = Color3.fromRGB(18, 18, 22),
	BG2 = Color3.fromRGB(24, 24, 30),
	Card = Color3.fromRGB(28, 28, 35),
	CardHover = Color3.fromRGB(35, 35, 44),
	Surface = Color3.fromRGB(32, 32, 40),
	Accent = CTheme.Color,
	AccentSoft = Color3.fromRGB(40, 55, 85),
	Text1 = Color3.fromRGB(240, 240, 245),
	Text2 = Color3.fromRGB(155, 155, 170),
	Text3 = Color3.fromRGB(95, 95, 110),
	Border = Color3.fromRGB(45, 45, 55),
	Divider = Color3.fromRGB(38, 38, 48),
	ToggleOn = CTheme.Color,
	ToggleOff = Color3.fromRGB(55, 55, 65),
	White = Color3.fromRGB(255, 255, 255),
	Red = Color3.fromRGB(220, 60, 60),
	Green = Color3.fromRGB(60, 190, 90),
	Yellow = Color3.fromRGB(240, 190, 40),
}

local function Tw(o,t,p) if o then pcall(function() TweenService:Create(o,TweenInfo.new(t,Enum.EasingStyle.Quint),p):Play() end) end end
local function TwB(o,t,p) if o then pcall(function() TweenService:Create(o,TweenInfo.new(t,Enum.EasingStyle.Back,Enum.EasingDirection.Out),p):Play() end) end end
local function Corner(p,r) local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,r or 8);c.Parent=p end
local function Stroke(p,col,th,tr) local s=Instance.new("UIStroke");s.Color=col or T.Border;s.Thickness=th or 1;s.Transparency=tr or 0.3;s.Parent=p; return s end
local function UpdCanvas(s,l) local function u() s.CanvasSize=UDim2.new(0,0,0,l.AbsoluteContentSize.Y+20) end l:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(u) u() end

-- ================================================================
--                    PREMIUM LOADER SCREEN
-- ================================================================
local loaderGui = Instance.new("ScreenGui")
loaderGui.Name = "KesiciLoader"
pcall(function() loaderGui.Parent = game:GetService("CoreGui") end)
if not loaderGui.Parent then loaderGui.Parent = Player:WaitForChild("PlayerGui") end

local lMain = Instance.new("Frame")
lMain.Size = UDim2.new(0, 400, 0, 200)
lMain.Position = UDim2.new(0.5, -200, 0.5, -100)
lMain.BackgroundColor3 = T.BG
lMain.BackgroundTransparency = 0.1
lMain.Parent = loaderGui
Corner(lMain, 12)
Stroke(lMain, CTheme.Color, 2, 0)

local lTitle = Instance.new("TextLabel")
lTitle.Text = "KESICI HUB PROFESSIONAL"
lTitle.Font = Enum.Font.GothamBold
lTitle.TextSize = 20
lTitle.TextColor3 = T.White
lTitle.BackgroundTransparency = 1
lTitle.Size = UDim2.new(1, 0, 0, 50)
lTitle.Position = UDim2.new(0, 0, 0, 20)
lTitle.Parent = lMain

local lStatus = Instance.new("TextLabel")
lStatus.Text = "Initializing systems..."
lStatus.Font = Enum.Font.Gotham
lStatus.TextSize = 13
lStatus.TextColor3 = T.Text2
lStatus.BackgroundTransparency = 1
lStatus.Size = UDim2.new(1, 0, 0, 30)
lStatus.Position = UDim2.new(0, 0, 0, 80)
lStatus.Parent = lMain

local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0.8, 0, 0, 6)
barBg.Position = UDim2.new(0.1, 0, 0, 130)
barBg.BackgroundColor3 = T.BG2
barBg.Parent = lMain
Corner(barBg, 3)

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = CTheme.Color
barFill.Parent = barBg
Corner(barFill, 3)

local loadSteps = {
	"Connecting to secure servers...",
	"Validating premium license...",
	"Loading custom physics engine...",
	"Bypassing anticheat...",
	"Welcome back, " .. Player.Name .. "!"
}

for i, stepText in ipairs(loadSteps) do
	lStatus.Text = stepText
	Tw(barFill, 0.6, {Size = UDim2.new(i / #loadSteps, 0, 1, 0)})
	task.wait(0.7)
end
task.wait(0.5)
Tw(lMain, 0.4, {BackgroundTransparency = 1})
Tw(lTitle, 0.4, {TextTransparency = 1})
Tw(lStatus, 0.4, {TextTransparency = 1})
Tw(barBg, 0.4, {BackgroundTransparency = 1})
Tw(barFill, 0.4, {BackgroundTransparency = 1})
task.wait(0.4)
loaderGui:Destroy()

-- ================================================================
--                    MAIN UI SYSTEM
-- ================================================================

local Gui=Instance.new("ScreenGui");Gui.Name="KesiciHub";Gui.ResetOnSpawn=false
pcall(function() Gui.Parent=game:GetService("CoreGui") end)
if not Gui.Parent then Gui.Parent=Player:WaitForChild("PlayerGui") end

local winW,winH=520,420
local winSize=UDim2.new(0,winW,0,winH)

local Main=Instance.new("Frame");Main.BackgroundColor3=T.BG;Main.BackgroundTransparency=CTheme.Trans
Main.Size=UDim2.new(0,0,0,0);Main.Position=UDim2.new(0.5,0,0.5,0);Main.AnchorPoint=Vector2.new(0.5,0.5)
Main.ClipsDescendants=true;Main.ZIndex=2;Main.Parent=Gui;Corner(Main,14)
local MainStroke = Stroke(Main,T.Accent,1,0.2)
table.insert(ThemeElements.Strokes, MainStroke)

local uiOpen,minimized,destroyed=true,false,false

local function ShowUI()
	if destroyed then return end
	uiOpen=true;Main.Visible=true
	TwB(Main,0.5,{Size=minimized and UDim2.new(0,winW,0,56) or winSize})
end

local function HideUI()
	if destroyed then return end;uiOpen=false
	Tw(Main,0.3,{Size=UDim2.new(0,0,0,0)})
	task.delay(0.35,function()
		if not uiOpen then Main.Visible=false end
	end)
end

task.wait(0.05);ShowUI()

do
	local dragging,dragStart,startPos
	local DZ=Instance.new("Frame");DZ.BackgroundTransparency=1;DZ.Size=UDim2.new(1,0,0,56)
	DZ.ZIndex=10;DZ.Parent=Main
	DZ.InputBegan:Connect(function(input)
		-- MOBIL DESTEK EKLENDI
		if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
			dragging=true;dragStart=input.Position;startPos=Main.Position
			input.Changed:Connect(function()
				if input.UserInputState==Enum.UserInputState.End then dragging=false end
			end)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		-- MOBIL DESTEK EKLENDI
		if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
			local d=input.Position-dragStart
			Main.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
		end
	end)
end

local TopLine=Instance.new("Frame");TopLine.BackgroundColor3=T.Accent
TopLine.Size=UDim2.new(1,0,0,2);TopLine.BorderSizePixel=0;TopLine.ZIndex=5;TopLine.Parent=Main
table.insert(ThemeElements.Backgrounds, TopLine)

local TopBar=Instance.new("Frame");TopBar.BackgroundColor3=T.BG2;TopBar.BackgroundTransparency=0.2
TopBar.Size=UDim2.new(1,0,0,56);TopBar.BorderSizePixel=0;TopBar.ZIndex=3;TopBar.Parent=Main

local LogoBG=Instance.new("Frame");LogoBG.BackgroundColor3=T.Accent
LogoBG.Size=UDim2.new(0,36,0,36);LogoBG.Position=UDim2.new(0,14,0,10)
LogoBG.ZIndex=4;LogoBG.Parent=TopBar;Corner(LogoBG,10)
table.insert(ThemeElements.Backgrounds, LogoBG)

local LogoI=Instance.new("TextLabel");LogoI.Text="K";LogoI.Font=Enum.Font.SourceSansBold
LogoI.TextSize=22;LogoI.TextColor3=T.White;LogoI.BackgroundTransparency=1
LogoI.Size=UDim2.new(1,0,1,0);LogoI.ZIndex=5;LogoI.Parent=LogoBG

local TitleL=Instance.new("TextLabel");TitleL.Text="Kesici Hub";TitleL.Font=CTheme.Font
TitleL.TextSize=17;TitleL.TextColor3=T.Text1;TitleL.TextXAlignment=Enum.TextXAlignment.Left
TitleL.BackgroundTransparency=1;TitleL.Position=UDim2.new(0,60,0,9)
TitleL.Size=UDim2.new(0.5,0,0,20);TitleL.ZIndex=4;TitleL.Parent=TopBar
table.insert(ThemeElements.Fonts, TitleL)

local SubL=Instance.new("TextLabel");SubL.Text="goalkeeper tools";SubL.Font=Enum.Font.Gotham
SubL.TextSize=11;SubL.TextColor3=T.Text3;SubL.TextXAlignment=Enum.TextXAlignment.Left
SubL.BackgroundTransparency=1;SubL.Position=UDim2.new(0,60,0,30)
SubL.Size=UDim2.new(0.5,0,0,15);SubL.ZIndex=4;SubL.Parent=TopBar

local XBtn=Instance.new("TextButton");XBtn.Text="X";XBtn.Font=Enum.Font.GothamBold
XBtn.TextSize=15;XBtn.TextColor3=T.Text2;XBtn.BackgroundColor3=T.Red;XBtn.BackgroundTransparency=1
XBtn.Size=UDim2.new(0,34,0,34);XBtn.Position=UDim2.new(1,-44,0,11);XBtn.ZIndex=5;XBtn.Parent=TopBar;Corner(XBtn,8)
XBtn.MouseEnter:Connect(function() Tw(XBtn,0.15,{BackgroundTransparency=0.15,TextColor3=T.White}) end)
XBtn.MouseLeave:Connect(function() Tw(XBtn,0.15,{BackgroundTransparency=1,TextColor3=T.Text2}) end)
XBtn.MouseButton1Click:Connect(HideUI)

local MnBtn=Instance.new("TextButton");MnBtn.Text="-";MnBtn.Font=Enum.Font.GothamBold
MnBtn.TextSize=22;MnBtn.TextColor3=T.Text2;MnBtn.BackgroundColor3=T.Surface;MnBtn.BackgroundTransparency=1
MnBtn.Size=UDim2.new(0,34,0,34);MnBtn.Position=UDim2.new(1,-82,0,11);MnBtn.ZIndex=5;MnBtn.Parent=TopBar;Corner(MnBtn,8)
MnBtn.MouseEnter:Connect(function() Tw(MnBtn,0.15,{BackgroundTransparency=0.3,TextColor3=T.Text1}) end)
MnBtn.MouseLeave:Connect(function() Tw(MnBtn,0.15,{BackgroundTransparency=1,TextColor3=T.Text2}) end)
MnBtn.MouseButton1Click:Connect(function()
	minimized=not minimized
	Tw(Main,0.35,{Size=minimized and UDim2.new(0,winW,0,56) or winSize})
end)

local Dv=Instance.new("Frame");Dv.BackgroundColor3=T.Divider;Dv.Size=UDim2.new(1,0,0,1)
Dv.Position=UDim2.new(0,0,0,56);Dv.BorderSizePixel=0;Dv.ZIndex=3;Dv.Parent=Main

local Sidebar=Instance.new("Frame");Sidebar.BackgroundColor3=T.BG2;Sidebar.BackgroundTransparency=0.05
Sidebar.Size=UDim2.new(0,130,1,-57);Sidebar.Position=UDim2.new(0,0,0,57)
Sidebar.BorderSizePixel=0;Sidebar.ZIndex=3;Sidebar.Parent=Main

local TabScroll=Instance.new("ScrollingFrame");TabScroll.BackgroundTransparency=1
TabScroll.Size=UDim2.new(1,-8,1,-68);TabScroll.Position=UDim2.new(0,4,0,4)
TabScroll.ScrollBarThickness=0;TabScroll.CanvasSize=UDim2.new(0,0,0,0)
TabScroll.BorderSizePixel=0;TabScroll.ZIndex=4;TabScroll.Parent=Sidebar
local TabLy=Instance.new("UIListLayout");TabLy.Padding=UDim.new(0,3);TabLy.Parent=TabScroll
UpdCanvas(TabScroll,TabLy)

-- ================================================================
--                    USER PROFILE PANEL (BOTTOM LEFT)
-- ================================================================
local ProfilePanel = Instance.new("Frame")
ProfilePanel.BackgroundColor3 = T.BG2
ProfilePanel.BackgroundTransparency = 0.3
ProfilePanel.Size = UDim2.new(1, 0, 0, 60)
ProfilePanel.Position = UDim2.new(0, 0, 1, -60)
ProfilePanel.BorderSizePixel = 0
ProfilePanel.ZIndex = 4
ProfilePanel.Parent = Sidebar

local Avatar = Instance.new("ImageLabel")
Avatar.Size = UDim2.new(0, 36, 0, 36)
Avatar.Position = UDim2.new(0, 12, 0, 12)
Avatar.BackgroundColor3 = T.Surface
Avatar.ZIndex = 5
Avatar.Parent = ProfilePanel
Corner(Avatar, 18) 
pcall(function() Avatar.Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420) end)

local NickLabel = Instance.new("TextLabel")
NickLabel.Text = Player.Name
NickLabel.Font = CTheme.Font
NickLabel.TextSize = 12
NickLabel.TextColor3 = T.Text1
NickLabel.TextXAlignment = Enum.TextXAlignment.Left
NickLabel.BackgroundTransparency = 1
NickLabel.Position = UDim2.new(0, 56, 0, 16)
NickLabel.Size = UDim2.new(1, -60, 0, 14)
NickLabel.ZIndex = 5
NickLabel.Parent = ProfilePanel
table.insert(ThemeElements.Fonts, NickLabel)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Text = "Premium User"
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 10
StatusLabel.TextColor3 = CTheme.Color
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 56, 0, 30)
StatusLabel.Size = UDim2.new(1, -60, 0, 14)
StatusLabel.ZIndex = 5
StatusLabel.Parent = ProfilePanel
table.insert(ThemeElements.Texts, StatusLabel)

local Content=Instance.new("Frame");Content.BackgroundTransparency=1
Content.Size=UDim2.new(1,-131,1,-57);Content.Position=UDim2.new(0,131,0,57)
Content.ClipsDescendants=true;Content.ZIndex=3;Content.Parent=Main

local NotifH=Instance.new("Frame");NotifH.BackgroundTransparency=1
NotifH.Size=UDim2.new(0,300,1,-20);NotifH.Position=UDim2.new(1,-310,0,10)
NotifH.ZIndex=30;NotifH.Parent=Gui
local NLy=Instance.new("UIListLayout");NLy.Padding=UDim.new(0,8)
NLy.VerticalAlignment=Enum.VerticalAlignment.Bottom;NLy.Parent=NotifH

-- Tab System
local AllTabs,ActiveTab={},nil
local function SwitchTab(tab)
	for _,t2 in pairs(AllTabs) do
		t2.Page.Visible=false
		Tw(t2.Btn,0.2,{BackgroundTransparency=1})
		Tw(t2.Lbl,0.2,{TextColor3=T.Text2})
		Tw(t2.Ind,0.2,{Size=UDim2.new(0,3,0,0),BackgroundTransparency=1})
	end
	tab.Page.Visible=true;ActiveTab=tab
	Tw(tab.Btn,0.25,{BackgroundTransparency=0.4})
	Tw(tab.Lbl,0.25,{TextColor3=T.Text1})
	TwB(tab.Ind,0.3,{Size=UDim2.new(0,3,0,18),BackgroundTransparency=0,BackgroundColor3=CTheme.Color})
end

local function MakeTab(name,icon)
	local Tab={}
	local Btn=Instance.new("TextButton");Btn.Text="";Btn.BackgroundColor3=T.Card
	Btn.BackgroundTransparency=1;Btn.Size=UDim2.new(1,0,0,40);Btn.ZIndex=5
	Btn.Parent=TabScroll;Corner(Btn,8)

	local Ind=Instance.new("Frame");Ind.BackgroundColor3=CTheme.Color;Ind.BackgroundTransparency=1
	Ind.Size=UDim2.new(0,3,0,0);Ind.Position=UDim2.new(0,2,0.5,0);Ind.AnchorPoint=Vector2.new(0,0.5)
	Ind.BorderSizePixel=0;Ind.ZIndex=6;Ind.Parent=Btn;Corner(Ind,2)

	local Ico=Instance.new("TextLabel");Ico.Text=icon;Ico.Font=Enum.Font.GothamBold
	Ico.TextSize=16;Ico.TextColor3=T.Text3;Ico.BackgroundTransparency=1
	Ico.Size=UDim2.new(0,26,1,0);Ico.Position=UDim2.new(0,14,0,0);Ico.ZIndex=6;Ico.Parent=Btn

	local Lbl=Instance.new("TextLabel");Lbl.Text=name;Lbl.Font=CTheme.Font
	Lbl.TextSize=13;Lbl.TextColor3=T.Text2;Lbl.TextXAlignment=Enum.TextXAlignment.Left
	Lbl.BackgroundTransparency=1;Lbl.Size=UDim2.new(1,-48,1,0);Lbl.Position=UDim2.new(0,42,0,0)
	Lbl.ZIndex=6;Lbl.Parent=Btn
	table.insert(ThemeElements.Fonts, Lbl)

	local Page=Instance.new("ScrollingFrame");Page.BackgroundTransparency=1
	Page.Size=UDim2.new(1,-14,1,-14);Page.Position=UDim2.new(0,7,0,7)
	Page.ScrollBarThickness=3;Page.ScrollBarImageColor3=CTheme.Color
	Page.CanvasSize=UDim2.new(0,0,0,0);Page.BorderSizePixel=0;Page.Visible=false
	Page.ZIndex=4;Page.Parent=Content
	table.insert(ThemeElements.Scrolls, Page)

	local PLy=Instance.new("UIListLayout");PLy.Padding=UDim.new(0,8);PLy.Parent=Page
	UpdCanvas(Page,PLy)

	Tab.Btn=Btn;Tab.Lbl=Lbl;Tab.Ico=Ico;Tab.Ind=Ind;Tab.Page=Page
	Btn.MouseEnter:Connect(function() if ActiveTab~=Tab then Tw(Btn,0.12,{BackgroundTransparency=0.6}) end end)
	Btn.MouseLeave:Connect(function() if ActiveTab~=Tab then Tw(Btn,0.12,{BackgroundTransparency=1}) end end)
	Btn.MouseButton1Click:Connect(function() SwitchTab(Tab) end)
	table.insert(AllTabs,Tab);if #AllTabs==1 then SwitchTab(Tab) end
	return Page
end

-- Section
local function MakeSection(page,name)
	local Sec={}
	local SF=Instance.new("Frame");SF.BackgroundColor3=T.Card;SF.BackgroundTransparency=0.08
	SF.Size=UDim2.new(1,0,0,0);SF.BorderSizePixel=0;SF.ZIndex=5;SF.Parent=page
	Corner(SF,12);Stroke(SF,T.Border,1,0.4)

	local Pd=Instance.new("UIPadding");Pd.PaddingTop=UDim.new(0,12);Pd.PaddingBottom=UDim.new(0,12)
	Pd.PaddingLeft=UDim.new(0,14);Pd.PaddingRight=UDim.new(0,14);Pd.Parent=SF

	local Ly=Instance.new("UIListLayout");Ly.Padding=UDim.new(0,7);Ly.Parent=SF
	local function upd() SF.Size=UDim2.new(1,0,0,Ly.AbsoluteContentSize.Y+26) end
	Ly:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(upd);task.defer(upd)

	if name and name~="" then
		local ST=Instance.new("TextLabel");ST.Text=name;ST.Font=CTheme.Font
		ST.TextSize=14;ST.TextColor3=T.Text1;ST.TextXAlignment=Enum.TextXAlignment.Left
		ST.BackgroundTransparency=1;ST.Size=UDim2.new(1,0,0,22);ST.ZIndex=6;ST.Parent=SF
		table.insert(ThemeElements.Fonts, ST)

		local SD=Instance.new("Frame");SD.BackgroundColor3=T.Divider
		SD.Size=UDim2.new(1,0,0,1);SD.BorderSizePixel=0;SD.ZIndex=6;SD.Parent=SF
	end

	function Sec:AddToggle(c)
		c=c or{}
		local nm,desc,def,cb=c.Name or"Setting",c.Description,c.Default or false,c.Callback or function()end
		local state=def;local h=desc and 54 or 40
		local TF=Instance.new("TextButton");TF.Text="";TF.BackgroundColor3=T.Surface
		TF.BackgroundTransparency=0.2;TF.Size=UDim2.new(1,0,0,h);TF.ZIndex=6;TF.Parent=SF;Corner(TF,10)

		local TL=Instance.new("TextLabel");TL.Text=nm;TL.Font=CTheme.Font;TL.TextSize=13
		TL.TextColor3=T.Text1;TL.TextXAlignment=Enum.TextXAlignment.Left;TL.BackgroundTransparency=1
		TL.Size=UDim2.new(1,-68,0,18);TL.Position=UDim2.new(0,14,0,desc and 9 or 11);TL.ZIndex=7;TL.Parent=TF
		table.insert(ThemeElements.Fonts, TL)

		if desc then
			local TD=Instance.new("TextLabel");TD.Text=desc;TD.Font=Enum.Font.Gotham;TD.TextSize=11
			TD.TextColor3=T.Text3;TD.TextXAlignment=Enum.TextXAlignment.Left;TD.BackgroundTransparency=1
			TD.Size=UDim2.new(1,-68,0,14);TD.Position=UDim2.new(0,14,0,31);TD.ZIndex=7;TD.Parent=TF
		end
		local SBG=Instance.new("Frame");SBG.BackgroundColor3=state and T.ToggleOn or T.ToggleOff
		SBG.Size=UDim2.new(0,44,0,24);SBG.Position=UDim2.new(1,-56,0.5,0)
		SBG.AnchorPoint=Vector2.new(0,0.5);SBG.ZIndex=7;SBG.Parent=TF;Corner(SBG,12)

		table.insert(ThemeElements.Toggles, {bg = SBG, getState = function() return state end})

		local Knob=Instance.new("Frame");Knob.BackgroundColor3=T.White;Knob.Size=UDim2.new(0,18,0,18)
		Knob.Position=state and UDim2.new(1,-21,0.5,0) or UDim2.new(0,3,0.5,0)
		Knob.AnchorPoint=Vector2.new(0,0.5);Knob.ZIndex=8;Knob.Parent=SBG;Corner(Knob,9)
		local function updT()
			Tw(SBG,0.25,{BackgroundColor3=state and T.ToggleOn or T.ToggleOff})
			TwB(Knob,0.3,{Position=state and UDim2.new(1,-21,0.5,0) or UDim2.new(0,3,0.5,0)})
		end
		TF.MouseEnter:Connect(function() Tw(TF,0.1,{BackgroundTransparency=0.05,BackgroundColor3=T.CardHover}) end)
		TF.MouseLeave:Connect(function() Tw(TF,0.1,{BackgroundTransparency=0.2,BackgroundColor3=T.Surface}) end)
		TF.MouseButton1Click:Connect(function() state=not state;updT();pcall(cb,state) end)
		task.defer(upd)
		return{Set=function(_,v) state=v;updT();pcall(cb,v) end,Get=function() return state end}
	end

	function Sec:AddSlider(c)
		c=c or{}
		local nm,desc=c.Name or"Setting",c.Description
		local min,max,def=c.Min or 0,c.Max or 100,c.Default or c.Min or 0
		local sfx,inc,cb=c.Suffix or"",c.Increment or 1,c.Callback or function()end
		local val=def;local dH=desc and 16 or 0
		local SF2=Instance.new("Frame");SF2.BackgroundColor3=T.Surface;SF2.BackgroundTransparency=0.2
		SF2.Size=UDim2.new(1,0,0,62+dH);SF2.ZIndex=6;SF2.Parent=SF;Corner(SF2,10)

		local SL=Instance.new("TextLabel");SL.Text=nm;SL.Font=CTheme.Font;SL.TextSize=13
		SL.TextColor3=T.Text1;SL.TextXAlignment=Enum.TextXAlignment.Left;SL.BackgroundTransparency=1
		SL.Size=UDim2.new(0.6,0,0,18);SL.Position=UDim2.new(0,14,0,8);SL.ZIndex=7;SL.Parent=SF2
		table.insert(ThemeElements.Fonts, SL)

		if desc then
			local SD2=Instance.new("TextLabel");SD2.Text=desc;SD2.Font=Enum.Font.Gotham;SD2.TextSize=11
			SD2.TextColor3=T.Text3;SD2.TextXAlignment=Enum.TextXAlignment.Left;SD2.BackgroundTransparency=1
			SD2.Size=UDim2.new(0.55,0,0,14);SD2.Position=UDim2.new(0,14,0,27);SD2.ZIndex=7;SD2.Parent=SF2
		end
		local VL=Instance.new("TextLabel");VL.Text=tostring(val)..sfx;VL.Font=Enum.Font.GothamBold
		VL.TextSize=14;VL.TextColor3=T.Accent;VL.TextXAlignment=Enum.TextXAlignment.Right
		VL.BackgroundTransparency=1;VL.Size=UDim2.new(0.35,-14,0,18);VL.Position=UDim2.new(0.65,0,0,8)
		VL.ZIndex=7;VL.Parent=SF2
		table.insert(ThemeElements.Texts, VL)

		local barY=32+dH+8
		local BarBG=Instance.new("Frame");BarBG.BackgroundColor3=T.ToggleOff
		BarBG.Size=UDim2.new(1,-28,0,6);BarBG.Position=UDim2.new(0,14,0,barY)
		BarBG.ZIndex=7;BarBG.Parent=SF2;Corner(BarBG,3)
		local Fill=Instance.new("Frame");Fill.BackgroundColor3=T.Accent
		Fill.Size=UDim2.new((def-min)/(max-min),0,1,0);Fill.BorderSizePixel=0
		Fill.ZIndex=8;Fill.Parent=BarBG;Corner(Fill,3)
		table.insert(ThemeElements.Backgrounds, Fill)

		local KS=Instance.new("Frame");KS.BackgroundColor3=T.White;KS.Size=UDim2.new(0,18,0,18)
		KS.Position=UDim2.new((def-min)/(max-min),0,0.5,0);KS.AnchorPoint=Vector2.new(0.5,0.5)
		KS.ZIndex=9;KS.Parent=BarBG;Corner(KS,9)
		local sliding=false
		local function updS(x)
			local pct=math.clamp((x-BarBG.AbsolutePosition.X)/BarBG.AbsoluteSize.X,0,1)
			val=math.floor((min+(max-min)*pct)/inc+0.5)*inc;val=math.clamp(val,min,max)
			local p=(val-min)/(max-min)
			Fill.Size=UDim2.new(p,0,1,0);KS.Position=UDim2.new(p,0,0.5,0)
			VL.Text=tostring(val)..sfx;pcall(cb,val)
		end
		SF2.InputBegan:Connect(function(i)
			-- MOBIL DESTEK EKLENDI
			if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sliding=true;updS(i.Position.X) end
		end)
		SF2.InputEnded:Connect(function(i)
			-- MOBIL DESTEK EKLENDI
			if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sliding=false end
		end)
		UserInputService.InputChanged:Connect(function(i)
			-- MOBIL DESTEK EKLENDI
			if sliding and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then updS(i.Position.X) end
		end)
		task.defer(upd)
		return{Set=function(_,v) val=math.clamp(v,min,max);local p=(val-min)/(max-min)
			Fill.Size=UDim2.new(p,0,1,0);KS.Position=UDim2.new(p,0,0.5,0)
			VL.Text=tostring(val)..sfx;pcall(cb,val) end,Get=function() return val end}
	end

	function Sec:AddButton(c)
		c=c or{}
		local nm, desc, cb = c.Name or "Button", c.Description, c.Callback or function()end
		local h = desc and 54 or 40
		local BF=Instance.new("TextButton");BF.Text="";BF.BackgroundColor3=T.Surface
		BF.BackgroundTransparency=0.2;BF.Size=UDim2.new(1,0,0,h);BF.ZIndex=6;BF.Parent=SF;Corner(BF,10)

		local TL=Instance.new("TextLabel");TL.Text=nm;TL.Font=CTheme.Font;TL.TextSize=13
		TL.TextColor3=T.Text1;TL.TextXAlignment=Enum.TextXAlignment.Left;TL.BackgroundTransparency=1
		TL.Size=UDim2.new(1,-68,0,18);TL.Position=UDim2.new(0,14,0,desc and 9 or 11);TL.ZIndex=7;TL.Parent=BF
		table.insert(ThemeElements.Fonts, TL)

		if desc then
			local TD=Instance.new("TextLabel");TD.Text=desc;TD.Font=Enum.Font.Gotham;TD.TextSize=11
			TD.TextColor3=T.Text3;TD.TextXAlignment=Enum.TextXAlignment.Left;TD.BackgroundTransparency=1
			TD.Size=UDim2.new(1,-68,0,14);TD.Position=UDim2.new(0,14,0,31);TD.ZIndex=7;TD.Parent=BF
		end
		local Ico=Instance.new("TextLabel");Ico.Text=">";Ico.Font=Enum.Font.GothamBold;Ico.TextSize=16
		Ico.TextColor3=T.Text2;Ico.BackgroundTransparency=1;Ico.Size=UDim2.new(0,20,0,20)
		Ico.Position=UDim2.new(1,-30,0.5,-10);Ico.ZIndex=7;Ico.Parent=BF

		BF.MouseEnter:Connect(function() Tw(BF,0.1,{BackgroundTransparency=0.05,BackgroundColor3=T.CardHover}) end)
		BF.MouseLeave:Connect(function() Tw(BF,0.1,{BackgroundTransparency=0.2,BackgroundColor3=T.Surface}) end)
		BF.MouseButton1Click:Connect(function() pcall(cb) end)
		task.defer(upd)
	end

	function Sec:AddKeybind(c)
		c=c or{}
		local nm,desc,def,cb=c.Name or"Keybind",c.Description,c.Default or Enum.KeyCode.RightShift,c.Callback or function()end
		local key=def;local h=desc and 54 or 40
		local BF=Instance.new("TextButton");BF.Text="";BF.BackgroundColor3=T.Surface
		BF.BackgroundTransparency=0.2;BF.Size=UDim2.new(1,0,0,h);BF.ZIndex=6;BF.Parent=SF;Corner(BF,10)

		local TL=Instance.new("TextLabel");TL.Text=nm;TL.Font=CTheme.Font;TL.TextSize=13
		TL.TextColor3=T.Text1;TL.TextXAlignment=Enum.TextXAlignment.Left;TL.BackgroundTransparency=1
		TL.Size=UDim2.new(1,-68,0,18);TL.Position=UDim2.new(0,14,0,desc and 9 or 11);TL.ZIndex=7;TL.Parent=BF
		table.insert(ThemeElements.Fonts, TL)

		if desc then
			local TD=Instance.new("TextLabel");TD.Text=desc;TD.Font=Enum.Font.Gotham;TD.TextSize=11
			TD.TextColor3=T.Text3;TD.TextXAlignment=Enum.TextXAlignment.Left;TD.BackgroundTransparency=1
			TD.Size=UDim2.new(1,-68,0,14);TD.Position=UDim2.new(0,14,0,31);TD.ZIndex=7;TD.Parent=BF
		end

		local BindText=Instance.new("TextLabel");BindText.Text=key.Name;BindText.Font=Enum.Font.GothamBold;BindText.TextSize=13
		BindText.TextColor3=T.Accent;BindText.BackgroundTransparency=1;BindText.Size=UDim2.new(0,60,0,20)
		BindText.Position=UDim2.new(1,-70,0.5,-10);BindText.ZIndex=7;BindText.Parent=BF
		table.insert(ThemeElements.Texts, BindText)

		local binding = false
		BF.MouseEnter:Connect(function() Tw(BF,0.1,{BackgroundTransparency=0.05,BackgroundColor3=T.CardHover}) end)
		BF.MouseLeave:Connect(function() Tw(BF,0.1,{BackgroundTransparency=0.2,BackgroundColor3=T.Surface}) end)
		BF.MouseButton1Click:Connect(function()
			binding = true
			BindText.Text = "..."
		end)

		UserInputService.InputBegan:Connect(function(input)
			if binding and input.UserInputType == Enum.UserInputType.Keyboard then
				key = input.KeyCode
				BindText.Text = key.Name
				binding = false
				pcall(cb, key)
			end
		end)
		task.defer(upd)
	end

	task.defer(upd);return Sec
end

-- Theme Engine Application
local function ApplyTheme(theme)
	CTheme = theme
	T.Accent = theme.Color
	T.ToggleOn = theme.Color

	Tw(Main, 0.5, {BackgroundTransparency = theme.Trans})

	for _, bg in pairs(ThemeElements.Backgrounds) do pcall(function() Tw(bg, 0.3, {BackgroundColor3 = theme.Color}) end) end
	for _, tx in pairs(ThemeElements.Texts) do pcall(function() Tw(tx, 0.3, {TextColor3 = theme.Color}) end) end
	for _, fn in pairs(ThemeElements.Fonts) do pcall(function() fn.Font = theme.Font end) end
	for _, sc in pairs(ThemeElements.Scrolls) do pcall(function() sc.ScrollBarImageColor3 = theme.Color end) end
	for _, st in pairs(ThemeElements.Strokes) do pcall(function() Tw(st, 0.3, {Color = theme.Color}) end) end
	for _, tog in pairs(ThemeElements.Toggles) do 
		pcall(function() 
			if tog.getState() then Tw(tog.bg, 0.3, {BackgroundColor3 = theme.Color}) end 
		end) 
	end
	if ActiveTab then pcall(function() Tw(ActiveTab.Ind, 0.3, {BackgroundColor3 = theme.Color}) end) end
end

-- Notify
local function Notify(c)
	c=c or{};local nT,nC,nD,nTy=c.Title or"",c.Content or"",c.Duration or 3,c.Type or"Info"
	local cls={Info=T.Accent,Success=T.Green,Warning=T.Yellow,Error=T.Red}
	local ics={Info="ℹ",Success="✓",Warning="⚠",Error="✕"};local col=cls[nTy]
	if nTy == "Info" then col = CTheme.Color end

	local NF=Instance.new("Frame");NF.BackgroundColor3=T.Card;NF.Size=UDim2.new(1,0,0,0)
	NF.ClipsDescendants=true;NF.ZIndex=31;NF.Parent=NotifH;Corner(NF,12)
	local NA=Instance.new("Frame");NA.BackgroundColor3=col;NA.Size=UDim2.new(1,0,0,2)
	NA.BorderSizePixel=0;NA.ZIndex=32;NA.Parent=NF
	local NI=Instance.new("TextLabel");NI.Text=ics[nTy];NI.Font=Enum.Font.GothamBold;NI.TextSize=18
	NI.TextColor3=col;NI.BackgroundTransparency=1;NI.Size=UDim2.new(0,28,0,28)
	NI.Position=UDim2.new(0,12,0,14);NI.ZIndex=32;NI.Parent=NF
	local NT2=Instance.new("TextLabel");NT2.Text=nT;NT2.Font=CTheme.Font;NT2.TextSize=13
	NT2.TextColor3=T.Text1;NT2.TextXAlignment=Enum.TextXAlignment.Left;NT2.BackgroundTransparency=1
	NT2.Size=UDim2.new(1,-50,0,16);NT2.Position=UDim2.new(0,44,0,12);NT2.ZIndex=32;NT2.Parent=NF
	local NC2=Instance.new("TextLabel");NC2.Text=nC;NC2.Font=Enum.Font.Gotham;NC2.TextSize=11
	NC2.TextColor3=T.Text2;NC2.TextXAlignment=Enum.TextXAlignment.Left;NC2.BackgroundTransparency=1
	NC2.Size=UDim2.new(1,-50,0,26);NC2.Position=UDim2.new(0,44,0,30);NC2.ZIndex=32;NT2.Parent=NF
	TwB(NF,0.4,{Size=UDim2.new(1,0,0,64)})
	task.delay(nD,function()
		Tw(NF,0.3,{Size=UDim2.new(1,0,0,0)})
		task.delay(0.35,function() pcall(function() NF:Destroy() end) end)
	end)
end

-- ================================================================
--                    SYSTEMS (BALL & CHARACTER)
-- ================================================================

local Balls = {}
local ESPHighlights = {}
local BallESP = {Enabled = false}
local BallLock = {Enabled = false, Distance = 50, Smoothness = 0.15}
local Magnet = {Enabled = false, Distance = 60}
local ballLockPaused = false

local function IsBall(obj)
	if not obj:IsA("BasePart") then return false end
	if obj.Anchored then return false end
	if obj.Transparency >= 0.9 then return false end
	local p = obj.Parent
	while p and p ~= workspace do
		if p:IsA("Model") and p:FindFirstChildOfClass("Humanoid") then return false end
		if p:IsA("Accessory") or p:IsA("Tool") then return false end
		p = p.Parent
	end
	local s = obj.Size
	if s.X > 6 or s.Y > 6 or s.Z > 6 or s.X < 0.3 then return false end
	if obj:IsA("Part") and obj.Shape == Enum.PartType.Ball then return true end
	if obj:IsA("MeshPart") then
		local avg = (s.X + s.Y + s.Z) / 3
		local diff = math.max(math.abs(s.X - avg), math.abs(s.Y - avg), math.abs(s.Z - avg))
		if diff < avg * 0.3 and avg >= 0.5 and avg <= 5 then return true end
	end
	return false
end

local function ScanBalls()
	Balls = {}
	for _, obj in pairs(workspace:GetDescendants()) do
		if IsBall(obj) then table.insert(Balls, obj) end
	end
end

local function GetClosestBall(root, maxDist)
	local closest, closestDist = nil, maxDist or math.huge
	for _, ball in pairs(Balls) do
		if ball and ball.Parent then
			local dist = (ball.Position - root.Position).Magnitude
			if dist < closestDist then closest = ball; closestDist = dist end
		end
	end
	return closest, closestDist
end

local function ClearAllESP()
	for _, hl in pairs(ESPHighlights) do pcall(function() hl:Destroy() end) end
	ESPHighlights = {}
end

ScanBalls()

workspace.DescendantAdded:Connect(function(obj)
	task.delay(0.2, function()
		if obj and obj.Parent and IsBall(obj) then
			for _, b in pairs(Balls) do if b == obj then return end end
			table.insert(Balls, obj)
		end
	end)
end)

workspace.DescendantRemoving:Connect(function(obj)
	if ESPHighlights[obj] then
		pcall(function() ESPHighlights[obj]:Destroy() end)
		ESPHighlights[obj] = nil
	end
	for i = #Balls, 1, -1 do
		if Balls[i] == obj then table.remove(Balls, i); break end
	end
end)

-- ESP loop
task.spawn(function()
	while true do
		task.wait(0.3)
		for i = #Balls, 1, -1 do
			if not Balls[i] or not Balls[i].Parent then table.remove(Balls, i) end
		end
		local char = Player.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		if BallESP.Enabled then
			for _, ball in pairs(Balls) do
				if ball and ball.Parent then
					if not ESPHighlights[ball] then
						local hl = Instance.new("Highlight")
						hl.Name = "KesiciESP"
						hl.FillTransparency = 0.4
						hl.OutlineTransparency = 0
						hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						hl.Adornee = ball
						hl.Parent = Gui
						ESPHighlights[ball] = hl
					end
					if root and ESPHighlights[ball] then
						local dist = (ball.Position - root.Position).Magnitude
						local col = dist < 20 and Color3.fromRGB(80, 255, 100)
							or dist < 50 and Color3.fromRGB(255, 200, 60)
							or Color3.fromRGB(255, 70, 70)
						pcall(function()
							ESPHighlights[ball].FillColor = col
							ESPHighlights[ball].OutlineColor = col
						end)
					end
				end
			end
			for ball, hl in pairs(ESPHighlights) do
				if not ball or not ball.Parent then
					pcall(function() hl:Destroy() end)
					ESPHighlights[ball] = nil
				end
			end
		else
			if next(ESPHighlights) then ClearAllESP() end
		end
	end
end)

-- BallLock Physics Loop
RunService.RenderStepped:Connect(function()
	local char = Player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")

	-- BallLock Logic
	if not BallLock.Enabled then return end
	if not root then return end
	local ball, dist = GetClosestBall(root, BallLock.Distance)
	if not ball then ballLockPaused = false; return end
	if dist < 2 then ballLockPaused = true; return end
	if dist > 6 then ballLockPaused = false end
	if ballLockPaused then return end
	local cam = workspace.CurrentCamera
	cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position, ball.Position), BallLock.Smoothness)
end)

-- Menu Toggle & Magnet Input
UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end

	if input.KeyCode == MenuToggleKey then
		if uiOpen then HideUI() else ShowUI() end
		return
	end

	if input.KeyCode == Enum.KeyCode.F and Magnet.Enabled then
		local char = Player.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		if not root then return end

		local ball, dist = GetClosestBall(root, Magnet.Distance)
		if not ball then return end

		local originalCFrame = root.CFrame
		local dir = (ball.Position - root.Position).Unit
		root.CFrame = CFrame.new(ball.Position - dir * 1, ball.Position)

		task.wait()

		root.CFrame = originalCFrame
		root.Velocity = Vector3.new(0, 0, 0)
		pcall(function() root.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end)
	end
end)

-- Rescan
task.spawn(function()
	while true do
		task.wait(3)
		ScanBalls()
	end
end)

-- ================================================================
--                        MOBILE TOGGLE BUTTON
-- ================================================================
if UserInputService.TouchEnabled then
	local MobToggle = Instance.new("TextButton")
	MobToggle.Name = "KesiciMobileToggle"
	MobToggle.Text = "K"
	MobToggle.Font = Enum.Font.GothamBold
	MobToggle.TextSize = 22
	MobToggle.TextColor3 = T.White
	MobToggle.BackgroundColor3 = T.Surface
	MobToggle.Size = UDim2.new(0, 45, 0, 45)
	MobToggle.Position = UDim2.new(0, 15, 0, 15)
	MobToggle.ZIndex = 50
	MobToggle.Parent = Gui
	Corner(MobToggle, 25)
	local MobStroke = Stroke(MobToggle, T.Accent, 2, 0)
	
	table.insert(ThemeElements.Backgrounds, MobToggle)
	table.insert(ThemeElements.Strokes, MobStroke)

	local togDragging = false
	local hasDragged = false
	local togDragStart, togStartPos
	
	MobToggle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
			togDragging = true
			hasDragged = false
			togDragStart = input.Position
			togStartPos = MobToggle.Position
		end
	end)
	
	MobToggle.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
			togDragging = false
			if not hasDragged then
				if uiOpen then HideUI() else ShowUI() end
			end
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if togDragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
			local d = input.Position - togDragStart
			if d.Magnitude > 5 then hasDragged = true end
			MobToggle.Position = UDim2.new(togStartPos.X.Scale, togStartPos.X.Offset + d.X, togStartPos.Y.Scale, togStartPos.Y.Offset + d.Y)
		end
	end)
end

-- ================================================================
--                        UI MENUS
-- ================================================================

local GKPage = MakeTab("GK Features", "🧤")

local ESPSec = MakeSection(GKPage, "⚽ Visuals")
ESPSec:AddToggle({
	Name = "Ball ESP",
	Description = "Shows ball location through walls.",
	Default = false,
	Callback = function(v)
		BallESP.Enabled = v
		if not v then ClearAllESP() end
		Notify({Title = "Ball ESP", Content = v and "ON" or "OFF", Duration = 2, Type = v and "Success" or "Info"})
	end
})

local BLSec = MakeSection(GKPage, "🎯 Aiming")
BLSec:AddToggle({
	Name = "Ball Lock",
	Description = "Automatically focuses camera on the ball.",
	Default = false,
	Callback = function(v)
		BallLock.Enabled = v
		ballLockPaused = false
		Notify({Title = "Ball Lock", Content = v and "ON" or "OFF", Duration = 2, Type = v and "Success" or "Info"})
	end
})

BLSec:AddSlider({
	Name = "Max Distance",
	Description = "Maximum distance for lock to work.",
	Min = 5,
	Max = 150,
	Default = 50,
	Suffix = " studs",
	Callback = function(v) BallLock.Distance = v end
})

BLSec:AddSlider({
	Name = "Smoothness",
	Description = "Adjusts camera rotation smoothness.",
	Min = 5,
	Max = 50,
	Default = 15,
	Suffix = "%",
	Callback = function(v) BallLock.Smoothness = v / 100 end
})

local MagSec = MakeSection(GKPage, "🧲 Movement")
MagSec:AddToggle({
	Name = "Magnet",
	Description = "Press F to instantly teleport to the ball and back.",
	Default = false,
	Callback = function(v)
		Magnet.Enabled = v
		Notify({Title = "Magnet", Content = v and "Press F" or "OFF", Duration = 2, Type = v and "Success" or "Info"})
	end
})

MagSec:AddSlider({
	Name = "Max Distance",
	Description = "Maximum teleport distance.",
	Min = 5,
	Max = 150,
	Default = 60,
	Suffix = " studs",
	Callback = function(v) Magnet.Distance = v end
})

local SettingsPage = MakeTab("Settings", "⚙️")

local ControlsSec = MakeSection(SettingsPage, "⌨️ Controls")
ControlsSec:AddKeybind({
	Name = "Menu Toggle Key",
	Description = "Bind a new key to open/close this UI.",
	Default = MenuToggleKey,
	Callback = function(key)
		MenuToggleKey = key
		Notify({Title = "Keybind Changed", Content = "Menu bound to " .. key.Name, Duration = 2, Type = "Info"})
	end
})

local ThemeSec = MakeSection(SettingsPage, "🎨 Appearance")
for key, theme in pairs(Themes) do
	ThemeSec:AddButton({
		Name = theme.Name .. " Theme",
		Description = "Apply the " .. theme.Name .. " visual style.",
		Callback = function()
			ApplyTheme(theme)
			Notify({Title = "Theme Changed", Content = "Applied " .. theme.Name .. " style.", Duration = 2, Type = "Info"})
		end
	})
end

local DangerSec = MakeSection(SettingsPage, "🛑 System")
DangerSec:AddButton({
	Name = "Terminate",
	Description = "Completely disables the script and removes the UI.",
	Callback = function()
		destroyed = true
		BallESP.Enabled = false
		BallLock.Enabled = false
		Magnet.Enabled = false
		pcall(function() ClearAllESP() end)
		if Gui then
			pcall(function() Gui:Destroy() end)
		end
	end
})

-- ================================================================
--                       MISC & INFO (NEW PREMIUM TAB)
-- ================================================================
local MiscPage = MakeTab("Misc & Info", "ℹ️")

local InfoSec = MakeSection(MiscPage, "📜 License & Script Data")

InfoSec:AddButton({
	Name = "Developer",
	Description = "deniz kesici | Official Kesici Hub Creator",
	Callback = function() end
})

InfoSec:AddButton({
	Name = "License Status",
	Description = "Lifetime Premium Acquired | Authenticated",
	Callback = function() end
})

InfoSec:AddButton({
	Name = "Security",
	Description = "Undetected | Custom Bypass Active",
	Callback = function() end
})

InfoSec:AddButton({
	Name = "Version",
	Description = "v3.0 - Professional Edition (PC & Mobile)",
	Callback = function() end
})

local DiscordSec = MakeSection(MiscPage, "💬 Discord")

DiscordSec:AddButton({
	Name = "Join Our Server",
	Description = "Click to copy invite link: discord.gg/ababtVNjTb",
	Callback = function()
		if safeCopy("https://discord.gg/ababtVNjTb") then
			Notify({Title = "Discord", Content = "Link copied to clipboard!", Duration = 3, Type = "Success"})
		else
			Notify({Title = "Error", Content = "Copy failed. Please manually copy the link in description!", Duration = 3, Type = "Error"})
		end
	end
})

-- Initialize Default Theme Visually
ApplyTheme(Themes.Ghost)

task.delay(1, function()
	Notify({Title = "Kesici Hub", Content = "UI Loaded! Tap Mobile Button or " .. MenuToggleKey.Name .. " to toggle.", Duration = 4, Type = "Info"})
end)
