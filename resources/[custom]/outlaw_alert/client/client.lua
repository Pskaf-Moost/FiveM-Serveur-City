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
    while true do
        Citizen.Wait(0)

        local playerPed = GetPlayerPed(-1)

        if IsPedInMeleeCombat(playerPed) then
            TriggerServerEvent('outlaw_alert:streetFightInProgress', playerPed)
        end
     
        if IsPedTryingToEnterALockedVehicle(playerPed) then
            TriggerServerEvent('outlaw_alert:carThiefInProgress', playerPed)
        end

        if IsPedJacking(playerPed)then
            TriggerServerEvent('outlaw_alert:carJackingInProgress', playerPed)
        end

        if IsPedShooting(playerPed)then
            TriggerServerEvent('outlaw_alert:gunShotInProgress', playerPed)
        end
        
    end
end)


RegisterEvent('outlaw_alert:receiveAlert')
AddEventHandler('outlaw_alert:receiveAlert', function(type, gps, duration, ignorePolice)
    local alert = Config.Alerts[type]

    if ignorePolice and xPlayer.job ~= nil and PlayerData.job.name == 'police' then
		return
	end

    local blip = AddBlipForCood(gps.x,gps.y,gps.z)
    SetBlipSprite(blip,  alert.blip.sprite)
    SetBlipColour(blip,  alert.blip.color)
    SetBlipAlpha(blip,  alert.blip.alpha)
    SetBlipAsShortRange(blip,  alert.blip.isShortRange)
    SetBlipFade(blip, duration)

end)