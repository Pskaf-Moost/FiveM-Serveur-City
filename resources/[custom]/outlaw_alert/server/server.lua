ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('outlaw_alert:carThiefInProgress')
AddEventHandler('outlaw_alert:infractionInProgress', function( playerId, playerpos)
	SendInfractionAlert(Config.Alerts.carthief, playerId, playerpos)
end)

RegisterServerEvent('outlaw_alert:streetFightInProgress')
AddEventHandler('outlaw_alert:streetFightInProgress', function( playerId, playerpos)
	SendInfractionAlert(Config.Alerts.streetfight, playerId, playerpos)
end)

RegisterServerEvent('outlaw_alert:carJackingInProgress')
AddEventHandler('outlaw_alert:carJackingInProgress', function( playerId, playerpos)
	SendInfractionAlert(Config.Alerts.carjacking, playerId, playerpos)
end)

RegisterServerEvent('outlaw_alert:gunShotInProgress')
AddEventHandler('outlaw_alert:gunShotInProgress', function( playerId, playerpos)
	SendInfractionAlert(Config.Alerts.gunshot, playerId, playerpos)
end)


function GetPolicePlayers()
	local cops = {}
	local players_id = ESX.GetPlayers()

	for i,id in ipairs(players_id)do

		local player = ESX.GetPlayerFromId(id)
	
		if player.job.name == 'police' then
			table.insert(cops, player)
		end
	end

	return cops
end

function SendInfractionAlert(alert, playerId, playerpos)
	
	if not alert.active then
		return
	end

	local player = ESX.GetPlayerFromId(playerId)

	if alert.ignorePolice and player.job.name == 'police' then
		return
	end

	local cops = GetPolicePlayers()

	for i, cop in ipairs(cops) do 
		cop.triggerEvent('outlaw_alert:receiveAlert', alert.label, playerpos, alert.duration, alert.ignorePolice)
	end
end 