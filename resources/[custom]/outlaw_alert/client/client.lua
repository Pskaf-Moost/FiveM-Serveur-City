local xPlayer = nil

ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    xPlayer = xPlayer
end)

Citizen.CreateThread( function()
    local playerPed = GetPlayerPed(-1)
    local playerId = GetPlayerServerId(xPlayer)

    while true do
        Citizen.Wait(0)
  
        local playerpos = GetEntityCoords(playerPed)

        if IsPedInMeleeCombat(playerPed) then
            TriggerServerEvent('outlaw_alert:streetFightInProgress', playerId, playerpos)
        end
     
        -- seems to not work
        if IsPedTryingToEnterALockedVehicle(playerPed) then
            TriggerServerEvent('outlaw_alert:carThiefInProgress', playerId, playerpos)
        end

        if IsPedJacking(playerPed)then
            TriggerServerEvent('outlaw_alert:carJackingInProgress', playerId, playerpos)
        end

        if IsPedShooting(playerPed) then
            TriggerServerEvent('outlaw_alert:gunShotInProgress', playerId, playerpos)
        end
        
    end
end)


RegisterNetEvent('outlaw_alert:receiveAlert')
AddEventHandler('outlaw_alert:receiveAlert', function(type, gps, duration, ignorePolice)
    local alert = Config.Alerts[type]

    -- if ignorePolice and xPlayer.job ~= nil and PlayerData.job.name == 'police' then
	-- 	return
	-- end

    --ESX.ShowNotification(('outlaw_alert:receiveAlert : %s at x:%s y:%s sz:%s'):format(type, gps.x, gps.y, gps.z))

    local blip = AddBlipForCoord(gps.x,gps.y,gps.z)
    SetBlipSprite(blip,  alert.blip.sprite)
    SetBlipColour(blip,  alert.blip.color)
    SetBlipAsShortRange(blip,  alert.blip.isShortRange)
    SetBlipAlpha(255)
    Wait(duration)
    RemoveBlip(blip)

end)