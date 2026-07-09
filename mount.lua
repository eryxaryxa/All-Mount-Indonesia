local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/Framework.luau.txt"))() 
local HttpService = game:GetService("HttpService") 
local KEY_FILENAME = "EryxHubKey.txt" 

local function safeLoadVIPList(url)
    local ok, res = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if ok and type(res) == "table" then
        return res
    else
        return {}
    end
end
local VIPList = safeLoadVIPList("https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/viplistnew.lua")

_G.gVip = false
_G.kVip = false
_G.sVip = false

local function isActive(data)
    if not data then return false end
    if data.permanent then return true end
    if data.expiredAt then
        local y = tonumber(string.sub(data.expiredAt, 1, 4))
        local m = tonumber(string.sub(data.expiredAt, 6, 7))
        local d = tonumber(string.sub(data.expiredAt, 9, 10))
        local now = os.time()
        local exp = os.time({year = y, month = m, day = d, hour = 23, min = 59, sec = 59})
        return now <= exp
    end
    return false
end

do
    local data = VIPList[game.Players.LocalPlayer.UserId]
    if isActive(data) then
        _G.gVip = data.gvip == true
        _G.kVip = data.vip == true
        _G.sVip = data.svip == true
    end
end

local SpecialMounts = {
    ["Mount"] = true
}

local VipMounts = { 
    ["Atin (ServerHop)"] = true, 
    ["Mount Daun"] = true, 
    ["Mount Seravine"] = true, 
    ["Sibuatan (ServerHop)"] = true, 
    ["Lembayana"] = true, 
    ["Kawah Terjun (ServerHop)"] = true, 
    ["Fantasy"] = true, 
    ["Neraka Journey (Loop)"] = true,
    ["Mount Ravika"] = true,
    ["Mount Aneh"] = true,
    ["Mount Ckptw"] = true,
    ["Mount Paralel"] = true,
    ["Mount Swiss"] = true,
} 

local function getTierName()
    if _G.sVip then return "Super VVIP"
    elseif _G.kVip then return "VIP"
    elseif _G.gVip then return "Global VIP"
    else return "Free User" end
end

