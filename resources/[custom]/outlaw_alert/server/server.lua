ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('outlaw_alert:carThiefInProgress')
AddEventHandler('outlaw_alert:infractionInProgress', function(ped)
	SendInfractionAlert(Config.Alerts.carthief, ped)
end)

RegisterServerEvent('outlaw_alert:streetFightInProgress')
AddEventHandler('outlaw_alert:streetFightInProgress', function(ped)
	SendInfractionAlert(Config.Alerts.streetfight, ped)
end)

RegisterServerEvent('outlaw_alert:carJackingInProgress')
AddEventHandler('outlaw_alert:carJackingInProgress', function(ped)
	SendInfractionAlert(Config.Alerts.carjacking, ped)
end)

RegisterServerEvent('outlaw_alert:gunShotInProgress')
AddEventHandler('outlaw_alert:gunShotInProgress', function(ped)
	SendInfractionAlert(Config.Alerts.gunshot, ped)
end)


function GetPedCoordAndStreets(ped)
	local pedPos = GetEntityCoords(ped,  true)
	local street1_hash, street2_hash = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, pedPos.x, pedPos.y, pedPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
	local street1 = GetStreetNameFromHashKey(street1_hash)
	local street2 = GetStreetNameFromHashKey(street2_hash)

	return pedPos, street1, street2
end

function SendInfractionAlert(alert, ped)

	local gps, street1, street2 = GetPedCoordAndStreets(ped)

	TriggerEvent('outlaw_alert:receiveAlert', type, gps, alert.duration, alert.ignorePolice)
end