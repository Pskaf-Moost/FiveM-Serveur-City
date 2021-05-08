ESX = nil
local PlayerArrested, PlayersinJail = {}, 0

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent( "esx_extendedjail:suggestions" )
AddEventHandler( "esx_extendedjail:suggestions", function()
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.job.name == Config.Job or xPlayer.getGroup() == Config.AdminTitle then
			TriggerClientEvent("esx_extendedjail:suggestions", source)
		end
	end
end)

RegisterCommand("jail", function(source, args)
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.job.name == Config.Job or xPlayer.getGroup() == Config.AdminTitle then
			if args[1] and args[2] then
				local xPlayerTarget = ESX.GetPlayerFromId(args[1])
				if GetPlayerName(args[1]) ~= nil then
					JailPlayer(xPlayerTarget.playerId, args[2], { jail = 'prison', type = 'first', time = args[2]}, xPlayer)
				else
					xPlayer.triggerEvent('chatMessage', "[ JAIL ]" , {255, 255, 255}, _U('error_noplayer'))
				end
			else
				xPlayer.triggerEvent('chatMessage', "[ JAIL ]" , {255, 255, 255}, _U('error'))
			end
		end
	end
end)

RegisterCommand("pjail", function(source, args)
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.job.name == Config.Job or xPlayer.getGroup() == Config.AdminTitle then
			if args[1] and args[2] then
				local xPlayerTarget = ESX.GetPlayerFromId(args[1])
				if GetPlayerName(args[1]) ~= nil then
					JailPlayer(xPlayerTarget.playerId, args[2], { jail = 'pjail', type = 'first', time = args[2]}, xPlayer)
				else
					xPlayer.triggerEvent('chatMessage', "[ JAIL ]" , {255, 255, 255}, _U('error_noplayer'))
				end
			else
				xPlayer.triggerEvent('chatMessage', "[ JAIL ]" , {255, 255, 255}, _U('error'))
			end
		end
	end
end)

RegisterCommand("unjail", function(source, args)
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.job.name == Config.Job or xPlayer.getGroup() == Config.AdminTitle then
			if args[1] then
				local xPlayerTarget = ESX.GetPlayerFromId(args[1])
				if GetPlayerName(args[1]) ~= nil then
					UnJailPlayer(xPlayerTarget.playerId, xPlayer)
				else
					xPlayer.triggerEvent('chatMessage', "[ JAIL ]" , {255, 255, 255}, _U('error_noplayer'))
				end
			else
				xPlayer.triggerEvent('chatMessage', "[ JAIL ]" , {255, 255, 255}, _U('error'))
			end
		end
	end
end)


RegisterNetEvent("esx_extendedjail:jailplayer_server")
AddEventHandler( "esx_extendedjail:jailplayer_server", function(playeridss, timess, JailType)
	JailPlayer(playeridss, timess, { jail = JailType, type = 'first', time = timess})
end)

RegisterNetEvent("esx_extendedjail:unjail_server")
AddEventHandler( "esx_extendedjail:unjail_server", function(playerid_2)
	UnJailPlayer(playerid_2)
end)

RegisterNetEvent("esx_extendedjail:breakingOut")
AddEventHandler( "esx_extendedjail:breakingOut", function(playerid)
	BreakingOut(playerid)
end)

function BreakingOut(playerId)
	local jailinfo = {prison = 0, pjail = 0}
	local xPlayerTarget = ESX.GetPlayerFromId(playerId)
	if PlayerArrested[playerId] then
	
		MySQL.Async.execute('UPDATE users SET arrested_time = @arrested_time WHERE identifier = @identifier', {		
			['@identifier'] = xPlayerTarget.identifier,
			['@arrested_time'] = json.encode(jailinfo)
		}, function(rowsChanged)
			for playerId,player in pairs(PlayerArrested) do
				if player.JailType == 'prison' then PlayersinJail = PlayersinJail - 1 end
			end
			PlayerArrested[playerId] = nil
		end)	
	end
end


