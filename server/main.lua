ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('gps', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('frobski-gps:InstallGps', source)
end)

ESX.RegisterServerCallback('frobski-gps:getGPS', function(source, cb, data)
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = data
	}, function(result)
        if result[1] ~= nil then
            cb(result[1].gps)
        else
            cb('notfind')
        end
	end)
end)

RegisterServerEvent('frobski-gps:Installed')
AddEventHandler('frobski-gps:Installed', function(plate)
    MySQL.Async.execute("UPDATE owned_vehicles SET gps=@gps WHERE plate=@plate", {
        ['@plate'] = plate, 
        ['@gps'] = 'true',
    })
end)