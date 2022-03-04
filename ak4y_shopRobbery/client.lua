ESX = nil
Config = nil
local soyulan_market_no = nil
local performansCd = 1000

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5)
	end
end)

Citizen.CreateThread(function()
	while Config == nil do
		TriggerServerEvent('ak4y_shopRobbery:getConfig')
		Citizen.Wait(5)
	end
end)

function DrawText3D(x,y,z, text, boyut)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / boyut
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 140)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(performansCd)
		local performans = false
		if Config then
			for k,v in pairs(Config.Marketler) do
				if GetDistanceBetweenCoords(v.hard_kasa.x,v.hard_kasa.y,v.hard_kasa.z, GetEntityCoords(PlayerPedId())) <= 1 then	
					performans = true			
					DrawText3D(v.hard_kasa.x, v.hard_kasa.y, v.hard_kasa.z + 0.1, Config.Text["hard_soygun_basla"], 270)
						if IsControlJustPressed(0, 38) then
							ESX.TriggerServerCallback('ak4y_base:aktif-polis-sayisi', function(AktifPolis)
								if AktifPolis >= Config.Alert.hard_gerekli_polis then
									Citizen.Wait(math.random(1, 1000))
									ESX.TriggerServerCallback('ak4y_shopRobbery:marketKontrol', function(durum)
										Citizen.Wait(10)
										if durum then															
											ESX.ShowNotification("This case has already robbed.")
											return;
										else	
											soyulan_market_no = k												
											
											TriggerServerEvent("ak4y_shopRobbery:Soyuluyor", true, k)
											SetEntityCoords(PlayerPedId(), v.hard_kasa_pozisyon.x, v.hard_kasa_pozisyon.y, v.hard_kasa_pozisyon.z)
											SetEntityHeading(PlayerPedId(), v.hard_kasa_heading)
											exports['mythic_progbar']:Progress({
												name = "kasa_del",
												duration = v.hard_kasa_sure,
												label = 'You are digging the safe.. [Cancel DEL]',
												useWhileDead = false,
												canCancel = true, 
												controlDisables = {
													disableMovement = true,
													disableCarMovement = true,
													disableMouse = false,
													disableCombat = true,
												},
												animation = {
													animDict = "mini@repair",
													anim = "fixing_a_player",
																flags = 49,
												},
											},
											function(cancelled)
												if not cancelled then
													RequestAnimSet( "move_ped_crouched" )
													while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
														Citizen.Wait( 100 )
													end 
													
													SetPedMovementClipset( GetPlayerPed( -1 ), "move_ped_crouched", 0.25 )
													toggleField(true)
												else
													soyulan_market_no = nil
													ESX.ShowNotification("Failed Robbery.")
													TriggerServerEvent("ak4y_shopRobbery:Soyuluyor", false, k)
												end
											end)
										end
									end, k)
								else
									ESX.ShowNotification("Not Enough Police.")
								end
							end)
						end
					end

				if GetDistanceBetweenCoords(v.basic_kasa.x,v.basic_kasa.y,v.basic_kasa.z, GetEntityCoords(PlayerPedId())) <= 1 then
					DrawText3D(v.basic_kasa.x, v.basic_kasa.y, v.basic_kasa.z + 0.3, Config.Text["basic_soygun_basla"], 220)
					performans = true
					if IsControlJustReleased(0, 38) then
						ESX.TriggerServerCallback('ak4y_base:aktif-polis-sayisi', function(AktifPolis)
							if AktifPolis >= Config.Alert.basic_gerekli_polis then							
								ESX.TriggerServerCallback('ak4y_base:item-kontrol', function(qtty)
									if qtty > 0 then
										Citizen.Wait(math.random(1, 1000))
										ESX.TriggerServerCallback('ak4y_shopRobbery:basicMarketKontrol', function(durum)
											Citizen.Wait(10)
											if durum then
												ESX.ShowNotification("This case has already robbed.")
												return;
											else
												
												TriggerServerEvent("ak4y_shopRobbery:basicSoyuluyor", true, k)
												TriggerServerEvent("ak4y_shopRobbery:esyaSil", "lockpick")	
												exports['mythic_progbar']:Progress({
													name = "kasa_maymuncukla",
													duration = v.basic_kasa_sure,
													label = 'You are digging the safe.. [Cancel DEL]',
													useWhileDead = false,
													canCancel = true, 
													controlDisables = {
														disableMovement = true,
														disableCarMovement = true,
														disableMouse = false,
														disableCombat = true,
													},
													animation = {
														animDict = "mini@repair",
														anim = "fixing_a_player",
														flags = 49,
													},
												},
												function(cancelled)
													if not cancelled then
														ESX.ShowNotification("Successful.")
														TriggerServerEvent("ak4y_shopRobbery:basic_case_odul", k)																				
													else
														TriggerServerEvent("ak4y_shopRobbery:basicSoyuluyor", false, k)
													end
												end)
											end
										end, k)
									else
										ESX.ShowNotification("you don't have a lockpick.")
									end
								end, "lockpick")
							else
								ESX.ShowNotification("Not Enough Police.")
							end
						end)
					end
				end
				if not performans then
					performansCd = 1000
				end
				if performans then
					performansCd = 5
				end
			end
		end
	end
end)

RegisterNetEvent("ak4y_shopRobbery:sendConfig")
AddEventHandler("ak4y_shopRobbery:sendConfig", function(cfg)
	Config = cfg
end)

function toggleField(enable)
  SetNuiFocus(enable, enable)
  SendNUIMessage({
    type = "enableui",
    enable = enable
  })
end

RegisterNUICallback('basarisiz', function(data, cb)
    toggleField(false)
    SetNuiFocus(false, false)
    ESX.ShowNotification("Heist Canceled")
    cb('ok')
end)

RegisterNUICallback('kasaKirildi', function(data, cb)
    toggleField(false)
    SetNuiFocus(false, false)
    ESX.ShowNotification("You have made too many unsuccessful attempts")
    cb('ok')
end)

RegisterNUICallback('basarili', function(data, cb)
    SetNuiFocus(false, false)
	toggleField(false)
	Citizen.Wait(100)
	ESX.ShowNotification("Password is correct!")
		exports['mythic_progbar']:Progress({
			name = "kasa_maymuncukla",
			duration = 4000,
			label = 'You take the money...',
			useWhileDead = false,
			canCancel = false, 
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			},
			animation = {
				animDict = "mini@repair",
				anim = "fixing_a_player",
				flags = 49,
			},
		},
		function(cancelled)
			TriggerServerEvent("ak4y_shopRobbery:hard_case_odul", soyulan_market_no)
			Citizen.Wait(150)
			soyulan_market_no = nil
		end)
    cb('ok')
end)

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	toggleField(false)
end)