RegisterNetEvent("esx_extendedjail:alarm_server")
AddEventHandler( "esx_extendedjail:alarm_server", function(data, notification)
	TriggerClientEvent('esx_extendedjail:StartAlarm', -1, data)

	if notification then
		local Players = ESX.GetPlayers()

		for i = 1, #Players do
			local xPlayer = ESX.GetPlayerFromId(Players[i])

			if xPlayer.job.name == Config.Job then
				xPlayer.triggerEvent('esx_extendedjail:AlertCops')
			end
		end
	end
end)

RegisterNetEvent("esx_extendedjail:alarm_remove")
AddEventHandler( "esx_extendedjail:alarm_remove", function()
		local Players = ESX.GetPlayers()

		for i = 1, #Players do
			local xPlayer = ESX.GetPlayerFromId(Players[i])

			if xPlayer.job.name == Config.Job then
				xPlayer.triggerEvent('esx_extendedjail:killBlip')
			end
		end
end)


RegisterNetEvent("esx_extendedjail:webhook")
AddEventHandler( "esx_extendedjail:webhook", function(playerid)
	local xPlayer = ESX.GetPlayerFromId(playerid)
	Webhook("2061822", _U('alert'), _U('player_tried_escape', GetPlayerName(playerid), xPlayer.getIdentifier()))
end)


function JailPlayer(playerId, time, data, source)
	local xPlayerTarget = ESX.GetPlayerFromId(playerId)
	if not PlayerArrested[playerId] then

		if data.jail == 'prison' then
			information2 = {prison = time, pjail = 0}
		elseif data.jail == 'pjail' then
			information2 = {pjail = time, prison = 0}
		end

		MySQL.Async.execute('UPDATE users SET arrested_time = @arrested_time WHERE identifier = @identifier', {		
			['@identifier'] = xPlayerTarget.identifier,
			['@arrested_time'] = json.encode(information2)
		}, function(rowsChanged)

			xPlayerTarget.triggerEvent('esx_extendedjail:jailplayer', time, data)
			PlayerArrested[playerId] = {TimeLeft = (time * 60), identifier = xPlayerTarget.getIdentifier(), realname = xPlayerTarget.name, JailType = data.jail}

			for playerId,player in pairs(PlayerArrested) do
				if player.JailType == 'prison' then PlayersinJail = PlayersinJail + 1 end
			end

			if Config.IsWebhookEnabled then Webhook("2061822", _U('alert'), _U('player_jailed', GetPlayerName(playerId), xPlayerTarget.getIdentifier())) end
			--print(PlayersinJail)
		end)
	else
		xPlayerTarget.showNotification(_U('already_jailed_error'))
	end
end

function UnJailPlayer(playerId, source)
	local xPlayerTarget = ESX.GetPlayerFromId(playerId)
	local jailinfo = {prison = 0, pjail = 0}

	if PlayerArrested[playerId] then
		MySQL.Async.execute('UPDATE users SET arrested_time = @arrested_time WHERE identifier = @identifier', {		
			['@identifier'] = xPlayerTarget.identifier,
			['@arrested_time'] = json.encode(jailinfo)
		}, function(rowsChanged)
			for playerId,player in pairs(PlayerArrested) do
				xPlayerTarget.triggerEvent('esx_extendedjail:unjailplayer', player.JailType)
				if player.JailType == 'prison' then PlayersinJail = PlayersinJail - 1 end
			end
			PlayerArrested[playerId] = nil
			if Config.IsWebhookEnabled then Webhook("2061822", _U('alert'), _U('player_unjailed', GetPlayerName(playerId), xPlayerTarget.getIdentifier())) end
			--print(PlayersinJail)
		end)
	else
		(ESX.GetPlayerFromId(source.playerId)).showNotification(_U('tried_unjail_error'))
	end
end

