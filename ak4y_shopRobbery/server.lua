Config = {}
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local ownedShopsActivated = false -- True: If you are using esx-kr-advancedshops, you can open it according to your preference
local moneyIsItem = false -- True: If your money is item -- False: If your money is not item
local moneyItemName = "cash" -- You can write the name of your money

local hard_rob_cd = 5 -- !!HARD SAFE!! How many minutes after the robbery can the safe be robbed again
local basic_rob_cd = 5 -- !!Mini Safe!! How many minutes after the robbery can the safe be robbed again

Config.Alert = {
	hard_gerekli_polis = 0, -- Number of police required for the hard safe
	basic_gerekli_polis = 0 -- Number of police required for the small safe
}

Config.Text = {
	["hard_soygun_basla"] = "[E] Rob",
	["basic_soygun_basla"] = "[E] Lockpick",
}
        
Config.Marketler = {
	[1] = {
		hard_kasa = {x = 378.19,   y = 333.67,  z = 103.17},
		basic_kasa = {x = 373.39,   y = 328.63,  z = 103.47},
		hard_kasa_pozisyon = {x = 378.2,   y = 333.44,  z = 102.57},
		hard_kasa_heading = 340.0,
		hard_soyuluyorMu = false, -- Do not change! -- Do not change!
		basic_soyuluyorMu = false, -- Do not change! -- Do not change!
		hard_zaman = 0, -- Do not change! -- Do not change!
		basic_zaman = 0, -- Do not change! -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E
	},
	[2] = {
		hard_kasa = {x = 2548.92,   y = 384.89,  z = 108.22},
		basic_kasa = {x = 2554.85,   y = 381.15,  z = 108.42},
        hard_kasa_pozisyon = {x = 2549.22,   y = 384.91,  z = 107.72},
		hard_kasa_heading = 89.58,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[3] = {
		hard_kasa = {x = -3048.18,   y = 585.5,  z = 7.57},
		basic_kasa = {x = -3041.3,   y = 584.08,  z = 7.67},
        hard_kasa_pozisyon = {x = -3047.88,   y = 585.6,  z = 6.91},
        hard_kasa_heading = 108.76,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E	
	},
	[4] = {
		hard_kasa = {x = -1478.7,   y = -375.7,  z = 38.86},
		basic_kasa = {x = -1486.55,   y = -378.30,  z = 39.87},
        hard_kasa_pozisyon = {x = -1479.2,   y = -375.2,  z = 38.16},
        hard_kasa_heading = 224.8,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E	
	},
	[5] = {
		hard_kasa = {x = 1394.89,   y = 3614.21,  z = 34.77},
		basic_kasa = {x = 1393.0,   y = 3606.2,  z = 34.77},
        hard_kasa_pozisyon = {x = 1395.09,   y = 3613.66,  z = 33.98},
        hard_kasa_heading = 25.58,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[6] = {
		hard_kasa = {x = -2959.63,   y = 386.85,  z = 13.77},
		basic_kasa = {x = -2966.84,   y = 390.88,  z = 14.77},
        hard_kasa_pozisyon = {x = -2959.62,   y = 387.35,  z = 13.04},
        hard_kasa_heading = 178.71,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[7] = {
		hard_kasa = {x = 2672.52,   y = 3286.75,  z = 54.97},
		basic_kasa = {x = 2676.1,   y = 3280.70,  z = 54.97},
        hard_kasa_pozisyon = {x = 2672.73,   y = 3286.68,  z = 54.24},
        hard_kasa_heading = 62.25,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change! 
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[8] = {
		hard_kasa = {x = -43.6,   y = -1748.19,  z = 29.12},
		basic_kasa = {x = -47.0,   y = -1757.80,  z = 29.17},
        hard_kasa_pozisyon = {x = -43.27,   y = -1748.4,  z = 28.42},
        hard_kasa_heading = 48.0,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[9] = {
		hard_kasa = {x = 1159.29,   y = -314.04,  z = 68.91},
		basic_kasa = {x = 1164.57,   y = -322.84,  z = 68.99},
        hard_kasa_pozisyon = {x = 1159.69,   y = -313.94,  z = 68.21},
        hard_kasa_heading = 98.37,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[10] = {
		hard_kasa = {x = -709.99,   y = -904.15,  z = 18.92},
		basic_kasa = {x = -706.36,   y = -913.71,  z = 18.99},
        hard_kasa_pozisyon = {x = -709.64,   y = -904.05,  z = 18.22},
        hard_kasa_heading = 88.8,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[11] = {
		hard_kasa = {x = 1708.08,   y = 4920.74,  z = 41.76},
		basic_kasa = {x = 1698.12,   y = 4923.10,  z = 41.86},
        hard_kasa_pozisyon = {x = 1707.89,   y = 4920.34,  z = 41.06},
        hard_kasa_heading = 340.0,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[12] = {
		hard_kasa = {x = 1959.10,   y = 3749.1,  z = 32.04},
		basic_kasa = {x = 1959.05,   y = 3742.12,  z = 32.14},
        hard_kasa_pozisyon = {x = 1959.27,   y = 3748.98,  z = 31.34},
        hard_kasa_heading = 29.37,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[13] = {
		hard_kasa = {x = 1126.80,   y = -979.95,  z = 45.12},
		basic_kasa = {x = 1134.38,   y = -982.43,  z = 46.22},
        hard_kasa_pozisyon = {x = 1126.89,   y = -980.4,  z = 44.42},
        hard_kasa_heading = 9.52,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[14] = {
		hard_kasa = {x = 28.20,   y = -1338.95,  z = 29.3},
		basic_kasa = {x = 24.7,   y = -1344.96,  z = 29.35},
        hard_kasa_pozisyon = {x = 28.28,   y = -1339.18,  z = 28.5},
        hard_kasa_heading = 4.80,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[15] = {
		hard_kasa = {x = 546.47,   y = 2662.54,  z = 41.96},
		basic_kasa = {x = 549.15,   y = 2669.0,  z = 42.0},
        hard_kasa_pozisyon = {x = 546.4,   y = 2662.74,  z = 41.16},
        hard_kasa_heading = 186.35,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[16] = {
		hard_kasa = {x = 1169.53,   y = 2717.81,  z = 36.96},
		basic_kasa = {x = 1165.97,   y = 2710.57,  z = 38.0},
        hard_kasa_pozisyon = {x = 1169.03,   y = 2717.81,  z = 36.16},
        hard_kasa_heading = 269.43,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[17] = {
		hard_kasa = {x = -1829.34,   y = 798.6,  z = 138.0},
		basic_kasa = {x = -1820.23,   y = 794.05,  z = 137.95},
        hard_kasa_pozisyon = {x = -1829.29,   y = 798.81,  z = 137.19},
        hard_kasa_heading = 133.74,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[18] = {
		hard_kasa = {x = 1734.90,   y = 6421.1,  z = 34.84},
		basic_kasa = {x = 1729.05,   y = 6417.24,  z = 34.84},
        hard_kasa_pozisyon = {x = 1734.79,   y = 6420.76,  z = 34.04},
        hard_kasa_heading = 331.16,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	},
	[19] = {
		hard_kasa = {x = -3250.39,   y = 1004.44,  z = 12.53},
		basic_kasa = {x = -3244.6,   y = 1000.35,  z = 12.63},
        hard_kasa_pozisyon = {x = -3250.09,   y = 1004.44,  z = 11.83},
        hard_kasa_heading = 85.40,
		hard_soyuluyorMu = false, -- Do not change!
		basic_soyuluyorMu = false, -- Do not change!
		hard_zaman = 0, -- Do not change!   
		basic_zaman = 0, -- Do not change!
		hard_kasa_sure = 1 * 60000,  -- !!HARD SAFE!! Initial progressbar time after pressing E
		basic_kasa_sure = 1 * 60000	 -- !!Mini Safe!! Initial progressbar time after pressing E		
	}
}

RegisterServerEvent('ak4y_shopRobbery:getConfig')
AddEventHandler('ak4y_shopRobbery:getConfig', function()
	TriggerClientEvent("ak4y_shopRobbery:sendConfig", source, Config)
end)

-- ! HARD SAFE
RegisterServerEvent('ak4y_shopRobbery:Soyuluyor')
AddEventHandler('ak4y_shopRobbery:Soyuluyor', function(deger,  market)
	Config.Marketler[market].hard_soyuluyorMu = deger
	Config.Marketler[market].hard_zaman = GetGameTimer()
end)

ESX.RegisterServerCallback("ak4y_shopRobbery:marketKontrol", function(source, cb, market)
	if GetGameTimer() - Config.Marketler[market].hard_zaman > hard_rob_cd * 60000 then
		Config.Marketler[market].hard_soyuluyorMu = false
		Citizen.Wait(50)
		cb(Config.Marketler[market].hard_soyuluyorMu)
	else 
		cb(true)
	end
end)

-- ! MINI SAFE
RegisterServerEvent('ak4y_shopRobbery:basicSoyuluyor')
AddEventHandler('ak4y_shopRobbery:basicSoyuluyor', function(deger,  market)
		Config.Marketler[market].basic_soyuluyorMu = deger
		Config.Marketler[market].basic_zaman = GetGameTimer()
end)

ESX.RegisterServerCallback("ak4y_shopRobbery:basicMarketKontrol", function(source, cb, market)
	if GetGameTimer() - Config.Marketler[market].basic_zaman > basic_rob_cd * 60000 then
		Config.Marketler[market].basic_soyuluyorMu = false
		Citizen.Wait(50)
		cb(Config.Marketler[market].basic_soyuluyorMu)
	else 
		cb(Config.Marketler[market].basic_soyuluyorMu)
	end
end)

--! REWARDS
RegisterServerEvent('ak4y_shopRobbery:hard_case_odul')
AddEventHandler('ak4y_shopRobbery:hard_case_odul', function(marketNo)
	local hard_case_odul = math.random(10000, 20000) -- money Random from 10000 - 20000
	local kasadakiPara
	local sahip
	local xPlayer = ESX.GetPlayerFromId(source)
	if moneyIsItem then
		xPlayer.addInventoryItem(moneyItemName, hard_case_odul)
	else
		xPlayer.addMoney(hard_case_odul)
	end
	if ownedShopsActivated then
		MySQL.Async.fetchAll("SELECT * FROM owned_shops WHERE ShopNumber = @ShopNumber ", {['@ShopNumber'] = marketNo}, function(result)
			kasadakiPara = result[1].money
			sahip = result[1].identifier
		end)
		Citizen.Wait(700)
		if sahip == "123123" then return end
		Citizen.Wait(200)
		MySQL.Async.execute(
			"UPDATE owned_shops SET money = @yeniDeger WHERE ShopNumber = @ShopNumber",
			{
				['@ShopNumber'] = marketNo,
				['@yeniDeger'] = math.floor(kasadakiPara * 75/100)
			}
		)
	end
end)

RegisterServerEvent('ak4y_shopRobbery:basic_case_odul')
AddEventHandler('ak4y_shopRobbery:basic_case_odul', function(marketNo)
	local basic_case_odul = math.random(750, 2000) 
	local kasadakiPara
	local sahip
	local xPlayer = ESX.GetPlayerFromId(source)
	if moneyIsItem then
		xPlayer.addInventoryItem(moneyItemName, basic_case_odul)
	else
		xPlayer.addMoney(basic_case_odul)
	end
	if ownedShopsActivated then
		MySQL.Async.fetchAll("SELECT * FROM owned_shops WHERE ShopNumber = @ShopNumber ", {['@ShopNumber'] = marketNo}, function(result)
			kasadakiPara = result[1].money
			sahip = result[1].identifier
		end)
		Citizen.Wait(700)
		if sahip == "123123" then return end
		Citizen.Wait(200)
		MySQL.Async.execute(
			"UPDATE owned_shops SET money = @yeniDeger WHERE ShopNumber = @ShopNumber",
			{
				['@ShopNumber'] = marketNo,
				['@yeniDeger'] = math.floor(kasadakiPara * 98/100)
			}
		)
	end
end)

RegisterServerEvent('ak4y_shopRobbery:esyaSil')
AddEventHandler('ak4y_shopRobbery:esyaSil', function(item)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, 1)
end)

ESX.RegisterServerCallback('ak4y_base:aktif-polis-sayisi', function(source, cb, playerId)
	PoliceConnected = 0
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			PoliceConnected = PoliceConnected + 1
		end	
	end
	cb(PoliceConnected)
end)

ESX.RegisterServerCallback('ak4y_base:item-kontrol', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return; end
    local items = xPlayer.getInventoryItem(item)
    cb(items.count)
end)
