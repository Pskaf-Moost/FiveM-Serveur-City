ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Start of Dark Net
TriggerEvent('esx_phone:registerNumber', 'darknet', _U('phone_darknet'), true, false, true, true)

function OnDarkNetItemChange(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local found = false
	local darknet = xPlayer.getInventoryItem('darknet')

	if darknet.count > 0 then
		found = true
	end

	if found then
		TriggerEvent('esx_phone:addSource', 'darknet', source)
	else
		TriggerEvent('esx_phone:removeSource', 'darknet', source)
	end
end

RegisterServerEvent('esx_phone:reload')
AddEventHandler('esx_phone:reload', function(phoneNumber)
--AddEventHandler('esx:playerLoaded', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local darknet  = xPlayer.getInventoryItem('darknet')
	if darknet.count > 0 then
		TriggerEvent('esx_phone:addSource', 'darknet', source)
	end
end)

AddEventHandler('esx:playerDropped', function(source)
	TriggerEvent('esx_phone:removeSource', 'darknet', source)
end)

AddEventHandler('esx:onAddInventoryItem', function(source, item, count)
	if item.name == 'darknet' then
		OnDarkNetItemChange(source)
	end
end)

AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
	if item.name == 'darknet' then
		OnDarkNetItemChange(source)
	end
end)
-- End of Dark Net

-- Bandage
ESX.RegisterUsableItem('bandage', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('esx_extraitems:bandage', source)
	if Config.Removeables.Bandage then
		xPlayer.removeInventoryItem('bandage', 1)
		xPlayer.showNotification(_U('used_bandage'))
	end
end)

RegisterServerEvent('esx_extraitems:givebandages')
AddEventHandler('esx_extraitems:givebandages', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.canCarryItem('bandage', 3) then
		xPlayer.removeInventoryItem('firstaidkit', 1)
		xPlayer.showNotification(_U('used_firstaidkit'))
		xPlayer.addInventoryItem('bandage', 3)
	else
		xPlayer.showNotification(_U('player_cannot_hold', 'Bandages'))
	end
end)

-- Binoculars
ESX.RegisterUsableItem('binoculars', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:binoculars', source)
end)

-- Bullet-Proof Vest
ESX.RegisterUsableItem('bulletproof', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:bulletproof', source)
	if Config.Removeables.BulletProofVest then
		xPlayer.removeInventoryItem('bulletproof', 1)
		xPlayer.showNotification(_U('used_bulletproof'))
	end
end)

-- Defib
ESX.RegisterUsableItem('defib', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('esx_extraitems:defib', source)
end)

RegisterNetEvent('esx_extraitems:removedefib')
AddEventHandler('esx_extraitems:removedefib', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.Defib then
		xPlayer.removeInventoryItem('defib', 1)
		xPlayer.showNotification(_U('used_defib'))
	end
end)

-- Drill
ESX.RegisterUsableItem('drill', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('esx_extraitems:drill', source)
end)

RegisterNetEvent('esx_extraitems:removedrill')
AddEventHandler('esx_extraitems:removedrill', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.Drill then
		xPlayer.removeInventoryItem('drill', 1)
		xPlayer.showNotification(_U('used_drill'))
	end
end)

-- Firework
ESX.RegisterUsableItem('firework', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:firework', source)
	if Config.Removeables.Firework then
		xPlayer.removeInventoryItem('firework', 1)
		xPlayer.showNotification(_U('used_firework'))
	end
end)

-- First Aid Kit
ESX.RegisterUsableItem('firstaidkit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:firstaidkit', source)
end)

RegisterNetEvent('esx_extraitems:removefirstaidkit')
AddEventHandler('esx_extraitems:removefirstaidkit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.FirstAidKit then
		xPlayer.removeInventoryItem('firstaidkit', 1)
		xPlayer.showNotification(_U('used_firstaidkit'))
	end
end)

-- Lock Pick
ESX.RegisterUsableItem('lockpick', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:lockpick', source)
end)

RegisterNetEvent('esx_extraitems:removelockpick')
AddEventHandler('esx_extraitems:removelockpick', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.LockPick then
		xPlayer.removeInventoryItem('lockpick', 1)
		xPlayer.showNotification(_U('used_lockpick'))
	end
end)

-- Oxygen Mask
ESX.RegisterUsableItem('oxygenmask', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:oxygenmask', source)
	if Config.Removeables.OxygenMask then
		xPlayer.removeInventoryItem('oxygenmask', 1)
		xPlayer.showNotification(_U('used_oxygenmask'))
	end
end)

-- Repair Kit
ESX.RegisterUsableItem('repairkit', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:repairkit', source)
end)

RegisterNetEvent('esx_extraitems:removerepairkit')
AddEventHandler('esx_extraitems:removerepairkit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.RepairKit then
		xPlayer.removeInventoryItem('repairkit', 1)
		xPlayer.showNotification(_U('used_repairkit'))
	end
end)

-- Tire Kit
ESX.RegisterUsableItem('tirekit', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:tirekit', source)
end)

RegisterNetEvent('esx_extraitems:removetirekit')
AddEventHandler('esx_extraitems:removetirekit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.TireKit then
		xPlayer.removeInventoryItem('tirekit', 1)
		xPlayer.showNotification(_U('used_tirekit'))
	end
end)

-- Vehicle GPS
ESX.RegisterUsableItem('vehgps', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:installGPS', source)
end)

-- Weapon Kit
ESX.RegisterUsableItem('weakit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:weakit', source)
end)

RegisterNetEvent('esx_extraitems:removeweakit')
AddEventHandler('esx_extraitems:removeweakit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.WeaKit then
		xPlayer.removeInventoryItem('weakit', 1)
		xPlayer.showNotification(_U('used_weakit'))
	end
end)
