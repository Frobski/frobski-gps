ESX, mecano, radar, installing, tried, block = nil, nil, false, false, false, false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	for k, v in ipairs(Config.MecanoJobs) do 
		if ESX.PlayerData.job.name == v then
			mecano = true
		else
			mecano = false
		end
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
	for k, v in ipairs(Config.MecanoJobs) do 
		if ESX.PlayerData.job.name == v then
			mecano = true
			return
		else
			mecano = false
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local sleep = 500

		if not IsPedInAnyVehicle(PlayerPedId()) then
			DisplayRadar(false)
			gps = false
			tried = false
		else
			if gps then
				DisplayRadar(true)
			else
				for k, v in ipairs(Config.EmergencyVehicles) do
					if GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))) == v then
						gps = true 
					end
				end
			end
		end 
        
		if not tried and IsPedInAnyVehicle(PlayerPedId()) then
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
				
			ESX.TriggerServerCallback('frobski-gps:getGPS', function(data)
				if data == 'true' then
					gps = true
				    tried = true
				else
					tried = true
				end
			end, GetVehicleNumberPlateText(vehicle))
		end

		if block then
            sleep = 5
            DisableAllControlActions(0)
			DisableAllControlActions(1)
			DisableAllControlActions(2)
			DisableAllControlActions(3)
			DisableAllControlActions(4)
			DisableAllControlActions(5)
			DisableAllControlActions(6)
			DisableAllControlActions(7)
			DisableAllControlActions(8)
			DisableAllControlActions(9)
			DisableAllControlActions(10)
			DisableAllControlActions(11)
			DisableAllControlActions(12)
			DisableAllControlActions(13)
			DisableAllControlActions(14)
			DisableAllControlActions(15)
			DisableAllControlActions(16)
			DisableAllControlActions(17)
			DisableAllControlActions(18)
			DisableAllControlActions(19)
			DisableAllControlActions(20)
			DisableAllControlActions(21)
			DisableAllControlActions(22)
			DisableAllControlActions(23)
			DisableAllControlActions(24)
			DisableAllControlActions(25)
			DisableAllControlActions(26)
			DisableAllControlActions(27)
			DisableAllControlActions(28)
			DisableAllControlActions(29)
			DisableAllControlActions(30)
            DisableAllControlActions(31)
        end
		Citizen.Wait(sleep)
	end
end)

RegisterNetEvent('frobski-gps:InstallGps')
AddEventHandler('frobski-gps:InstallGps', function()
	if mecano then
		if IsPedInAnyVehicle(PlayerPedId()) and not installing then 
			if not gps then
				local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
				
				ESX.TriggerServerCallback('frobski-gps:getGPS', function(data)
					if data == 'false' then
						Notif('success', Config.Strings["installing"])
				        install()
					elseif data == 'true' then
						Notif('error', Config.Strings["alreadygps"])
					elseif data == 'notfind' then
						Notif('error', Config.Strings["notowned"])
					end
				end, GetVehicleNumberPlateText(vehicle))
		    else
				Notif('error', Config.Strings["alreadygps"])
			end
		else
			Notif('error', Config.Strings["notv"])
		end
	else
		Notif('error', Config.Strings["notmecano"])
	end
end)

install = function()
    local time = 0

	if not installing then
		repeat
			block = true
			local coords = GetEntityCoords(PlayerPedId())
			Wait(5)
	        Draw3DText(coords.x, coords.y, coords.z + 0.50, Config.Strings["installing"] ..' - ~y~'.. round(Config.Time - time, 2).. ' seconds left')
			time = time + 0.005
	    until(time >= Config.Time)
        
		block = false
		gps = true
		Notif('success', Config.Strings["installed"])
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		TriggerServerEvent('frobski-gps:Installed', GetVehicleNumberPlateText(vehicle))
	end
end