local function CreateMainWindow() 
    local Window = Library:Window({ 
        Title = "Eryx Hub x Serendipity (Vio)", 
        Desc = "Version 6.1", 
        Icon = 105059922903197, 
        Theme = "Dark", 
        Config = { 
            Keybind = Enum.KeyCode.LeftControl, 
            Size = UDim2.new(0, 500, 0, 400) 
        }, 
        CloseUIButton = { 
            Enabled = true, 
            Text = "Eryx x Vio Hub" 
        } 
    }) 
    
    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local VirtualUser = game:GetService("VirtualUser")
    local TeleportService = game:GetService("TeleportService")
    local TweenService = game:GetService("TweenService")
    local Lighting = game:GetService("Lighting")
    local LocalPlayer = Players.LocalPlayer
    local humanoid, rootPart

    local function setupCharacter(char)
        humanoid = char:WaitForChild("Humanoid")
        rootPart = char:WaitForChild("HumanoidRootPart")
    end
    if LocalPlayer.Character then setupCharacter(LocalPlayer.Character) end
    LocalPlayer.CharacterAdded:Connect(setupCharacter)

    Window:Notify({
        Title = "Eryx Hub",
        Desc = "Status: " .. getTierName() .. " — fitur menyesuaikan level akses.",
        Time = 5
    })
    
    local atinRoute = {CFrame.new(625.06, 1799.43, 3432.93),CFrame.new(749.46, 2189.88, 3927.45)} 
    local agungRoute = {CFrame.new(1400.49, 3435.22, -7859.17)} 
    local cukurukukRoute = {CFrame.new(-162.38, 489.14, 578.59), CFrame.new(-5.26, 877.01, -281.54)} 
    local hanamiRoute = {CFrame.new(510.82, 141.82, -111.89), CFrame.new(359.57, 195.92, -613.37), CFrame.new(-115.87, 169.82, -466.46), CFrame.new(-933.30, 345.63, -511.54), CFrame.new(-1278.80, 477.94, -329.37), CFrame.new(-1977.21, 609.77, 133.88), CFrame.new(-2765.56, 669.56, 43.87), CFrame.new(-2451.31, 850.79, -457.65), CFrame.new(-2393.55, 120.47, -1230.02), CFrame.new(-1876.65, 254.49, -2037.80), CFrame.new(-3589.37, 438.63, -2402.13), CFrame.new(-2652.29, 686.75, -2232.17), CFrame.new(-1992.56, 682.43, -2228.34), CFrame.new(-1860.82, 1048.52, -2719.13)} 
    local htsRoute = {CFrame.new(159.98, 325.22, 375.79), CFrame.new(402.30, 393.22, 281.85), CFrame.new(661.97, 516.72, 86.77), CFrame.new(453.18, 733.22, -139.85), CFrame.new(51.32, 857.22, -331.54), CFrame.new(-297.67, 857.22, -167.26), CFrame.new(-564.43, 1068.85, 236.07)} 
    local merapiRoute = {CFrame.new(-2063.33, 1868.96, -277.41)} 
    local lembayanaRoute = {CFrame.new(598.91, 266.93, 516.95), CFrame.new(-23428.99, 6353.21, -6907.18)} 
    local sibuatanRoute = {CFrame.new(5380.16, 8110.48, 2172.50)} 
    local sumbingRoute = {CFrame.new(-228.47, 441.22, 2141.94), CFrame.new(-429.00, 849.22, 3204.14), CFrame.new(43.36, 1269.22, 4042.72), CFrame.new(-1144.18, 1553.22, 4900.20), CFrame.new(-852.65, 1574.59, 4927.80), CFrame.new(-418.29, 1744.95, 5151.65), CFrame.new(-898.46, 1945.03, 5345.84)} 
    local hellExpeditionRoute = {CFrame.new(-147.03, 201.71, 261.50), CFrame.new(150.93, 250.12, 423.46), CFrame.new(509.71, 349.44, 293.23), CFrame.new(565.93, 410.18, -313.72), CFrame.new(-215.51, 545.25, -698.14), CFrame.new(-649.72, 537.69, -647.46), CFrame.new(-597.39, 449.32, -7.74), CFrame.new(-763.39, 429.44, 424.10), CFrame.new(-423.15, 433.30, 511.63), CFrame.new(306.40, 353.74, 680.72), CFrame.new(726.59, 614.09, 862.36), CFrame.new(1252.05, 822.21, 426.84), CFrame.new(1511.06, 1193.57, 111.92), CFrame.new(995.28, 1193.82, -10.20), CFrame.new(-1129.59, 1221.43, -64.34), CFrame.new(-1731.58, 1301.48, -52.89)}
    local fantasyRoute = {CFrame.new(-746.87, -48.41, -276.47), CFrame.new(-624.19, 47.28, 7.59), CFrame.new(-542.61, 47.14, -327.78), CFrame.new(-503.67, 163.11, -211.71), CFrame.new(-676.47, 270.91, 76.90), CFrame.new(-983.46, 266.20, -155.70), CFrame.new(-886.87, 285.75, 236.88), CFrame.new(-398.58, 285.99, 180.59), CFrame.new(-9.66, 262.05, -251.20), CFrame.new(-7.23, 262.11, 326.82), CFrame.new(291.97, 322.04, 465.52), CFrame.new(616.14, 301.30, 512.13), CFrame.new(1181.14, 746.48, 608.36), CFrame.new(1093.42, 866.41, 884.02), CFrame.new(415.37, 849.04, 1750.56), CFrame.new(-244.92, 1202.10, 1492.31), CFrame.new(-484.05, 1278.19, 1331.00), CFrame.new(-475.21, 1266.37, 998.33), CFrame.new(-828.71, 1163.37, 664.39), CFrame.new(-776.28, 1302.32, 906.14), CFrame.new(-1094.45, 1523.65, 1539.42)} 
    local mountJawaRoute = {CFrame.new(269.44, 314.34, -290.37), CFrame.new(153.19, 202.34, -900.20), CFrame.new(462.85, 294.58, -614.94), CFrame.new(-410.08, 22.39, 523.97), CFrame.new(-280.16, 585.63, -433.55)} 
    local yeudehRoute = {CFrame.new(2875.06, 1166.21, -2720.59), CFrame.new(3528.56, 634.21, -2713.99), CFrame.new(15411.11, 1778.16, -2263.71), CFrame.new(16258.12, 1910.16, -2308.35)} 
    local apasihRoute = {CFrame.new(-426.01, 99.05, -563.19), CFrame.new(-1044.70, 57.12, -600.35), CFrame.new(-1400.30, 200.39, -395.54), CFrame.new(-1544.92, 434.91, -310.87), CFrame.new(-2135.37, 691.28, 1049.06), CFrame.new(-1869.58, 733.22, 1278.92), CFrame.new(-1345.26, 803.94, 1147.06), CFrame.new(-1262.68, 902.99, 1188.86), CFrame.new(-2145.57, 999.86, 1621.48), CFrame.new(-2374.71, 1180.53, 1433.01), CFrame.new(-2571.97, 1184.07, 1737.25), CFrame.new(-2011.88, 1235.63, 1972.79), CFrame.new(-1695.80, 1424.13, 2389.00), CFrame.new(-2041.72, 1423.89, 2864.74), CFrame.new(-2758.71, 1553.21, 2882.65), CFrame.new(-3096.17, 1957.22, 3021.79)} 
    local phoenixRoute = {CFrame.new(-906.57, 997.22, 229.97)} 
    local taranjangRoute = {CFrame.new(8718.81, 1637.82, 1342.16)} 
    local nerakaJourneyRoute = {CFrame.new(529.47, 154.59, -48.18), CFrame.new(1241.36, 110.49, -0.17), CFrame.new(1273.04, 170.17, 406.89), CFrame.new(842.03, 157.09, 757.58), CFrame.new(851.46, 157.11, 1620.01), CFrame.new(1349.84, 212.96, 1464.73), CFrame.new(1601.93, 177.17, 1453.21), CFrame.new(1576.26, 161.28, 1290.81), CFrame.new(1354.48, 201.22, 1094.15), CFrame.new(1539.27, 170.17, 355.53), CFrame.new(1582.12, 207.89, -99.68), CFrame.new(1838.88, 207.73, -36.60), CFrame.new(2022.46, 207.48, 64.04), CFrame.new(2646.97, 209.55, 153.76), CFrame.new(3439.90, 212.08, 428.56), CFrame.new(4322.81, 210.84, -803.39), CFrame.new(4470.96, 214.18, -1292.91), CFrame.new(4190.60, 181.60, -2389.22), CFrame.new(4432.82, 256.39, -2377.77), CFrame.new(4876.73, 257.66, -2221.01), CFrame.new(5111.71, 258.03, -2433.01), CFrame.new(5636.39, 257.58, -2511.40), CFrame.new(5600.04, 334.64, -2380.90), CFrame.new(5673.18, 343.64, -2433.21), CFrame.new(5861.53, 372.85, -2396.55), CFrame.new(6749.98, 505.12, -2335.01)} 
    local sakahayangRoute = {CFrame.new(-917.77, 3144.39, 560.21), CFrame.new(-920.17, 3144.22, 540.86)} 
    local kawahTerjunRoute = {CFrame.new(79.45, -234.77, 215.17)} 
    local bayiiRoute = {CFrame.new(-366.14, 63.22, 45.45), CFrame.new(-727.98, 115.22, 98.84), CFrame.new(-851.05, 108.74, -36.75), CFrame.new(-969.45, 272.25, -50.11), CFrame.new(-1409.57, 251.22, 1501.32), CFrame.new(-1407.82, 400.07, 1629.71)} 
    local papuaRoute = {CFrame.new(6058.07, 2243.68, -867.86)} 
    local sereliaRoute = {CFrame.new(-667.87, 17.72, 1482.81),CFrame.new(-1042.44, 53.72, 1339.83),CFrame.new(-1254.29, 17.72, 1244.25),CFrame.new(-1213.31, 142.21, 809.50),CFrame.new(-1183.59, 145.72, 699.19),CFrame.new(-658.84, 127.70, 571.82),CFrame.new(-538.77, 179.72, 740.60),CFrame.new(-297.72, 185.68, 899.78),CFrame.new(104.31, 5.89, 1156.93),CFrame.new(801.55, 5.63, 286.10),CFrame.new(35.90, 221.48, 37.33),CFrame.new(-335.27, 221.82, 20.29),CFrame.new(-969.45, 201.68, -264.09),CFrame.new(-963.64, 179.72, -550.40),CFrame.new(-882.47, 177.75, -816.95),CFrame.new(-638.56, 133.72, -612.37),CFrame.new(-267.11, 337.72, -810.38),CFrame.new(-13.12, 557.72, -751.26),CFrame.new(-9.29, 557.72, -762.70)} 
    local nirwanaHDRoute = {CFrame.new(83.97, 141.14, 463.31),CFrame.new(-401.08, 273.14, 770.58),CFrame.new(-589.83, 385.14, -117.98),CFrame.new(-487.40, 281.57, -355.53),CFrame.new(-1292.45, 353.14, -537.24),CFrame.new(-1797.36, 597.13, -436.45),CFrame.new(-3347.88, 685.14, -728.61),CFrame.new(-3377.76, 696.42, -759.10)} 
    local pedaunanRoute = {CFrame.new(-63.2615204, 56.9350357, -1011.1731), CFrame.new(-516.915649, 28.7689381, -1449.71558), CFrame.new(-1097.98547, 96.9340897, -1666.29993), CFrame.new(-1381.83362, 87.8062973, -2035.84106), CFrame.new(-1957.88403, 16.9350357, -2010.46265), CFrame.new(-2316.1228, 176.873459, -2407.83398), CFrame.new(-2692.46899, 232.194839, -2890.85181), CFrame.new(-2999.2915, 368.934998, -3347.85938), CFrame.new(-3702.11523, 660.193848, -4241.8457), CFrame.new(-3903.97827, 821.694824, -5034.37207), CFrame.new(-3728.97144, 943.074463, -5452.24609), CFrame.new(-3142.6394, 1276.88782, -6434.39502), CFrame.new(-2535.55591, 1575.45032, -6520.31982), CFrame.new(-2289.60449, 1745.02332, -7902.92383), CFrame.new(-2365.04199, 2056.93481, -9752.54883), CFrame.new(-2437.15527, 2132.93481, -10293.708)}
    local mikaRoute = {CFrame.new(517.60, 195.80, -553.09), CFrame.new(646.00, 179.80, -635.88), CFrame.new(1107.46, 219.80, -359.90), CFrame.new(1180.82, 223.80, -569.31), CFrame.new(1328.61, 257.16, -597.94), CFrame.new(1499.28, 384.20, -625.94), CFrame.new(1512.28, 455.90, -112.18), CFrame.new(1229.82, 432.00, -114.86), CFrame.new(1118.67, 448.00, 30.41), CFrame.new(677.22, 600.00, -250.65), CFrame.new(953.91, 656.03, -58.78), CFrame.new(985.07, 679.71, -236.54), CFrame.new(1051.84, 680.00, -22.84), CFrame.new(471.43, 652.00, 642.71), CFrame.new(431.43, 821.73, 1196.90), CFrame.new(483.54, 924.75, 1836.35), CFrame.new(475.38, 965.84, 2171.92), CFrame.new(473.61087, 963.066711, 2081.17578), CFrame.new(476.484558, 964.11438, 2088.80591), CFrame.new(472.962158, 963.066711, 2075.53394), CFrame.new(499.97699, 133.024826, -55.0250015)} 

    local AutoWalkTab = Window:Tab({Title = "Auto Walk", Icon = "star"}) 
    local WalkDanceTab = Window:Tab({Title = "Walk Dance", Icon = "star"}) 
    local AutoSummitTab = Window:Tab({Title = "Auto Summit", Icon = "star"})
    local MainTab = Window:Tab({Title = "Player", Icon = "user"}) 
    local VisualTab = Window:Tab({Title = "Visual", Icon = "sun"}) 
    local ProteksiTab = Window:Tab({Title = "Proteksi", Icon = "shield"}) 
    local TrollTab = Window:Tab({Title = "Troll", Icon = "bug"})
    local MiscTab = Window:Tab({Title = "Misc", Icon = "settings"}) 
    local SocialTab = Window:Tab({Title = "Social", Icon = "link"}) 
    
    local isAutoFarmActive = false 
    local currentFarmName = "" 
    local respawned = false 
    local isAutoHealToggledOn = false 
    local autoHealConnection = nil 

    local function notify(title, desc, time) 
        Window:Notify({Title = title or "Info", Desc = desc or "", Time = time or 3}) 
    end 
    
    local function activateAutoHeal() 
        if isAutoHealToggledOn and not autoHealConnection then 
            autoHealConnection = RunService.Heartbeat:Connect(function() 
                if humanoid and humanoid.Health < humanoid.MaxHealth then 
                    humanoid.Health = humanoid.MaxHealth 
                end 
            end) 
        end 
    end 

    local function deactivateAutoHeal() 
        if autoHealConnection then 
            autoHealConnection:Disconnect(); autoHealConnection = nil 
        end 
    end 
    
    local function genericServerHop(farmName) 
        notify(farmName or "Info", "Pindah ke server baru...", 3) 
        task.wait(1) 
        TeleportService:Teleport(game.PlaceId, LocalPlayer) 
    end 

    local function stopAutoFarmLoop() 
        if isAutoFarmActive then 
            isAutoFarmActive = false 
            deactivateAutoHeal() 
            if humanoid and rootPart then 
                humanoid:MoveTo(rootPart.Position) 
            end 
            notify(currentFarmName, "Proses dihentikan.", 2) 
        end 
    end 
    
    local function startAutoFarmLoop(route, delay, farmName, endAction, postLoopDelay) 
        isAutoFarmActive = true 
        currentFarmName = farmName 
        task.spawn(function() 
            activateAutoHeal() 
            local idx = 1 
            while isAutoFarmActive do 
                if respawned then 
                    respawned = false 
                    idx = 1 
                    notify(farmName, "Respawn terdeteksi. Mulai ulang dari CP1.", 3) 
                end 
                local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait() 
                local hrp = char:WaitForChild("HumanoidRootPart") 
                if idx < 1 or idx > #route then idx = 1 end 
                local destination = route[idx] 
                notify(farmName, "Bergerak ke Checkpoint " .. tostring(idx), delay) 
                hrp.CFrame = destination 
                local t0 = time() 
                while isAutoFarmActive and not respawned and (time() - t0) < (tonumber(delay) or 0) do 
                    task.wait(0.1) 
                end 
                if not isAutoFarmActive then break end 
                if not respawned then idx += 1 end 
                if idx > #route then 
                    if endAction == "loop" then 
                        notify(farmName, "Rute selesai, mengulang...", 3) 
                        if (postLoopDelay or 0) > 0 then 
                            local t1 = time() 
                            while isAutoFarmActive and not respawned and (time() - t1) < postLoopDelay do task.wait(0.1) end 
                        end 
                        idx = 1 
                    elseif endAction == "kill" then 
                        if (postLoopDelay or 0) > 0 then 
                            local t1 = time() 
                            while isAutoFarmActive and not respawned and (time() - t1) < postLoopDelay do task.wait(0.1) end 
                        end 
                        local hum = char:FindFirstChildOfClass("Humanoid") 
                        if hum then hum.Health = 0 end 
                        task.wait(0.5) 
                    elseif endAction == "serverhop" then 
                        genericServerHop(farmName) 
                        isAutoFarmActive = false 
                        break 
                    else 
                        isAutoFarmActive = false 
                        notify(farmName, "Rute selesai.", 3) 
                        break 
                    end 
                end 
            end 
            deactivateAutoHeal() 
        end) 
    end 
    
    local LuauMounts = {
        ["Mount Daun"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/datasekolah.luau" },
        ["Mount Seravine"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/bindo.luau" },
        ["Mount Eline"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy4.luau" },
        ["Mount Kayu"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy.luau" },
        ["Mount Ravika"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy2.luau" },
        ["Mount Aneh"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy3.luau" },
        ["Mount Yareu"]  = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy6.luau" },
        ["Mount Forever"]= { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy5.luau" },
        ["Mount Funtake"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy9.luau" },
        ["Mount Kelinci"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy10.luau" },
        ["Mount Ckptw"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy11.luau" },
        ["Mount Pengangguran"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy15.luau" },
        ["Mount Pargoy"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy16.luau" },
        ["Mount Age"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy17.luau" },
        ["Mount Funny"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy22.luau" },
        ["Mount Swiss"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy24.luau" },
        ["Mount Tuing"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy25.luau" },
        ["Mount Ducky"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy26.luau" },
        ["Mount Lamore"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy27.luau" },
        ["Mount Aneh Hard"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy31.luau" },
        ["Mount Hana"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy32.luau" },
        ["Mount Atin"] = { URL = "https://raw.githubusercontent.com/eryxaryxa/All-Mount-Indonesia/refs/heads/main/sekolah/datadummy33.luau" }
    }

    local selectedLuauMount = nil 
    local isLuauMountActive = false 
    local isWaitingRespawnLoop = false 
    local luauMountConn = nil 
    local mountLuauSpeed = 1.0 

    local mountDanceList = {
        ["Mount Aneh"] = {101721688008552,135055410162594,102694273429920,99558490932154,138694026614242,104428851742579,15517864808,89973918892326,139110277540140,118264035209903,112089880074848,80933111363555,129100070542534,103360497719320,76278246500974,134364277920166,138243322520289,15609995579,93413174711404,99195149999804,130445733737505,127626736897320,81809682819287,82834247814955,94569503223288,124287251935400,4265725525,118888791304849,133418516499878,5230599789,4940563117,3333136415,3361426436,4212455378,3333331310,3337994105,4841405708,5104344710,3333499508},
        ["Mount Daun"] = {119672866819985,75794487911158,75464565078100,99415434578048,86830779464352,122728269968829,119900472908213,103149495679203,104955265542960,111780916668709,112866211827698,113803590902938,70475750258869,72841846874181,90217160853799,139603305296380,99613960336535,77481371339589,106026286738809,136019311264494,130281142874305,81056096962804,133923558674979,75955979890882,124354496839741,87825923486181,129859200556838,109533823633058,78117154887384,92771884234499,73877945637550,77084304706822,92465468475517,74308727444954,109062690676394,140143205245192,137494191749329,95670783294990,75350449790452,131191072720446,102026706214255,85462658062041,99080304767124,76111723202578,73897716849797,129215957918937,137315943096155,81524999787406,100327229621582,118291558579174,100252309698505,117995130363036,78164358699580,134627074975931,138945223816368,130867224828468,111102582217645,86952163083206,81900385680347,75119737565344,116546145250982,138582612601463,116678752763849,107722235499842,121647190511548,123497977344153,103292934122655,72301209470581,108417248987988,107903204563324,73749203049096,111104681435503,110984562778859,135831287987290,140278854166239,118263663123910,82370614810501,73637888097402,135588547397689,129295862109595,80812419860352,91958007815766,125644324966382,111539711191734,88410083769466,121914082934909},
    }
    
    local function isR15(character)
        return character and character:FindFirstChildOfClass("Humanoid") and character.Humanoid.RigType == Enum.HumanoidRigType.R15
    end

    local universalDances = {
        R6 = {27789359, 30196114, 248263260, 45834924, 33796059, 28488254, 52155728},
        R15 = {3333432454, 4555808220, 4049037604, 4555782893, 10214311282, 10714010337, 10713981723, 10714372526, 10714076981, 10714392151, 11444443576}
    }
    local activeDanceTrack = nil

    local function stopDance()
        if activeDanceTrack then
            activeDanceTrack:Stop()
            activeDanceTrack = nil
        end
    end

    local function playRandomDance(danceList)
        stopDance()
        if not danceList or #danceList == 0 then return end
        
        local char = LocalPlayer.Character
        if not char then return end
        
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        
        local animator = hum:FindFirstChildOfClass("Animator") or Instance.new("Animator", hum)
        local animId = danceList[math.random(1, #danceList)]
        local anim = Instance.new("Animation", animator)
        anim.AnimationId = "rbxassetid://"..animId
        
        local track = animator:LoadAnimation(anim)
        track.Looped = true
        track:Play()
        activeDanceTrack = track
        task.delay(0, function() anim:Destroy() end)
    end

    local function stopLuauMountWalk() 
        if not isLuauMountActive then return end 
        isLuauMountActive = false 
        stopDance() 
        if luauMountConn then luauMountConn:Disconnect(); luauMountConn = nil end 
        if humanoid then humanoid.AutoRotate = true end 
        notify("All Mount", "Auto Walk dihentikan.", 3) 
    end 
    
    local function startLuauMountWalk() 
        if isLuauMountActive or not selectedLuauMount or not LuauMounts[selectedLuauMount] then 
            notify("All Mount", "Pilih mount terlebih dahulu!", 3) 
            return 
        end 
        if SpecialMounts[selectedLuauMount] and not (_G.gVip or _G.sVip) then 
            notify("Access Denied", "Gunung ini khusus Global VIP / Super VIP!", 4) 
            return 
        end 
        if VipMounts[selectedLuauMount] and not (_G.kVip or _G.sVip) then 
            notify("Access Denied", "Mount ini khusus VIP!", 4) 
            return 
        end 
        isLuauMountActive = true 

        if mountDanceList[selectedLuauMount] then
            playRandomDance(mountDanceList[selectedLuauMount])
        else
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            if isR15(char) then
                playRandomDance(universalDances.R15)
            else
                playRandomDance(universalDances.R6)
            end
        end

        local url = LuauMounts[selectedLuauMount].URL 
        task.spawn(function() 
            local ok, obj = pcall(function() 
                local src = game:HttpGet(url) 
                return loadstring(src)() 
            end) 
            if not ok or type(obj) ~= "table" or type(obj.samples) ~= "table" then 
                notify(selectedLuauMount, "Gagal memuat data.", 5); isLuauMountActive = false; return 
            end 
            local hz = tonumber(obj.hz) or 20 
            local list = {} 
            for i, s in ipairs(obj.samples) do 
                table.insert(list, {t = tonumber(s.t) or (i - 1) / hz, pos = Vector3.new(s.x or 0, s.y or 0, s.z or 0), yaw = tonumber(s.yaw) or 0}) 
            end 
            table.sort(list, function(a,b) return a.t < b.t end) 
            if #list < 2 then 
                notify(selectedLuauMount, "Data terlalu pendek.", 4); isLuauMountActive = false; return 
            end 
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait() 
            local hrp = char:WaitForChild("HumanoidRootPart") 
            humanoid = char:WaitForChild("Humanoid") 
            humanoid.AutoRotate = false 
            local idx = 1 
            local function lerpAngle(a,b,alpha) local d=(b-a+math.pi)%(2*math.pi)-math.pi; return a+d*alpha end 
            local function sampleAt(t)
                local n=#list
                if t<=list[1].t then return list[1].pos,list[1].yaw end
                if t>=list[n].t then return list[n].pos,list[n].yaw end
                while idx<n and list[idx+1].t<t do idx=idx+1 end
                local a,b=list[idx],list[idx+1]
                local alpha=(b.t-a.t>1e-6) and ((t-a.t)/(b.t-a.t)) or 0
                return a.pos:Lerp(b.pos,alpha),lerpAngle(a.yaw,b.yaw,alpha)
            end 
            local t0=time(); local lastT=list[#list].t
            luauMountConn=RunService.RenderStepped:Connect(function()
                if not isLuauMountActive then return end
                if not hrp or not hrp.Parent then
                    if isWaitingRespawnLoop then return end
                    notify(selectedLuauMount,"Character hilang. Stop.",3); isLuauMountActive=false; return
                end
                local elapsed=(time()-t0)*mountLuauSpeed; local pos,yaw=sampleAt(elapsed)
                if not pos then return end
                hrp.CFrame=CFrame.new(pos)*CFrame.Angles(0,yaw,0)
                if elapsed>=lastT then
                    notify(selectedLuauMount,"Playback selesai. Bunuh untuk loop ulang...",3)
                    humanoid.AutoRotate=true; isLuauMountActive=false
                    if luauMountConn then luauMountConn:Disconnect();luauMountConn=nil end
                    isWaitingRespawnLoop=true
                    task.delay(0.5,function()
                        local charNow=LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                        local humNow=charNow:FindFirstChildOfClass("Humanoid")
                        if humNow then
                            humNow.Health=0
                            task.delay(3,function()
                                local newChar=LocalPlayer.CharacterAdded:Wait()
                                if newChar and newChar:WaitForChild("HumanoidRootPart",5) and newChar:WaitForChild("Humanoid",5) then
                                    isWaitingRespawnLoop=false
                                    notify("All Mount","Auto Walk dimulai ulang...",3)
                                    startLuauMountWalk()
                                else
                                    notify("All Mount","Gagal loop: HRP/Humanoid tidak ditemukan.",4)
                                end
                            end)
                        end
                    end)
                end
            end)
            notify("All Mount","Auto Walk "..selectedLuauMount.." dimulai...",4)
        end)
    end
    
    WalkDanceTab:Dropdown({
        Title = "Pilih Gunung Walk Dance",
        List = (function()
            local list = {}
            for name, _ in pairs(LuauMounts) do
                if SpecialMounts[name] then
                    if _G.gVip or _G.sVip then table.insert(list, name) end
                elseif VipMounts[name] then
                    if _G.kVip or _G.sVip then table.insert(list, name) end
                else
                    table.insert(list, name)
                end
            end
            table.sort(list); return list
        end)(),
        Callback = function(choice) selectedLuauMount = choice end
    })

    WalkDanceTab:Slider({
        Title = "Speed (x0.1)", Min = 2, Max = 50, Value = 10,
        Callback = function(v) mountLuauSpeed = math.clamp((tonumber(v) or 10)/10, 0.1, 5.0) end
    })

    WalkDanceTab:Toggle({
        Title = "Mulai Walk Dance", Value = false,
        Callback = function(v)
            if v then stopAutoFarmLoop(); startLuauMountWalk()
            else stopLuauMountWalk() end
        end
    })
   
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local _clock = os.clock

local function safeNotify(title, desc, t)
    if typeof(notify) == "function" then
        notify(title, desc, t)
    else
        print(("[Notify] %s | %s"):format(tostring(title), tostring(desc)))
    end
end

local function getUserTier()
    if _G.sVip == true then return "svip" end
    if _G.gVip == true then return "gvip" end
    if _G.kVip == true then return "vip" end

    if _G.SVIP or _G.isSVIP or _G.VIP_TIER == "svip" then return "svip" end
    if _G.GVIP or _G.isGVIP or _G.VIP_TIER == "gvip" then return "gvip" end
    if _G.KVIP or _G.isKVIP or _G.VIP_TIER == "vip" then return "vip" end
    if _G.SPECIAL or _G.isSPECIAL or _G.VIP_TIER == "special" then return "special" end
    return "free"
end

local tierRank = { free=1, kvip=2, gvip=3, svip=4, special=5 }
local function tierLEQ(a,b) return (tierRank[a or "free"] or 1) <= (tierRank[b or "free"] or 1) end

local function canAccess(userTier, pathTier)
    if pathTier == "free" then return true end
    if userTier == "svip" then return true end
    if userTier == "gvip" then return pathTier == "gvip" end
    if userTier == "vip" then return pathTier == "vip" end
    return false
end

local ENFORCE_SPECIAL_ONLY = true

local UniversalRemotePaths = {

    ["Koharu"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy9.txt",
        TIER = "free",
        CATEGORY = "Free",
    },

    ["Freestyle"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy10.txt",
        TIER = "free",
        CATEGORY = "Free",
    },

    ["Feels"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy11.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Idungkuy"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy18.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Anj"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy19.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Setecu"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy20.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Wasabi"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy21.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Ragon"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy25.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["YNTKTS"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy26.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Malaikat"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy27.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Mika"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy28.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Paralel"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy29.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Prambanan"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy30.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Anora"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy31.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Age"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy32.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Kayu"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy34.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Forever"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy35.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Pargoy"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy36.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Pengangguran"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy37.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Yareu"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy39.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Varsha"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy41.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Jirlah"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy42.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Ducky"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy44.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Funny"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy45.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Lamore"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy46.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Tuing"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy47.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Tali"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy48.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Cinlok"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy50.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Sangkala"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy51.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Seru"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy52.txt",
        TIER = "free",
        CATEGORY = "Free",
    },
    
    ["Newbie"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy54.txt",
        TIER = "free",
        CATEGORY = "Free",
    },

    ["Yahayuk"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy1.txt",
        TIER = "gvip",
        CATEGORY = "VIP",
    },
    
    ["Aneh Mode Pro"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy2.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },

    ["Daun Pro"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy3%20(2).txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },

    ["Kota Bukan Gunung"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy4.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },

    ["Bisu"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy5.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },

    ["Ekspedisi Kota"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy6.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },

    ["Parkour In The City"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy7.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },

    ["Runia"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy8.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Kawah Terjun Hard"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy12.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Bayii"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy13.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Serenity"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy14.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Serendipity"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy15.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Mulu"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy16.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Kawaii"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy17.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Arunika"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy22.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Imut"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy23.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Mono"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy24.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Ckptw"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy33.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Swiss"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy38.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Bagen Dah"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy40.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Velora"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy43.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Gemi"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy49.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
    
    ["Molti"] = {
        URL  = "https://raw.githubusercontent.com/eryxaryxa/EryxDump/refs/heads/main/dumpv/datadummy53.txt",
        TIER = "vip",
        CATEGORY = "VIP",
    },
}

local selectedUniversalRemote = nil
local isUniversalRunning = false
local universalMode = "loop"
local useAdidasAnim = false
local useCarryAnimAutoWalk = false
local universalSpeedScale = 1.0
local universalYOffset = 0.0

local R6_Anims = {
    idle  = "rbxassetid://507766666",
    walk  = "rbxassetid://507777826",
    run   = "rbxassetid://507767714",
    jump  = "rbxassetid://507765000",
    fall  = "rbxassetid://507767968",
    climb = "rbxassetid://507765644",
    swim  = "rbxassetid://507784897",
}
local AdidasAnims = {
    idle1    = "rbxassetid://122257458498464",
    idle2    = "rbxassetid://102357151005774",
    walk     = "rbxassetid://122150855457006",
    run      = "rbxassetid://82598234841035",
    jump     = "rbxassetid://75290611992385",
    fall     = "rbxassetid://98600215928904",
    swim     = "rbxassetid://133308483266208",
    swimidle = "rbxassetid://109346520324160",
    climb    = "rbxassetid://88763136693023",
}
local R15_Fallback = {
    idle1 = "rbxassetid://507766388",
    idle2 = "rbxassetid://507766666",
    walk  = "rbxassetid://913402848",
    run   = "rbxassetid://913376220",
    jump  = "rbxassetid://507765557",
    fall  = "rbxassetid://507767968",
    swim  = "rbxassetid://913384386",
    climb = "rbxassetid://913384386",
}

local CarryAnims = {
    R15 = "rbxassetid://109627380682093",
    R6  = "rbxassetid://114126406096582",
}

local SavedAnim = { rigType=nil, idle1=nil, idle2=nil, walk=nil, run=nil, jump=nil, fall=nil, climb=nil, swim=nil, swimidle=nil }

local function getAnimate(char)
    if not char then return nil end
    return char:FindFirstChild("Animate")
end

local function stopAllTracks(hum)
    if not hum then return end
    for _,tr in ipairs(hum:GetPlayingAnimationTracks()) do
        tr:Stop(0)
    end
end

local function toggleAnimateScript(char)
    local animate = getAnimate(char); if not animate then return end
    local wasEnabled = not animate.Disabled
    animate.Disabled = true
    task.wait()
    animate.Disabled = not wasEnabled and false or false
end

local function saveCurrentAnimate(char, hum)
    local animate = getAnimate(char); if not animate or not hum then return end
    if hum.RigType == Enum.HumanoidRigType.R6 then
        SavedAnim.rigType = "R6"
        SavedAnim.idle1 = (animate:FindFirstChild("idle") and animate.idle:FindFirstChildWhichIsA("Animation") and animate.idle:FindFirstChildWhichIsA("Animation").AnimationId)
        SavedAnim.walk  = (animate:FindFirstChild("walk") and animate.walk:FindFirstChildWhichIsA("Animation") and animate.walk:FindFirstChildWhichIsA("Animation").AnimationId)
        SavedAnim.run   = (animate:FindFirstChild("run")  and animate.run:FindFirstChildWhichIsA("Animation")  and animate.run:FindFirstChildWhichIsA("Animation").AnimationId)
        SavedAnim.jump  = (animate:FindFirstChild("jump") and animate.jump:FindFirstChildWhichIsA("Animation") and animate.jump:FindFirstChildWhichIsA("Animation").AnimationId)
        SavedAnim.fall  = (animate:FindFirstChild("fall") and animate.fall:FindFirstChildWhichIsA("Animation") and animate.fall:FindFirstChildWhichIsA("Animation").AnimationId)
        SavedAnim.climb = (animate:FindFirstChild("climb")and animate.climb:FindFirstChildWhichIsA("Animation")and animate.climb:FindFirstChildWhichIsA("Animation").AnimationId)
        SavedAnim.swim  = (animate:FindFirstChild("swim") and animate.swim:FindFirstChildWhichIsA("Animation") and animate.swim:FindFirstChildWhichIsA("Animation").AnimationId)
    else
        SavedAnim.rigType = "R15"
        local function getFirstAnimId(section)
            return section and section:FindFirstChildWhichIsA("Animation") and section:FindFirstChildWhichIsA("Animation").AnimationId or nil
        end
        SavedAnim.idle1 = (animate:FindFirstChild("idle") and getFirstAnimId(animate.idle)) or nil
        SavedAnim.idle2 = SavedAnim.idle1
        SavedAnim.walk  = (animate:FindFirstChild("walk") and getFirstAnimId(animate.walk)) or nil
        SavedAnim.run   = (animate:FindFirstChild("run")  and getFirstAnimId(animate.run))  or nil
        SavedAnim.jump  = (animate:FindFirstChild("jump") and getFirstAnimId(animate.jump)) or nil
        SavedAnim.fall  = (animate:FindFirstChild("fall") and getFirstAnimId(animate.fall)) or nil
        SavedAnim.climb = (animate:FindFirstChild("climb")and getFirstAnimId(animate.climb))or nil
        SavedAnim.swim  = (animate:FindFirstChild("swim") and getFirstAnimId(animate.swim)) or nil
        SavedAnim.swimidle = SavedAnim.swim
    end
end

local function applyDefaultAnim(char, hum)
    local animate = getAnimate(char); if not animate or not hum then return end
    local rigR6 = (hum.RigType == Enum.HumanoidRigType.R6)
    if rigR6 then
        local src = {
            idle  = SavedAnim.idle1 or R6_Anims.idle,
            walk  = SavedAnim.walk or R6_Anims.walk,
            run   = SavedAnim.run or R6_Anims.run,
            jump  = SavedAnim.jump or R6_Anims.jump,
            fall  = SavedAnim.fall or R6_Anims.fall,
            climb = SavedAnim.climb or R6_Anims.climb,
            swim  = SavedAnim.swim or R6_Anims.swim
        }
        if animate:FindFirstChild("idle") and animate.idle:FindFirstChildWhichIsA("Animation") and src.idle then
            animate.idle:FindFirstChildWhichIsA("Animation").AnimationId = src.idle
        end
        if animate:FindFirstChild("walk") and animate.walk:FindFirstChildWhichIsA("Animation") and src.walk then
            animate.walk:FindFirstChildWhichIsA("Animation").AnimationId = src.walk
        end
        if animate:FindFirstChild("run")  and animate.run:FindFirstChildWhichIsA("Animation")  and src.run  then
            animate.run:FindFirstChildWhichIsA("Animation").AnimationId  = src.run
        end
        if animate:FindFirstChild("jump") and animate.jump:FindFirstChildWhichIsA("Animation") and src.jump then
            animate.jump:FindFirstChildWhichIsA("Animation").AnimationId = src.jump
        end
        if animate:FindFirstChild("fall") and animate.fall:FindFirstChildWhichIsA("Animation") and src.fall then
            animate.fall:FindFirstChildWhichIsA("Animation").AnimationId = src.fall
        end
        if animate:FindFirstChild("climb")and animate.climb:FindFirstChildWhichIsA("Animation")and src.climb then
            animate.climb:FindFirstChildWhichIsA("Animation").AnimationId= src.climb
        end
        if animate:FindFirstChild("swim") and animate.swim:FindFirstChildWhichIsA("Animation") and src.swim then
            animate.swim:FindFirstChildWhichIsA("Animation").AnimationId = src.swim
        end
    else
        local function setAnim(sectionName, id)
            local sec = animate:FindFirstChild(sectionName); if not sec then return end
            local a = sec:FindFirstChildWhichIsA("Animation")
            if not a then
                a = Instance.new("Animation")
                a.Name = sectionName.."Anim"
                a.Parent = sec
            end
            a.AnimationId = id
        end
        setAnim("idle", (SavedAnim.idle1 or R15_Fallback.idle1))
        setAnim("walk", (SavedAnim.walk  or R15_Fallback.walk))
        setAnim("run",  (SavedAnim.run   or R15_Fallback.run))
        setAnim("jump", (SavedAnim.jump  or R15_Fallback.jump))
        setAnim("fall", (SavedAnim.fall  or R15_Fallback.fall))
        setAnim("climb",(SavedAnim.climb or R15_Fallback.climb))
        setAnim("swim", (SavedAnim.swim  or R15_Fallback.swim))
    end
    stopAllTracks(hum); toggleAnimateScript(char)
end

local function forceAdidas(char, hum)
    local animate = getAnimate(char); if not animate or not hum then return end
    if animate:FindFirstChild("idle") then
        if animate.idle:FindFirstChild("Animation1") then animate.idle.Animation1.AnimationId = AdidasAnims.idle1 end
        if animate.idle:FindFirstChild("Animation2") then animate.idle.Animation2.AnimationId = AdidasAnims.idle2 end
        local any = animate.idle:FindFirstChildWhichIsA("Animation")
        if any and (not animate.idle:FindFirstChild("Animation1")) and (not animate.idle:FindFirstChild("Animation2")) then
            any.AnimationId = AdidasAnims.idle1
        end
    end
    if animate:FindFirstChild("walk") then
        local w = animate.walk:FindFirstChild("WalkAnim") or animate.walk:FindFirstChildWhichIsA("Animation")
        if w then w.AnimationId = AdidasAnims.walk end
    end
    if animate:FindFirstChild("run")  then
        local r = animate.run:FindFirstChild("RunAnim")  or animate.run:FindFirstChildWhichIsA("Animation")
        if r then r.AnimationId = AdidasAnims.run end
    end
    if animate:FindFirstChild("jump") then
        local j = animate.jump:FindFirstChild("JumpAnim") or animate.jump:FindFirstChildWhichIsA("Animation")
        if j then j.AnimationId = AdidasAnims.jump end
    end
    if animate:FindFirstChild("fall") then
        local f = animate.fall:FindFirstChild("FallAnim") or animate.fall:FindFirstChildWhichIsA("Animation")
        if f then f.AnimationId = AdidasAnims.fall end
    end
    if animate:FindFirstChild("climb")then
        local c = animate.climb:FindFirstChild("ClimbAnim")or animate.climb:FindFirstChildWhichIsA("Animation")
        if c then c.AnimationId = AdidasAnims.climb end
    end
    if animate:FindFirstChild("swim") then
        local s = animate.swim:FindFirstChild("Swim") or animate.swim:FindFirstChildWhichIsA("Animation")
        if s then s.AnimationId = AdidasAnims.swim end
    end
    if animate:FindFirstChild("swimidle") then
        local si = animate.swimidle:FindFirstChild("SwimIdle") or animate.swimidle:FindFirstChildWhichIsA("Animation")
        if si then si.AnimationId = AdidasAnims.swimidle end
    end
    stopAllTracks(hum); toggleAnimateScript(char)
end

local carryAnimAutoWalkTrack = nil
local carryAnimAutoWalkHum = nil

local function stopCarryAnimAutoWalk()
    if carryAnimAutoWalkTrack then
        pcall(function()
            carryAnimAutoWalkTrack:Stop(0.2)
        end)
        carryAnimAutoWalkTrack = nil
        carryAnimAutoWalkHum = nil
    end
end

local function playCarryAnimAutoWalk()
    if not useCarryAnimAutoWalk then return end
    local char = LocalPlayer.Character
    if not char then return end
    local hum  = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end

    if carryAnimAutoWalkHum == hum and carryAnimAutoWalkTrack and carryAnimAutoWalkTrack.IsPlaying then
        return
    end

    stopCarryAnimAutoWalk()

    local rigIsR15 = (hum.RigType == Enum.HumanoidRigType.R15)
    local animId = rigIsR15 and CarryAnims.R15 or CarryAnims.R6
    if not animId or animId == "" then return end

    local animator = hum:FindFirstChildOfClass("Animator")
    if not animator then
        animator = Instance.new("Animator")
        animator.Parent = hum
    end

    local anim = Instance.new("Animation")
    anim.AnimationId = animId
    local ok, track = pcall(function()
        return animator:LoadAnimation(anim)
    end)
    if not ok or not track then return end

    carryAnimAutoWalkHum = hum
    carryAnimAutoWalkTrack = track
    track.Priority = Enum.AnimationPriority.Action
    track.Looped = true
    track:Play(0.15)
end

local function parseReplayLine(line)
    local firstPart = line:match("([^|]+)"); if not firstPart then return nil end
    local px, py, pz = firstPart:match("([^,]+),([^,]+),([^,]+)")
    if not px or not py or not pz then return nil end
    local pos = Vector3.new(tonumber(px) or 0, tonumber(py) or 0, tonumber(pz) or 0)

    local secondPart = line:match("^[^|]+|([^|]+)")
    local lookVec = nil
    if secondPart then
        local lx, ly, lz = secondPart:match("([^,]+),([^,]+),([^,]+)")
        if lx and ly and lz then
            lookVec = Vector3.new(tonumber(lx) or 0, tonumber(ly) or 0, tonumber(lz) or 0)
        end
    end

    local statePart = line:match("^[^|]+|[^|]+|[^|]*|([^|]+)")
    local rawState = statePart and statePart:match("^%s*(.-)%s*$") or ""

    return { pos = pos, look = lookVec, state = rawState }
end

local function loadUniversalDataFrom(url)
    local ok, body = pcall(function() return game:HttpGet(url) end)
    if not ok then
        safeNotify("Auto Walk", "HttpGet error: "..tostring(body), 5)
        return nil
    end
    local samples = {}
    for line in body:gmatch("[^\r\n]+") do
        local sm = parseReplayLine(line)
        if sm then table.insert(samples, sm) end
    end
    if #samples == 0 then
        safeNotify("Auto Walk", "Replay kosong.", 3)
        return nil
    end
    return { samples = samples }
end

local SMOOTH_POS_K, SMOOTH_LOOK_K = 6.6, 5.4
local EPS_MOVE       = 0.05
local SPEED_K        = 6.8
local VELDIR_K       = 8.8
local MAX_VEL_STEP   = 36.0

local smooth = { pos=nil, look=nil, lastPos=nil, spd=nil, vdir=nil, lastVel=nil }

local function expLerpVec3(cur, target, dt, k)
    if not cur then return target end
    local a = 1 - math.exp(-(k or 16) * math.max(dt, 1/240))
    return cur:Lerp(target, math.clamp(a, 0, 1))
end

local function expLerpScalar(cur, target, dt, k)
    if cur == nil then return target end
    local a = 1 - math.exp(-(k or 16) * math.max(dt, 1/240))
    return cur + (target - cur) * math.clamp(a, 0, 1)
end

local function safeUnit(v, fallback)
    if not v or v.Magnitude < 1e-6 then
        return (fallback and fallback.Unit) or Vector3.new(0,0,-1)
    end
    return v.Unit
end

local function expLerpDir(cur, target, dt, k)
    target = safeUnit(target, Vector3.new(0,0,-1))
    if not cur then return target end
    local a = 1 - math.exp(-(k or 16) * math.max(dt, 1/240))
    local v = cur:Lerp(target, math.clamp(a, 0, 1))
    return safeUnit(v, target)
end

local DOWN_LEN             = 300.0
local LEDGE_DROP           = 300.0
local LEDGE_AHEAD          = 19.5

local STICKY_GROUND_DIST   = 0.55
local PROX_GROUND_MAX      = 4.0

local FALL_VY_TRIP         = -3.0
local FALL_FRAMES_MIN      = 3

local RECENT_JUMP_GRACE    = 0.015
local PROX_JUMP_GRACE2     = 0.010

local DEEP_FALL_DIST       = 5.5
local FALL_VY_HARD         = -3.3
local DEEP_FALL_FRAMES_MIN = 1

local PRED_HORIZON         = 0.50
local MR_RAYS              = 48
local RING_RAD             = 6.0
local SECOND_RING_RAD      = 12.0
local AHEAD_STEP           = 5.5
local AHEAD_STEP_FAR       = 12.0

local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude
rayParams.FilterDescendantsInstances = { LocalPlayer.Character }

local function castDown(pos, length)
    return Workspace:Raycast(pos, Vector3.new(0, -length, 0), rayParams)
end

local function isGrounded(hrp, hum)
    if not hrp then return false end
    local base = hrp.Position
    local maxCheck = STICKY_GROUND_DIST + 0.25
    local hit = Workspace:Raycast(base, Vector3.new(0, -maxCheck, 0), rayParams)
    if hit then
        local dist = base.Y - hit.Position.Y
        if dist >= 0 and dist <= (STICKY_GROUND_DIST + 0.05) then
            return true
        end
    end
    return hum and hum.FloorMaterial ~= Enum.Material.Air
end

local function ledgeUnsafe(hrp)
    if not hrp then return true end
    local origin = hrp.Position + Vector3.new(0, 1.5, 0)
    local ahead  = origin + hrp.CFrame.LookVector * LEDGE_AHEAD
    local drop   = Workspace:Raycast(ahead, Vector3.new(0, -LEDGE_DROP, 0), rayParams)
    return (drop == nil)
end

local function sampleVirtualGround(hrp, vdir, speed, dt)
    local base = hrp.Position
    local look = vdir and vdir.Unit or hrp.CFrame.LookVector
    local bestDist = math.huge
    local bestHit = nil

    local points = { base }
    for n=1,MR_RAYS do
        local ang = (2*math.pi) * (n / MR_RAYS)
        table.insert(points, base + Vector3.new(math.cos(ang)*RING_RAD, 0, math.sin(ang)*RING_RAD))
        table.insert(points, base + Vector3.new(math.cos(ang)*SECOND_RING_RAD, 0, math.sin(ang)*SECOND_RING_RAD))
    end

    local aheadNear = base + look * AHEAD_STEP
    local aheadFar  = base + look * AHEAD_STEP_FAR
    table.insert(points, aheadNear)
    table.insert(points, aheadFar)

    local pred = base + look * (math.max(speed or 12,8) * PRED_HORIZON)
    table.insert(points, pred)

    for _,p in ipairs(points) do
        local hit = castDown(p, DOWN_LEN + 8.0)
        if hit then
            local d = math.max(0, p.Y - hit.Position.Y)
            if d < bestDist then
                bestDist = d; bestHit = hit
            end
        end
    end

    return bestHit, bestDist
end

local PLAYBACK_BASE = 1.0
local function sliderPlaybackMult(scale)
    scale = math.clamp(scale or 1.0, 0.1, 5.0)
    return scale
end

local REPLAY_HZ = 60

local uniConn

local function hardResetHumanoid()
    local char = LocalPlayer.Character
    local hum  = char and char:FindFirstChildOfClass("Humanoid")
    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
    if hum then
        pcall(function() hum:SetStateEnabled(Enum.HumanoidStateType.Freefall, true) end)
        pcall(function() hum:ChangeState(Enum.HumanoidStateType.Running) end)
        hum.Jump = false
        hum.WalkSpeed = 16
        hum.AutoRotate = true
    end
    if hrp then
        hrp.AssemblyLinearVelocity = Vector3.new(0,0,0)
        hrp.AssemblyAngularVelocity = Vector3.new(0,0,0)
    end
    if char and hum then
        pcall(function() applyDefaultAnim(char, hum) end)
    end
    stopCarryAnimAutoWalk()
    smooth.pos, smooth.look, smooth.lastPos, smooth.spd, smooth.vdir, smooth.lastVel = nil, nil, nil, nil, nil, nil
end

local function stopUniversalRemote()
    isUniversalRunning = false
    if uniConn then uniConn:Disconnect(); uniConn = nil end
    hardResetHumanoid()
    safeNotify("Auto Walk", "Stop.", 2)
end

local function startUniversalRemote()
    if not selectedUniversalRemote or not UniversalRemotePaths[selectedUniversalRemote] then
        safeNotify("Auto Walk", "Pilih dulu pathnya.", 3)
        return
    end

    pcall(function() if stopLuauMountWalk then stopLuauMountWalk() end end)
    pcall(function() if stopAutoFarmLoop then stopAutoFarmLoop() end end)

    local meta = UniversalRemotePaths[selectedUniversalRemote]
    local userTier = getUserTier()

    if not canAccess(userTier, meta.TIER) then
        safeNotify("Auto Walk", "Akses ditolak untuk tier kamu ["..userTier.."] ke ["..meta.TIER.."]", 4)
        return
    end

    if ENFORCE_SPECIAL_ONLY and (meta.TIER == "special" or meta.CATEGORY == "Special") then
        if not (userTier == "svip" or userTier == "special") then
            safeNotify("Auto Walk", "Path ["..tostring(selectedUniversalRemote).."] adalah [SPECIAL]. Hanya untuk SVIP/SPECIAL. Akses ditolak.", 5)
            return
        end
    end

    local obj = loadUniversalDataFrom(meta.URL)
    if not obj then return end
    isUniversalRunning = true

    task.spawn(function()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")

        rayParams.FilterDescendantsInstances = { char }

        if hum then
            saveCurrentAnimate(char, hum)
            if useAdidasAnim then
                forceAdidas(char, hum)
            else
                applyDefaultAnim(char, hum)
            end
            if useCarryAnimAutoWalk then
                playCarryAnimAutoWalk()
            else
                stopCarryAnimAutoWalk()
            end
        end

        local samples = obj.samples
        local sampleCount = #samples
        if sampleCount < 2 then
            safeNotify("Auto Walk", "Replay terlalu pendek.", 3)
            isUniversalRunning = false
            return
        end

        local replayHz = REPLAY_HZ
        local replayDuration = (sampleCount - 1) / replayHz

        local function sampleAtTime(t)
            if t <= 0 then
                return samples[1], samples[2], 0
            end
            if t >= replayDuration then
                return samples[sampleCount-1], samples[sampleCount], 1
            end
            local idxFloat = t * replayHz
            local base = math.floor(idxFloat)
            local alpha = idxFloat - base
            local i0 = base + 1
            local i1 = math.min(i0 + 1, sampleCount)
            return samples[i0], samples[i1], alpha
        end

        local s1 = samples[1]
        if s1 and hrp then
            local lookDir = (s1.look and s1.look.Magnitude > 0.01) and s1.look or Vector3.new(0,0,-1)
            hrp.CFrame = CFrame.lookAt(s1.pos, s1.pos + lookDir)
            smooth.pos, smooth.look = s1.pos, lookDir.Unit
        end

        local prevState = nil
        local awaitingRespawn, charAddedConn = false, nil
        local lastJumpAt = -1e9
        local groundedSince = nil
        local prevGrounded = false
        local stableGroundFrames = 0

        local inAir = false
        local wasReplayJump = false
        local fallFrames = 0

        local baselineGroundDist = nil
        local baselineGroundUpdatedAt = nil
        local groundedHardSince = nil
        local lastReplayLandedAt = -1e9

        local hasEverTouchedGround = false

        local ALLOW_SPAM_JUMP             = true
        local MIN_JUMP_COOLDOWN           = 0.3
        local HOLD_RETRIGGER_TIME         = 0.40
        local MIN_GROUND_TIME_BEFORE_JUMP = 0.30

        local HARD_GROUND_DIST     = 0.010 

        local freefallDisabled = false
        local deepFallFrames   = 0

        local t0 = _clock()
        local elapsed = 0
        local lastNow = t0

        uniConn = RunService.Heartbeat:Connect(function(dt)
            if not isUniversalRunning then return end
            if not hrp or not hrp.Parent then return end
            if not hum then return end
            if awaitingRespawn then return end

            dt = math.clamp(dt or 1/60, 1/240, 1/60)

            local now = _clock()
            local true_dt = now - lastNow
            lastNow = now
            
            local playbackScale = sliderPlaybackMult(universalSpeedScale) * PLAYBACK_BASE
            elapsed = elapsed + (true_dt * playbackScale)

            if elapsed >= replayDuration then
                if universalMode == "loop" then
                    t0 = now
                    elapsed = 0
                    lastNow = now
                    inAir, wasReplayJump = false, false
                    fallFrames, deepFallFrames = 0, 0
                    groundedSince, prevGrounded, stableGroundFrames = nil, false, 0
                    groundedHardSince = nil
                    lastReplayLandedAt = -1e9
                elseif universalMode == "respawn" then
                    if not awaitingRespawn then
                        awaitingRespawn = true
                        safeNotify("Auto Walk", "Selesai, respawn...", 3)
                        if charAddedConn then charAddedConn:Disconnect() end
                        charAddedConn = LocalPlayer.CharacterAdded:Once(function()
                            task.delay(0.15, function()
                                local newChar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                                local newHum  = newChar:WaitForChild("Humanoid", 5)
                                local newHrp  = newChar:WaitForChild("HumanoidRootPart", 5)
                                if not newHum or not newHrp then return end
                                hrp, hum = newHrp, newHum
                                rayParams.FilterDescendantsInstances = { newChar }
                                saveCurrentAnimate(newChar, hum)
                                if useAdidasAnim then
                                    forceAdidas(newChar, hum)
                                else
                                    applyDefaultAnim(newChar, hum)
                                end
                                if useCarryAnimAutoWalk then
                                    playCarryAnimAutoWalk()
                                else
                                    stopCarryAnimAutoWalk()
                                end
                                local first = samples[1]
                                if first and hrp then
                                    local fLook = (first.look and first.look.Magnitude > 0.01) and first.look or Vector3.new(0,0,-1)
                                    hrp.CFrame = CFrame.lookAt(first.pos, first.pos + fLook)
                                    smooth.pos, smooth.look = first.pos, fLook.Unit
                                end
                                t0 = _clock()
                                elapsed = 0
                                lastNow = t0
                                awaitingRespawn, isUniversalRunning = false, true
                                inAir, wasReplayJump, lastJumpAt = false, false, -1e9
                                fallFrames = 0
                                groundedSince = nil
                                prevGrounded = false
                                stableGroundFrames = 0
                                deepFallFrames = 0
                                freefallDisabled = false
                                groundedHardSince = nil
                                baselineGroundDist = nil
                                baselineGroundUpdatedAt = nil
                                lastReplayLandedAt = -1e9
                                hasEverTouchedGround = false
                                safeNotify("Auto Walk", "Respawn OK, auto jalan lagi.", 2)
                            end)
                        end)
                        pcall(function() if LocalPlayer.Character then LocalPlayer.Character:BreakJoints() end end)
                    end
                    return
                else
                    stopUniversalRemote()
                    safeNotify("Auto Walk", "Selesai 1x.", 3)
                    return
                end
            end

            local s, nxt, alpha = sampleAtTime(math.max(0, math.min(elapsed, replayDuration)))
            if not s then return end

            local delta = nxt and (nxt.pos - s.pos) or Vector3.new(0,0,0)
            local dist  = delta.Magnitude
            local MOVING = dist > EPS_MOVE

            local targetPos  = (nxt and s.pos:Lerp(nxt.pos, alpha)) or s.pos
            local targetLook

            if MOVING then
                if s.look and s.look.Magnitude > 0.01 then
                    if dist > 1e-6 then
                        targetLook = s.look:Lerp(delta, 0.35)
                    else
                        targetLook = s.look
                    end
                else
                    if dist > 1e-6 then
                        targetLook = delta
                    else
                        targetLook = smooth.look or Vector3.new(0,0,-1)
                    end
                end
            else
                targetLook = smooth.look
                    or (s.look and s.look.Magnitude > 0.01 and s.look)
                    or Vector3.new(0,0,-1)
            end

            smooth.pos  = expLerpVec3(smooth.pos or targetPos,  targetPos,  dt, SMOOTH_POS_K)
            smooth.look = expLerpDir (smooth.look,              targetLook, dt, SMOOTH_LOOK_K)
            
            local finalPos = smooth.pos + Vector3.new(0, universalYOffset, 0)
            hrp.CFrame  = CFrame.lookAt(finalPos, finalPos + smooth.look)

            local speedNow = (smooth.spd or 12) 
            local virtHit, virtDist = sampleVirtualGround(hrp, smooth.vdir or smooth.look, speedNow, dt)
            
            local actualState = hum:GetState()
            local isClimbing = (actualState == Enum.HumanoidStateType.Climbing)
            
            local probe = castDown(hrp.Position, DOWN_LEN + 8.0)
            local groundDist = probe and math.max(0, hrp.Position.Y - probe.Position.Y) or math.huge

            local basicGround = isGrounded(hrp, hum)
            local stickyGroundDist = (groundDist <= STICKY_GROUND_DIST)
            local stickyVirtDist = (virtHit and virtDist and virtDist <= STICKY_GROUND_DIST)

            local trueGroundedNow = basicGround or stickyGroundDist or stickyVirtDist

            if trueGroundedNow then
                groundedSince = groundedSince or (now)
                stableGroundFrames = math.min(stableGroundFrames + 1, 60)
                hasEverTouchedGround = true
                if stableGroundFrames > 3 then
                    inAir = false
                end
            else
                groundedSince = nil
                stableGroundFrames = 0
                groundedHardSince = nil
            end

            if trueGroundedNow and not prevGrounded then
                local lv = hrp.AssemblyLinearVelocity
                hrp.AssemblyLinearVelocity = Vector3.new(lv.X, 0, lv.Z)
            end
            prevGrounded = trueGroundedNow

            local vy = hrp.AssemblyLinearVelocity.Y
            local nearGroundBand = (groundDist <= PROX_GROUND_MAX) or (virtHit and virtDist and virtDist <= PROX_GROUND_MAX)
            local stickyBand     = (groundDist <= STICKY_GROUND_DIST)

            if trueGroundedNow and math.abs(vy) < 0.14 then
                if baselineGroundDist == nil then
                    baselineGroundDist = groundDist
                else
                    baselineGroundDist = baselineGroundDist + (groundDist - baselineGroundDist) * 0.15
                end
                baselineGroundUpdatedAt = now
            end

            local hardGroundNow = false
            if trueGroundedNow then
                if baselineGroundDist then
                    local diff = math.abs(groundDist - baselineGroundDist)
                    if diff <= 0.007 and math.abs(vy) < 0.14 then
                        hardGroundNow = true
                    end
                else
                    if groundDist <= HARD_GROUND_DIST and math.abs(vy) < 0.14 then
                        hardGroundNow = true
                    end
                end
            end

            if hardGroundNow then
                groundedHardSince = groundedHardSince or now
            else
                groundedHardSince = nil
            end

            if (not trueGroundedNow) and (vy < FALL_VY_TRIP) and (not nearGroundBand) and (not isClimbing) then
                fallFrames = math.min(fallFrames + 1, 1000)
            else
                fallFrames = 0
            end

            local farFromAllGround = (groundDist > DEEP_FALL_DIST) and ((not virtDist) or (virtDist > DEEP_FALL_DIST))
            if (vy < FALL_VY_HARD) and farFromAllGround then
                deepFallFrames = math.min(deepFallFrames + 1, 1000)
            else
                deepFallFrames = 0
            end
            local allowTrueFreefall = (deepFallFrames >= DEEP_FALL_FRAMES_MIN)

            local st = (s.state or ""):lower()
            local stateMap = {
                running=Enum.HumanoidStateType.Running,
                run=Enum.HumanoidStateType.Running,
                walk=Enum.HumanoidStateType.Running,
                idle=Enum.HumanoidStateType.Running,
                jumping=Enum.HumanoidStateType.Jumping,
                jump=Enum.HumanoidStateType.Jumping,
                climb=Enum.HumanoidStateType.Climbing,
                climbing=Enum.HumanoidStateType.Climbing,
                freefall=Enum.HumanoidStateType.Freefall,
                fall=Enum.HumanoidStateType.Freefall,
                swimming=Enum.HumanoidStateType.Swimming,
                swim=Enum.HumanoidStateType.Swimming,
                landed=Enum.HumanoidStateType.Landed,
                land=Enum.HumanoidStateType.Landed,
            }
            
            local targetState = stateMap[st] or Enum.HumanoidStateType.Running
            if isClimbing then
                targetState = Enum.HumanoidStateType.Climbing
            end

            local isReplayLanded = (st == "landed" or st == "land")
            if isReplayLanded then
                lastReplayLandedAt = now
            end

            local desiredJump = (st == "jump" or st == "jumping")
            local sinceJump   = now - lastJumpAt

            local groundedLongEnough = groundedHardSince
                and ((now - groundedHardSince) >= MIN_GROUND_TIME_BEFORE_JUMP)
                and (stableGroundFrames >= 7)

            local landedFromReplay   = (now - lastReplayLandedAt) <= 0.07

            local canJumpNow         = groundedLongEnough and landedFromReplay

            if not hasEverTouchedGround then
                canJumpNow = false
            end

            local risingEdge = desiredJump and (not wasReplayJump)
            local cooldownOk = (sinceJump > MIN_JUMP_COOLDOWN)

            if canJumpNow and risingEdge and cooldownOk and not inAir then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
                hum.Jump = true
                inAir = true
                lastJumpAt = now
                prevState = Enum.HumanoidStateType.Jumping
                lastReplayLandedAt = -1e9
            end
            wasReplayJump = desiredJump

            local blockFreefall = (stickyBand or nearGroundBand or (sinceJump <= RECENT_JUMP_GRACE) or (fallFrames < FALL_FRAMES_MIN))
            if allowTrueFreefall then
                blockFreefall = false
            end

            if blockFreefall ~= freefallDisabled then
                pcall(function() hum:SetStateEnabled(Enum.HumanoidStateType.Freefall, not blockFreefall) end)
                freefallDisabled = blockFreefall
            end

            if targetState == Enum.HumanoidStateType.Freefall and blockFreefall then
                targetState = Enum.HumanoidStateType.Jumping
            end

            if actualState ~= Enum.HumanoidStateType.Climbing then
                if hum:GetState() == Enum.HumanoidStateType.Freefall and trueGroundedNow then
                    hum:ChangeState(Enum.HumanoidStateType.Running)
                    prevState = Enum.HumanoidStateType.Running
                elseif hum:GetState() == Enum.HumanoidStateType.Freefall and blockFreefall then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                    prevState = Enum.HumanoidStateType.Jumping
                elseif targetState ~= prevState then
                    hum:ChangeState(targetState)
                    prevState = targetState
                end
            end

            if useCarryAnimAutoWalk and not carryAnimAutoWalkTrack then
                playCarryAnimAutoWalk()
            end

            local desiredSpeedRaw = math.max(dist * replayHz, 8)
            smooth.spd = expLerpScalar(smooth.spd, desiredSpeedRaw, dt, SPEED_K)
            local dirRaw = safeUnit(delta, smooth.look)
            smooth.vdir  = expLerpVec3(smooth.vdir, dirRaw, dt, VELDIR_K)

            hrp.AssemblyAngularVelocity = Vector3.new(0,0,0)
            
            if MOVING then
                local targetVel = smooth.vdir * (smooth.spd or desiredSpeedRaw)
                local vel       = smooth.lastVel or targetVel
                local maxStep   = MAX_VEL_STEP * dt
                local diff      = targetVel - vel
                if diff.Magnitude > maxStep then
                    vel = vel + diff.Unit * maxStep
                else
                    vel = targetVel
                end
                hrp.AssemblyLinearVelocity = vel

                smooth.lastVel = vel

                if targetState == Enum.HumanoidStateType.Climbing then
                    hum.WalkSpeed = math.max(10, (smooth.spd or desiredSpeedRaw) * 0.8)
                    hum:Move(Vector3.new(0,1,0), true)
                elseif targetState == Enum.HumanoidStateType.Running then
                    hum.WalkSpeed = desiredSpeedRaw
                    hum:Move(smooth.vdir, true)
                else
                    hum.WalkSpeed = 0
                    hum:Move(Vector3.new(0,0,0), true)
                end
            else
                hrp.AssemblyLinearVelocity = Vector3.new(0,0,0)
                smooth.lastVel = nil
                smooth.spd = expLerpScalar(smooth.spd, 8, dt, SPEED_K)
                hum.WalkSpeed = 8
                hum:Move(Vector3.new(0,0,0), true)
            end

            smooth.lastPos = smooth.pos
        end)

        safeNotify("Auto Walk", "Dimulai: "..tostring(selectedUniversalRemote).." ("..universalMode..")", 4)
    end)
end

if AutoWalkTab and AutoWalkTab.Dropdown and AutoWalkTab.Toggle then
    local function buildVipAwareList()
        local userTier = getUserTier()
        local groups = { ["Free"]={}, ["VIP"]={}, ["Special"]={} }
        for name,cfg in pairs(UniversalRemotePaths) do
            if canAccess(userTier, (cfg.TIER or "free")) then
                local tag = (cfg.TIER or "free"):upper()
                local label = ("[%s] %s"):format(tag, name)
                table.insert(groups[cfg.CATEGORY or "Free"], label)
            end
        end
        local out = {}
        local function pushGroup(title, arr)
            if #arr > 0 then
                table.insert(out, ("--- %s ---"):format(title))
                table.sort(arr)
                for _,v in ipairs(arr) do
                    table.insert(out, v)
                end
            end
        end
        pushGroup("Free", groups["Free"])
        pushGroup("VIP", groups["VIP"])
        pushGroup("Special", groups["Special"])
        return out
    end

    AutoWalkTab:Dropdown({
        Title = "Pilih Auto Walk Path",
        List  = buildVipAwareList(),
        Callback = function(choice)
            local clean = tostring(choice):gsub("^%-%-%-.-%-%-%-%s*", ""):gsub("^%[.-%]%s*", "")
            if not UniversalRemotePaths[clean] then return end
            selectedUniversalRemote = clean
            local meta = UniversalRemotePaths[clean]
            local userTier = getUserTier()
            if not canAccess(userTier, meta.TIER) then
                safeNotify("Auto Walk", "Akses ditolak untuk tier kamu.", 3)
            else
                safeNotify("Auto Walk", "Selected: "..clean.." ["..meta.TIER.."]", 2)
            end
        end
    })

    AutoWalkTab:Dropdown({
        Title = "Mode",
        List  = {"loop", "respawn"},
        Callback = function(v) universalMode = v end
    })

    AutoWalkTab:Toggle({
        Title = "Use Adidas Animation",
        Value = false,
        Callback = function(v)
            useAdidasAnim = v
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then
                if useAdidasAnim then
                    forceAdidas(char, hum)
                    safeNotify("Auto Walk", "Adidas ON", 2)
                else
                    applyDefaultAnim(char, hum)
                    safeNotify("Auto Walk", "Adidas OFF (default)", 2)
                end
                if useCarryAnimAutoWalk and isUniversalRunning then
                    playCarryAnimAutoWalk()
                end
            end
        end
    })

    AutoWalkTab:Toggle({
        Title = "Use Anim Carry",
        Value = false,
        Callback = function(v)
            useCarryAnimAutoWalk = v and true or false
            if not isUniversalRunning then
                if not v then
                    stopCarryAnimAutoWalk()
                end
                return
            end
            if v then
                playCarryAnimAutoWalk()
                safeNotify("Auto Walk", "Carry anim ON", 2)
            else
                stopCarryAnimAutoWalk()
                safeNotify("Auto Walk", "Carry anim OFF", 2)
            end
        end
    })

    AutoWalkTab:Toggle({
        Title = "Start Auto Walk",
        Value = false,
        Callback = function(v)
            if v then startUniversalRemote() else stopUniversalRemote() end
        end
    })

    AutoWalkTab:Slider({
        Title="Playback (10=1x, 20=2x)",
        Min=2, Max=50, Value=10,
        Callback=function(v)
            universalSpeedScale = math.clamp((tonumber(v) or 10)/10, 0.1, 5.0)
            safeNotify("Auto Walk", ("Playback: x%.2f"):format(PLAYBACK_BASE * sliderPlaybackMult(universalSpeedScale)), 2)
        end
    })

    AutoWalkTab:Slider({
        Title="Height Offset (Y)",
        Min=-5, Max=5, Value=0,
        Callback=function(v)
            universalYOffset = (tonumber(v) or 0)
            safeNotify("Auto Walk", ("Height Offset: %.2f"):format(universalYOffset), 2)
        end
    })
else
    selectedUniversalRemote = "Auto Walk"
    startUniversalRemote()
end

    local selectedMount = nil 
    local AllMountsConfig = { 
        ["Agung"] = {Route = agungRoute, Delay = 5, EndAction = "kill", PostDelay = 5}, 
        ["Apasih"] = {Route = apasihRoute, Delay = 5, EndAction = "kill", PostDelay = 5}, 
        ["Atin (ServerHop)"] = {Route = atinRoute, Delay = 8, EndAction = "serverhop", PostDelay = 8}, 
        ["Bayii"] = {Route = bayiiRoute, Delay = 10, EndAction = "kill", PostDelay = 5}, 
        ["Cukurukuk (Serverhop)"] = {Route = cukurukukRoute, Delay = 1, EndAction = "serverhop", PostDelay = 2}, 
        ["Fantasy"] = {Route = fantasyRoute, Delay = 5, EndAction = "kill", PostDelay = 5}, 
        ["Hanami"] = {Route = hanamiRoute, Delay = 24, EndAction = "kill", PostDelay = 3}, 
        ["Hell Expedition"] = {Route = hellExpeditionRoute, Delay = 8, EndAction = nil, PostDelay = 0}, 
        ["HTS"] = {Route = htsRoute, Delay = 20, EndAction = "kill", PostDelay = 2}, 
        ["Jawa"] = {Route = mountJawaRoute, Delay = 8, EndAction = "kill", PostDelay = 8}, 
        ["Kawah Terjun (ServerHop)"] = {Route = kawahTerjunRoute, Delay = 5, EndAction = "serverhop", PostDelay = 188}, 
        ["Lembayana"] = {Route = lembayanaRoute, Delay = 1, EndAction = "kill", PostDelay = 5}, 
        ["Merapi (ServerHop)"] = {Route = merapiRoute, Delay = 10, EndAction = "serverhop", PostDelay = 0}, 
        ["Mika"] = {Route = mikaRoute, Delay = 8, EndAction = "loop", PostDelay = 5},
        ["Nirwana HD (Loop)"] = {Route = nirwanaHDRoute, Delay = 5, EndAction = "kill", PostDelay = 2}, 
        ["Neraka Journey (Loop)"] = {Route = nerakaJourneyRoute, Delay = 24, EndAction = "loop", PostDelay = 2}, 
        ["Papua (Loop)"] = {Route = papuaRoute, Delay = 1, EndAction = "kill", PostDelay = 2}, 
        ["Pedaunan"] = {Route = pedaunanRoute, Delay = 5, EndAction = "kill", PostDelay = 5},
        ["Phoenix"] = {Route = phoenixRoute, Delay = 3, EndAction = "kill", PostDelay = 1}, 
        ["Sakahayang"] = {Route = sakahayangRoute, Delay = 5, EndAction = "kill", PostDelay = 2}, 
        ["Serelia (Loop)"] = {Route = sereliaRoute, Delay = 35, EndAction = "kill", PostDelay = 5}, 
        ["Sibuatan (ServerHop)"] = {Route = sibuatanRoute, Delay = 2, EndAction = "serverhop", PostDelay = 10}, 
        ["Sumbing"] = {Route = sumbingRoute, Delay = 10, EndAction = "kill", PostDelay = 10}, 
        ["Taranjang"] = {Route = taranjangRoute, Delay = 0.5, EndAction = "kill", PostDelay = 1}, 
        ["Yeudeh"] = {Route = yeudehRoute, Delay = 8, EndAction = "kill", PostDelay = 5}
    } 

    local function buildMountList() 
        local mountNames = {} 
        for name, _ in pairs(AllMountsConfig) do 
            if SpecialMounts[name] then 
                if _G.gVip or _G.sVip then table.insert(mountNames, name) end 
            elseif VipMounts[name] then 
                if _G.kVip or _G.sVip then table.insert(mountNames, name) end 
            else 
                table.insert(mountNames, name) 
            end 
        end 
        table.sort(mountNames) 

        AutoSummitTab:Dropdown({ 
            Title = "Pilih Gunung", List = mountNames, 
            Callback = function(choice) selectedMount = choice end 
        }) 

        AutoSummitTab:Toggle({ 
            Title = "Mulai Auto Summit", Value = false, 
            Callback = function(v) 
                if v then 
                    if selectedMount and AllMountsConfig[selectedMount] then 
                        local config = AllMountsConfig[selectedMount] 
                        stopLuauMountWalk() 
                        if SpecialMounts[selectedMount] and not (_G.gVip or _G.sVip) then 
                            notify("Access Denied", "Gunung ini khusus Global VIP / Super VIP!", 4); return 
                        end 
                        if VipMounts[selectedMount] and not (_G.kVip or _G.sVip) then 
                            notify("Access Denied", "Mount ini khusus VIP!", 4); return 
                        end 
                        startAutoFarmLoop(config.Route, config.Delay, "Auto Mount " .. selectedMount, config.EndAction, config.PostDelay) 
                    else 
                        notify("Error", "Pilih gunung terlebih dahulu!", 3) 
                    end 
                else 
                    stopAutoFarmLoop() 
                end 
            end 
        }) 
    end
    buildMountList() 
    
    local infJumpConn 
    MainTab:Toggle({ 
        Title = "Infinite Jump", Value = false, 
        Callback = function(v) 
            if v then 
                if infJumpConn then infJumpConn:Disconnect() end 
                infJumpConn = UserInputService.JumpRequest:Connect(function() 
                    if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end 
                end) 
            else 
                if infJumpConn then infJumpConn:Disconnect(); infJumpConn = nil end 
            end 
        end 
    }) 
    MainTab:Slider({Title = "WalkSpeed", Min = 0, Max = 100, Value = 16, Callback = function(val) 
        if humanoid then humanoid.WalkSpeed = val end 
    end}) 
    MainTab:Slider({Title = "JumpPower", Min = 0, Max = 300, Value = 50, Callback = function(val) 
        if humanoid then humanoid.JumpPower = val; humanoid.UseJumpPower = true end 
    end}) 
    
    local FLYING, FLYSPEED = false, 50 
    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0} 
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0} 
    local flyBV, flyBG, flyConn 
    local IsMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled 
    
    local stopFly;

    local isVehicleFlyActive = false
    local vehicleFlySpeed = 50
    local vehicleFlyCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local vehicleFlyBV, vehicleFlyBG, vehicleFlyConn

    local function stopVehicleFly()
        isVehicleFlyActive = false
        if vehicleFlyBV then vehicleFlyBV:Destroy(); vehicleFlyBV = nil end
        if vehicleFlyBG then vehicleFlyBG:Destroy(); vehicleFlyBG = nil end
        if vehicleFlyConn then vehicleFlyConn:Disconnect(); vehicleFlyConn = nil end
        if humanoid then humanoid.PlatformStand = false end
        notify("Troll", "Vehicle Fly dinonaktifkan.", 3)
    end

    local function startVehicleFly()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        humanoid = char:WaitForChild("Humanoid")
        local root = char:WaitForChild("HumanoidRootPart")
        if not root then return end

        if FLYING then stopFly() end

        isVehicleFlyActive = true
        humanoid.PlatformStand = true
        vehicleFlyBV = Instance.new("BodyVelocity", root); vehicleFlyBV.MaxForce = Vector3.new(9e9,9e9,9e9); vehicleFlyBV.Velocity = Vector3.zero
        vehicleFlyBG = Instance.new("BodyGyro", root); vehicleFlyBG.MaxTorque = Vector3.new(9e9,9e9,9e9); vehicleFlyBG.P = 1000; vehicleFlyBG.D = 50; vehicleFlyBG.CFrame = root.CFrame
        
        vehicleFlyConn = RunService.RenderStepped:Connect(function()
            if not isVehicleFlyActive or not humanoid or not root.Parent then return end
            humanoid.PlatformStand = true
            local cam = workspace.CurrentCamera
            
            local moveVec
            if IsMobile then
               
                local dir = require(LocalPlayer.PlayerScripts.PlayerModule.ControlModule):GetMoveVector() 
                moveVec = (cam.CFrame.LookVector * -dir.Z) + (cam.CFrame.RightVector * dir.X)
            else
                
                moveVec = Vector3.new(vehicleFlyCONTROL.L + vehicleFlyCONTROL.R, vehicleFlyCONTROL.Q + vehicleFlyCONTROL.E, vehicleFlyCONTROL.F + vehicleFlyCONTROL.B)
            end
            
            vehicleFlyBV.Velocity = (moveVec.Magnitude > 0 and moveVec.Unit or moveVec) * vehicleFlySpeed
            vehicleFlyBG.CFrame = cam.CFrame
        end)
        notify("Troll", "Vehicle Fly diaktifkan!", 3)
    end

    local function startFly() 
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait() 
        humanoid = char:WaitForChild("Humanoid") 
        local root = char:WaitForChild("HumanoidRootPart") 

        if isVehicleFlyActive then stopVehicleFly() end

        FLYING = true 
        humanoid.PlatformStand = true 
        flyBV = Instance.new("BodyVelocity", root); flyBV.MaxForce = Vector3.new(9e9,9e9,9e9); flyBV.Velocity = Vector3.zero 
        flyBG = Instance.new("BodyGyro", root); flyBG.MaxTorque = Vector3.new(9e9,9e9,9e9); flyBG.P = 1000; flyBG.D = 50; flyBG.CFrame = root.CFrame
        flyConn = RunService.RenderStepped:Connect(function() 
            if not FLYING or not humanoid or not root.Parent then return end 
            humanoid.PlatformStand = true 
            local cam = workspace.CurrentCamera 
            local moveVec 
            if IsMobile then 
                local dir = require(LocalPlayer.PlayerScripts.PlayerModule.ControlModule):GetMoveVector() 
                moveVec = (cam.CFrame.LookVector * -dir.Z) + (cam.CFrame.RightVector * dir.X) 
            else 
                moveVec = Vector3.new(CONTROL.L + CONTROL.R, CONTROL.Q + CONTROL.E, CONTROL.F + CONTROL.B) 
            end 
            flyBV.Velocity = (moveVec.Magnitude > 0 and moveVec.Unit or moveVec) * FLYSPEED 
            flyBG.CFrame = cam.CFrame 
        end) 
    end 

    stopFly = function() 
        FLYING = false 
        if flyBV then flyBV:Destroy(); flyBV = nil end 
        if flyBG then flyBG:Destroy(); flyBG = nil end 
        if flyConn then flyConn:Disconnect(); flyConn = nil end 
        if humanoid then humanoid.PlatformStand = false end 
    end 

    UserInputService.InputBegan:Connect(function(input, processed) 
        if processed or IsMobile then return end 

        if isVehicleFlyActive then
            if input.KeyCode == Enum.KeyCode.W then vehicleFlyCONTROL.F = 1 end 
            if input.KeyCode == Enum.KeyCode.S then vehicleFlyCONTROL.B = -1 end 
            if input.KeyCode == Enum.KeyCode.A then vehicleFlyCONTROL.L = -1 end 
            if input.KeyCode == Enum.KeyCode.D then vehicleFlyCONTROL.R = 1 end 
            if input.KeyCode == Enum.KeyCode.E then vehicleFlyCONTROL.E = 1 end 
            if input.KeyCode == Enum.KeyCode.Q then vehicleFlyCONTROL.Q = -1 end
            return
        end

        if not FLYING then return end 
        if input.KeyCode == Enum.KeyCode.W then CONTROL.F = 1 end 
        if input.KeyCode == Enum.KeyCode.S then CONTROL.B = -1 end 
        if input.KeyCode == Enum.KeyCode.A then CONTROL.L = -1 end 
        if input.KeyCode == Enum.KeyCode.D then CONTROL.R = 1 end 
        if input.KeyCode == Enum.KeyCode.E then CONTROL.E = 1 end 
        if input.KeyCode == Enum.KeyCode.Q then CONTROL.Q = -1 end
    end) 
    UserInputService.InputEnded:Connect(function(input, processed) 
        if processed or IsMobile then return end 

        if isVehicleFlyActive then
            if input.KeyCode == Enum.KeyCode.W then vehicleFlyCONTROL.F = 0 end 
            if input.KeyCode == Enum.KeyCode.S then vehicleFlyCONTROL.B = 0 end 
            if input.KeyCode == Enum.KeyCode.A then vehicleFlyCONTROL.L = 0 end 
            if input.KeyCode == Enum.KeyCode.D then vehicleFlyCONTROL.R = 0 end 
            if input.KeyCode == Enum.KeyCode.E then vehicleFlyCONTROL.E = 0 end 
            if input.KeyCode == Enum.KeyCode.Q then vehicleFlyCONTROL.Q = 0 end
            return
        end

        if input.KeyCode == Enum.KeyCode.W then CONTROL.F = 0 end 
        if input.KeyCode == Enum.KeyCode.S then CONTROL.B = 0 end 
        if input.KeyCode == Enum.KeyCode.A then CONTROL.L = 0 end 
        if input.KeyCode == Enum.KeyCode.D then CONTROL.R = 0 end 
        if input.KeyCode == Enum.KeyCode.E then CONTROL.E = 0 end 
        if input.KeyCode == Enum.KeyCode.Q then CONTROL.Q = 0 end 
    end) 

    MainTab:Toggle({Title = "Fly", Value = false, Callback = function(v) if v then startFly() else stopFly() end end}) 
    MainTab:Slider({Title = "Fly Speed", Min = 1, Max = 200, Value = FLYSPEED, Callback = function(v) FLYSPEED = v end}) 
    
    if _G.kVip or _G.sVip or _G.gVip then
        local CFspeed = 50
        local CFloop = nil
        local function startCFrameFly()
            local char = LocalPlayer.Character; if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid"); local head = char:FindFirstChild("Head")
            if not hum or not head then return end
            hum.PlatformStand = true; head.Anchored = true
            if CFloop then CFloop:Disconnect() end
            CFloop = RunService.Heartbeat:Connect(function(dt)
                if not hum or not head or not head.Parent then CFloop:Disconnect(); return end
                local move = hum.MoveDirection * (CFspeed * dt)
                local cam = workspace.CurrentCamera; local camCF = cam.CFrame
                local offset = head.CFrame:ToObjectSpace(camCF).Position
                camCF = camCF * CFrame.new(-offset.X, -offset.Y, -offset.Z + 1)
                local camPos = camCF.Position; local headPos = head.Position
                local relative = CFrame.new(camPos, Vector3.new(headPos.X, camPos.Y, headPos.Z)):VectorToObjectSpace(move)
                head.CFrame = CFrame.new(headPos) * (camCF - camPos) * CFrame.new(relative)
            end)
            notify("Fly", "Undetected Fly aktif — akses: " .. getTierName(), 4)
        end
        local function stopCFrameFly()
            if CFloop then CFloop:Disconnect(); CFloop = nil end
            local char = LocalPlayer.Character; if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid"); local head = char:FindFirstChild("Head")
            if hum then hum.PlatformStand = false end; if head then head.Anchored = false end
            notify("Fly", "Undetected Fly dimatikan", 3)
        end
        MainTab:Toggle({
            Title = "Fly (Undetected, VIP Tier)", Value = false,
            Callback = function(v) if v then startCFrameFly() else stopCFrameFly() end end
        })
        MainTab:Slider({
            Title = "Fly Speed (Undetected, VIP Tier)", Min = 10, Max = 200, Value = 50,
            Callback = function(v) CFspeed = tonumber(v) or 50 end
        })
    end
     
    local noclipEnabled, noclipConnection = false, nil 
    local function setCharacterCollision(char, state) 
        if char then for _, part in ipairs(char:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = not state end end end 
    end 
    MainTab:Toggle({Title="Noclip", Value=false, Callback=function(v) 
        noclipEnabled = v 
        if noclipEnabled then 
            if LocalPlayer.Character then setCharacterCollision(LocalPlayer.Character, true) end 
            if noclipConnection then noclipConnection:Disconnect() end 
            noclipConnection = RunService.Stepped:Connect(function() 
                if noclipEnabled and humanoid then humanoid.PlatformStand = true end 
            end) 
        else 
            if noclipConnection then noclipConnection:Disconnect(); noclipConnection = nil end 
            if LocalPlayer.Character then humanoid.PlatformStand = false; setCharacterCollision(LocalPlayer.Character, false) end 
        end 
    end}) 
    
    local fullBrightOn, brightnessLevel = false, 2.5 
    VisualTab:Toggle({Title = "Full Bright", Value = false, Callback = function(v) 
        fullBrightOn = v; Lighting.Brightness = v and brightnessLevel or 1; Lighting.FogEnd = v and 100000 or 1000 
    end}) 
    VisualTab:Slider({Title = "Brightness", Min = 0, Max = 10, Value = 2.5, Callback = function(val) 
        brightnessLevel = val; if fullBrightOn then Lighting.Brightness = val end 
    end}) 
    
    local espEnabled, espConnection = false, nil 
    local espElements = {} 
    local function clearESP() 
        for _, elements in pairs(espElements) do 
            if elements.Highlight then elements.Highlight:Destroy() end; if elements.Billboard then elements.Billboard:Destroy() end 
        end; espElements = {} 
    end 
    local function updateESP() 
        local keep = {} 
        for _, pl in ipairs(Players:GetPlayers()) do 
            if pl ~= LocalPlayer and pl.Character and pl.Character:FindFirstChild("Head") then 
                keep[pl] = true 
                if not espElements[pl] then 
                    local head = pl.Character.Head 
                    local hl = Instance.new("Highlight", pl.Character); hl.FillColor=Color3.fromRGB(255,60,60); hl.FillTransparency=0.7; hl.OutlineColor=Color3.fromRGB(255,0,0); hl.OutlineTransparency=0.2
                    local bb = Instance.new("BillboardGui", head); bb.Adornee=head; bb.Size=UDim2.new(0,120,0,30); bb.AlwaysOnTop=true; bb.ExtentsOffsetWorld=Vector3.new(0,1.5,0) 
                    local lab = Instance.new("TextLabel", bb); lab.Size=UDim2.new(1,0,1,0); lab.Text=pl.Name; lab.TextColor3=Color3.new(1,1,1); lab.BackgroundTransparency=1; lab.Font=Enum.Font.SourceSansSemibold; lab.TextScaled=true
                    espElements[pl] = {Highlight = hl, Billboard = bb} 
                end 
            end 
        end 
        for pl, elements in pairs(espElements) do 
            if not keep[pl] then 
                if elements.Highlight then elements.Highlight:Destroy() end; if elements.Billboard then elements.Billboard:Destroy() end; espElements[pl] = nil 
            end 
        end 
    end 
    VisualTab:Toggle({Title="Player ESP", Value=false, Callback=function(v) 
        espEnabled = v 
        if espEnabled then espConnection = RunService.RenderStepped:Connect(updateESP) 
        else if espConnection then espConnection:Disconnect(); espConnection=nil end; clearESP() end 
    end}) 
    
    local antiFallConn 
    ProteksiTab:Toggle({ 
        Title = "Anti Fall Damage", Value = false, 
        Callback = function(v) 
            if antiFallConn then antiFallConn:Disconnect(); antiFallConn=nil end 
            if v then 
                antiFallConn = RunService.Heartbeat:Connect(function() 
                    if humanoid and rootPart and humanoid:GetState() == Enum.HumanoidStateType.Freefall and rootPart.Velocity.Y < -50 then 
                        humanoid:ChangeState(Enum.HumanoidStateType.PlatformStanding); rootPart.Velocity = Vector3.new(rootPart.Velocity.X, -5, rootPart.Velocity.Z) 
                    end 
                end) 
            end 
        end 
    }) 

    if _G.kVip or _G.sVip or _G.gVip then
        local edgeJumpEnabled, edgeConn, canEdgeJump, edgeCooldown, lastEdgeJump = false, nil, true, 0.3, 0
        ProteksiTab:Toggle({
            Title = "Edge Jump (VIP Tier)", Value = false,
            Callback = function(v)
                edgeJumpEnabled = v
                if edgeConn then edgeConn:Disconnect(); edgeConn = nil end
                if edgeJumpEnabled then
                    edgeConn = RunService.Heartbeat:Connect(function()
                        if humanoid and rootPart then
                            if humanoid.FloorMaterial ~= Enum.Material.Air then canEdgeJump = true end
                            if humanoid.FloorMaterial == Enum.Material.Air and canEdgeJump and (tick() - lastEdgeJump) >= edgeCooldown and humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
                                local params = RaycastParams.new(); params.FilterDescendantsInstances = {LocalPlayer.Character}; params.FilterType = Enum.RaycastFilterType.Blacklist
                                if not workspace:Raycast(rootPart.Position + (rootPart.CFrame.LookVector * 2), Vector3.new(0, -6, 0), params) then
                                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping); canEdgeJump = false; lastEdgeJump = tick()
                                end
                            end
                        end
                    end)
                end
            end
        })
        ProteksiTab:Slider({ Title = "Edge Jump Cooldown", Min = 0, Max = 5, Value = 0.3, Callback = function(val) edgeCooldown = val end })
        
        local antiAFKConn; local antiAFKEnabled = false; local lastPing = tick()
        local function startAntiAFK()
            if antiAFKConn then antiAFKConn:Disconnect() end
            antiAFKConn = RunService.Heartbeat:Connect(function()
                if tick() - lastPing >= 120 then
                    lastPing = tick()
                    pcall(function() VirtualUser:CaptureController(); VirtualUser:ClickButton2(Vector2.new()) end)
                    pcall(function() workspace.CurrentCamera.CFrame *= CFrame.Angles(0, math.rad(0.25), 0) end)
                end
            end)
            notify("Anti Idle", "Anti AFK Ultimate aktif (PC & Mobile) — no conflict AutoWalk", 4)
        end
        local function stopAntiAFK()
            if antiAFKConn then antiAFKConn:Disconnect(); antiAFKConn = nil end
            notify("Anti Idle", "Anti AFK dimatikan. Rejoin jika mau reset penuh.", 4)
        end
        ProteksiTab:Toggle({
            Title = "Anti AFK Ultimate (VIP Tier)", Value = false,
            Callback = function(v)
                antiAFKEnabled = v
                if antiAFKEnabled then startAntiAFK() else stopAntiAFK() end
            end
        })
    end

    ProteksiTab:Toggle({Title="Auto Heal (God Mode)", Value=false, Callback=function(v) 
        isAutoHealToggledOn = v; if not v then deactivateAutoHeal() end 
    end}) 
    
    TrollTab:Toggle({
        Title = "God Mode (Humanoid)",
        Value = false,
        Callback = function(v)
            if v then
                local success, err = pcall(function()
                    local Cam = workspace.CurrentCamera
                    local char = LocalPlayer.Character
                    if not char then return end
                    local Pos = char.HumanoidRootPart.CFrame
                    local Human = char:FindFirstChildWhichIsA("Humanoid")
                    if not Human then return end
                    
                    local nHuman = Human:Clone()
                    nHuman.Parent = char
                    LocalPlayer.Character = nil
                    
                    nHuman:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                    nHuman:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                    
                    nHuman.BreakJointsOnDeath = true
                    Human:Destroy()
                    LocalPlayer.Character = char
                    
                    Cam.CameraSubject = nHuman
                    Cam.CFrame = task.wait() and Pos
                    nHuman.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                    
                    local Script = char:FindFirstChild("Animate")
                    if Script then
                        Script.Disabled = true
                        task.wait()
                        Script.Disabled = false
                    end
                    nHuman.Health = nHuman.MaxHealth
                    notify("God Mode", "God Mode Diaktifkan.", 3)
                end)
                if not success then
                    notify("God Mode", "Gagal mengaktifkan: " .. tostring(err), 5)
                end
            else
                notify("God Mode", "God Mode Dinonaktifkan. Mereset karakter...", 3)
                task.wait(0.5)
                local char = LocalPlayer.Character
                if char and char:FindFirstChildOfClass("Humanoid") then
                    char.Humanoid.Health = 0
                end
            end
        end
    })

    TrollTab:Toggle({
        Title = "Vehicle Fly",
        Value = false,
        Callback = function(v)
            if v then
                startVehicleFly()
            else
                stopVehicleFly()
            end
        end
    })
    TrollTab:Slider({
        Title = "Vehicle Fly Speed",
        Min = 1, Max = 500, Value = 50,
        Callback = function(val)
            vehicleFlySpeed = val
        end
    })

    MiscTab:Button({Title = "Rejoin Server", Callback = function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end}) 
    
    MiscTab:Button({
        Title = "Create Private Server",
        Callback = function()
            local success, err = pcall(function()
                loadstring(game:HttpGet("https://gist.githubusercontent.com/Tesker-103/ed48b3ae8120b0c040584b661cbda063/raw/210408b3f107dc740a4c9b832bfa647f92aa25d1/FreePrivateServerGUI"))()
            end)
            if not success then
                notify("Error", "Gagal memuat skrip: " .. tostring(err), 5)
            end
        end
    })
    
    if _G.kVip or _G.sVip or _G.gVip then
        local antiLagEnabled = false
        local originalSettings = {}
        local antiLagDescendantConnection

        local function applyAntiLag(state)
            local Terrain = workspace:FindFirstChildOfClass('Terrain')
            
            if state then
                originalSettings.waterWaveSize = Terrain.WaterWaveSize
                originalSettings.waterWaveSpeed = Terrain.WaterWaveSpeed
                originalSettings.waterReflectance = Terrain.WaterReflectance
                originalSettings.waterTransparency = Terrain.WaterTransparency
                originalSettings.globalShadows = Lighting.GlobalShadows
                originalSettings.fogEnd = Lighting.FogEnd
                originalSettings.fogStart = Lighting.FogStart
                originalSettings.qualityLevel = settings().Rendering.QualityLevel

                Terrain.WaterWaveSize = 0
                Terrain.WaterWaveSpeed = 0
                Terrain.WaterReflectance = 0
                Terrain.WaterTransparency = 1
                Lighting.GlobalShadows = false
                Lighting.FogEnd = 9e9
                Lighting.FogStart = 9e9
                settings().Rendering.QualityLevel = 1

                for _, v in ipairs(game:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Material = Enum.Material.Plastic
                        v.Reflectance = 0
                    elseif v:IsA("Decal") then
                        v.Transparency = 1
                    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                        v.Lifetime = NumberRange.new(0)
                    end
                end
                for _, v in ipairs(Lighting:GetDescendants()) do
                    if v:IsA("PostEffect") then v.Enabled = false end
                end
                
                antiLagDescendantConnection = workspace.DescendantAdded:Connect(function(child)
                    task.spawn(function()
                        if child:IsA('ForceField') or child:IsA('Sparkles') or child:IsA('Smoke') or child:IsA('Fire') or child:IsA('Beam') then
                            task.wait()
                            child:Destroy()
                        end
                    end)
                end)
                notify("Anti Lag", "Fitur diaktifkan untuk meningkatkan FPS.", 4)
            else
                if next(originalSettings) then
                    Terrain.WaterWaveSize = originalSettings.waterWaveSize
                    Terrain.WaterWaveSpeed = originalSettings.waterWaveSpeed
                    Terrain.WaterReflectance = originalSettings.waterReflectance
                    Terrain.WaterTransparency = originalSettings.waterTransparency
                    Lighting.GlobalShadows = originalSettings.globalShadows
                    Lighting.FogEnd = originalSettings.fogEnd
                    Lighting.FogStart = originalSettings.fogStart
                    settings().Rendering.QualityLevel = originalSettings.qualityLevel
                    originalSettings = {}
                end

                if antiLagDescendantConnection then
                    antiLagDescendantConnection:Disconnect()
                    antiLagDescendantConnection = nil
                end
                notify("Anti Lag", "Fitur dimatikan. Rejoin untuk mereset grafis sepenuhnya.", 5)
            end
        end

        MiscTab:Toggle({
            Title = "Anti Lag (Boost FPS)",
            Value = antiLagEnabled,
            Callback = function(v)
                antiLagEnabled = v
                applyAntiLag(v)
            end
        })
    end
    
    if _G.gVip or _G.kVip or _G.sVip then
                do
            local Camera = workspace.CurrentCamera
            local isFreecamActive = false
            local freecamSpeed = 15
            
            local function CreateSpring(freq, damp)
                local s = { value = Vector3.new(), velocity = Vector3.new(), target = Vector3.new(), freq = freq, damp = damp }
                function s:Update(dt, newTarget)
                    self.target = newTarget
                    local f = self.freq * 2 * math.pi
                    local d = self.damp
                    local T = 1 / f
                    local k = 1 / (T*T)
                    local pd = d / (T*2)
                    local x = self.value
                    local v = self.velocity
                    local a = (self.target - x) * k - v * pd
                    self.velocity = v + a * dt
                    self.value = x + self.velocity * dt
                    return self.value
                end
                function s:Reset(val) self.value = val; self.velocity = self.value * 0; self.target = val end
                s:Reset(Vector3.new())
                return s
            end

            local velSpring = CreateSpring(4, 1)
            local panSpring = CreateSpring(4, 1)
            
            local cameraRot, cameraPos
            local originalState = {}
            
            local function StartFreecam()
                if isFreecamActive then return end
                isFreecamActive = true

                local char = LocalPlayer.Character
                local humanoid = char and char:FindFirstChildOfClass("Humanoid")

                originalState.cameraType = Camera.CameraType
                originalState.cameraSubject = Camera.CameraSubject
                originalState.cframe = Camera.CFrame
                
                if humanoid then
                    originalState.walkSpeed = humanoid.WalkSpeed
                    originalState.jumpPower = humanoid.JumpPower
                    humanoid.WalkSpeed = 0
                    humanoid.JumpPower = 0
                end
                
                Camera.CameraType = Enum.CameraType.Scriptable
                cameraPos = Camera.CFrame.Position
                
                local _, y, _ = Camera.CFrame:ToOrientation()
                cameraRot = Vector2.new(0, y)

                velSpring:Reset(Vector3.new())
                panSpring:Reset(Vector3.new())

                RunService:BindToRenderStep("EryxHubFreecam", Enum.RenderPriority.Camera.Value + 1, function(dt)
                    if not isFreecamActive then return end
                    
                    local panDelta = UserInputService:GetMouseDelta() * 0.25
                    cameraRot = cameraRot + Vector2.new(-math.rad(panDelta.Y), -math.rad(panDelta.X))
                    cameraRot = Vector2.new(math.clamp(cameraRot.X, -math.pi/2, math.pi/2), cameraRot.Y)
                    
                    local camCFrame = CFrame.fromOrientation(cameraRot.X, cameraRot.Y, 0)

                    local worldMoveVec = Vector3.new()
                    if IsMobile then
                        local dir = require(LocalPlayer.PlayerScripts.PlayerModule.ControlModule):GetMoveVector()
                        worldMoveVec = (camCFrame.LookVector * -dir.Z) + (camCFrame.RightVector * dir.X)
                    else
                        local localMoveVec = Vector3.new(
                            (UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.A) and 1 or 0),
                            0,
                            (UserInputService:IsKeyDown(Enum.KeyCode.S) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.W) and 1 or 0)
                        )
                        worldMoveVec = camCFrame:VectorToWorldSpace(localMoveVec)
                    end

                    local verticalMove = (UserInputService:IsKeyDown(Enum.KeyCode.E) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.Q) and 1 or 0)
                    worldMoveVec += Vector3.new(0, verticalMove, 0)
                    
                    velSpring:Update(dt, worldMoveVec * freecamSpeed)
                    cameraPos = cameraPos + velSpring.value * dt

                    Camera.CFrame = CFrame.new(cameraPos) * camCFrame
                end)
                notify("Freecam", "Freecam (VIP) diaktifkan.", 3)
            end

            local function StopFreecam()
                if not isFreecamActive then return end
                isFreecamActive = false
                RunService:UnbindFromRenderStep("EryxHubFreecam")
                
                local char = LocalPlayer.Character
                local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                if humanoid and originalState.walkSpeed then
                    humanoid.WalkSpeed = originalState.walkSpeed
                    humanoid.JumpPower = originalState.jumpPower
                end
                
                if originalState.cameraType then
                    Camera.CameraType = originalState.cameraType
                    Camera.CFrame = originalState.cframe
                    Camera.CameraSubject = originalState.cameraSubject
                end
                notify("Freecam", "Freecam dinonaktifkan.", 3)
            end

            MiscTab:Toggle({
                Title = "Freecam (VIP)",
                Value = false,
                Callback = function(v)
                    if v then
                        StartFreecam()
                    else
                        StopFreecam()
                    end
                end
            })

            MiscTab:Slider({
                Title = "Freecam Speed (VIP)",
                Min = 1, Max = 100, Value = 15,
                Callback = function(val)
                    freecamSpeed = val
                end
            })
        end
    end

    SocialTab:Button({Title = "Join Discord", Callback = function() setclipboard("https://discord.gg/eryxhub"); notify("Copied","Discord link copied.",3) end}) 
    SocialTab:Button({Title = "Subscribe YouTube", Callback = function() setclipboard("https://youtube.com/@eryxaryxa"); notify("Copied","YouTube link copied.",3) end}) 
    
    Window:Notify({Title = "Eryx Hub", Desc = "Loaded successfully!", Time = 4}) 
    LocalPlayer.CharacterAdded:Connect(function() 
        respawned = true 
        stopLuauMountWalk() 
    end) 
end 

local function verifyKey(keyToVerify, keyWindow) 
    local success, result = pcall(function() return game:HttpGet("https://pastefy.app/4SZHP2tX/raw") end) 
    if success and result then 
        local correctKey = result:match("^%s*(.-)%s*$") 
        local userInput = keyToVerify:match("^%s*(.-)%s*$") 
        if userInput == correctKey then 
            if keyWindow then keyWindow:Notify({Title = "Success", Desc = "Key Benar! Memuat Hub...", Time = 4}) end 
            if writefile then writefile(KEY_FILENAME, userInput) end 
            task.wait(1) 
            if keyWindow then keyWindow.Enabled = false end 
            CreateMainWindow() 
            return true 
        end 
    else 
        if keyWindow then keyWindow:Notify({Title = "Error", Desc = "Tidak bisa mengambil key dari server.", Time = 4}) end 
    end 
    return false 
end 

local function showKeyWindow() 
    local KeyWindow = Library:Window({ Title = "Eryx Super Hub | Key System", Desc = "-just some keys-", Icon = 105059922903197, Theme = "Dark", Config = { Keybind = Enum.KeyCode.RightControl, Size = UDim2.new(0, 400, 0, 250) }, CloseUIButton = { Enabled = true, Text = "Eryx" } }) 
    local KeyTab = KeyWindow:Tab({Title = "Verification", Icon = "lock"}) 
    local KeyInput 
    KeyTab:Textbox({ Title = "Masukkan Key:", Placeholder = "Your Key Here", Callback = function(text) KeyInput = text end }) 
    KeyTab:Button({ 
        Title = "Submit Key", 
        Callback = function() 
            if not KeyInput or KeyInput == "" then KeyWindow:Notify({Title="Error", Desc="Key tidak boleh kosong!", Time=3}); return end 
            if not verifyKey(KeyInput, KeyWindow) then KeyWindow:Notify({Title="Gagal", Desc="Key Salah! Coba lagi.", Time=3}) end 
        end 
    }) 
    KeyTab:Button({ 
        Title = "Get Key", 
        Callback = function() 
            local link = "https://sfl.gl/NEBknYD" 
            if setclipboard then setclipboard(link); KeyWindow:Notify({Title = " Key System", Desc = "Link sudah disalin! Paste di browser.", Time = 5}) 
            else KeyWindow:Notify({Title = " Key System", Desc = "Buka link ini: " .. link, Time = 8}) end 
        end 
    }) 
    KeyTab:Label({Text = "Note: youtube.com/@eryxaryxa"}) 
end 

if isfile and isfile(KEY_FILENAME) and readfile then 
    local savedKey = readfile(KEY_FILENAME) 
    print("Mencoba verifikasi key yang tersimpan...") 
    if verifyKey(savedKey, nil) then
    Library:Notify({Title="Welcome Back!", Desc="Key tersimpan valid! Memuat Hub...", Time=4}) 
    else 
        print("Key tersimpan tidak valid. Menampilkan jendela key.") 
        showKeyWindow() 
    end 
else 
    print("Tidak ada key tersimpan. Menampilkan jendela key.") 
    showKeyWindow() 
end