function Webhook(color, title, desc)
	local webhook = {
		{
			["color"] = color,
			["title"] = title,
			["description"] = desc,
			["footer"] = {
				["text"] = os.date("%d.%m.%y Time: %X"),
				["icon_url"] = Config.Logo,
			},
		}
	}
	PerformHttpRequest(Config.WebhookLink, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = webhook}), { ['Content-Type'] = 'application/json' })
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		for playerId,player in pairs(PlayerArrested) do
			PlayerArrested[playerId].TimeLeft = player.TimeLeft - 1

			if player.TimeLeft < 1 then
				UnJailPlayer(playerId)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(Config.UpdateTime)

		for playerId,player in pairs(PlayerArrested) do
			if player.JailType == 'prison' then
				UpdateInfo = {prison = math.ceil(player.TimeLeft / 60), pjail = 0}
			elseif player.JailType == 'pjail' then
				UpdateInfo = {pjail = math.ceil(player.TimeLeft / 60), prison = 0}
			end
				
			MySQL.Async.execute('UPDATE users SET arrested_time = @arrested_time WHERE identifier = @identifier', {		
				['@identifier'] = player.identifier,
				['@arrested_time'] = json.encode(UpdateInfo)
			}, function()
			end)
		end
	end
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	Citizen.Wait(1000)
	local coords = xPlayer.getCoords(true)
	local distance = #(coords - Config.JailSpawnLocation)
	MySQL.Async.fetchAll('SELECT arrested_time FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		for _,v in pairs(result) do
			local info = json.decode(v.arrested_time)
			if info.prison > 0 then
				xPlayer.triggerEvent('esx_extendedjail:jailplayer', info.prison, { jail = 'prison', type = 'nofirst', distance = distance })
				PlayerArrested[playerId] = {TimeLeft = (info.prison * 60), identifier = xPlayer.getIdentifier(), realname = xPlayer.name, JailType = 'prison'}
				PlayersinJail = PlayersinJail + 1
			elseif info.pjail > 0 then
				xPlayer.triggerEvent('esx_extendedjail:jailplayer', info.pjail, { jail = 'pjail', type = 'nofirst', distance = distance })
				PlayerArrested[playerId] = {TimeLeft = (info.pjail * 60), identifier = xPlayer.getIdentifier(), realname = xPlayer.name, JailType = 'pjail'}
			end
		end
	end)
end)

MySQL.ready(function()
	Citizen.Wait(5000)
	print("^0[^4Extended Jail^0] ^2Started Successful, enjoy! If you found any bugs, please report it on forum or github.^0")
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		local coords = xPlayer.getCoords(true)
		local distance = #(coords - Config.JailSpawnLocation)
		MySQL.Async.fetchAll('SELECT arrested_time FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		}, function(result)
			for _,v in pairs(result) do
				local info = json.decode(v.arrested_time)
				if info.prison > 0 then
					xPlayer.triggerEvent('esx_extendedjail:jailplayer', info.prison, { jail = 'prison', type = 'nofirst', distance = distance })
					PlayerArrested[xPlayer.playerId] = {TimeLeft = (info.prison * 60), identifier = xPlayer.getIdentifier(), realname = xPlayer.name, JailType = 'prison'}
					PlayersinJail = PlayersinJail + 1
				elseif info.pjail > 0 then
					xPlayer.triggerEvent('esx_extendedjail:jailplayer', info.pjail, { jail = 'pjail', type = 'nofirst', distance = distance })
					PlayerArrested[xPlayer.playerId] = {TimeLeft = (info.pjail * 60), identifier = xPlayer.getIdentifier(), realname = xPlayer.name, JailType = 'pjail'}
				end
			end
		end)
	end
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
	PlayerArrested[playerId] = nil
end)

ESX.RegisterServerCallback('esx_extendedjail:haveitem', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local HaveItem = xPlayer.getInventoryItem(Config.Item).count

	if HaveItem >= 1 then
		cb(true)
	else
		cb(false)
	end
end)


ESX.RegisterServerCallback('esx_extendedjail:players', function(source, cb)
		local players  = {}
		for playerId,player in pairs(PlayerArrested) do
			table.insert(players, {
				name = player.realname,
				pinfo = playerId
			})
		end

		if PlayersinJail > 0 then
			cb(players, true)
		else
			cb(players, false)
		end
end)
