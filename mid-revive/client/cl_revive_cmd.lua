local isDead = false

RegisterNetEvent('revive:client')
AddEventHandler('revive:client', function()
    local playerPed = PlayerPedId()
    
    if IsPedDeadOrDying(playerPed) then
        DoScreenFadeOut(1000)
        while not IsScreenFadedOut() do
            Citizen.Wait(10)
        end
        
        NetworkResurrectLocalPlayer(GetEntityCoords(playerPed), true, true, false)
        
        ClearPedBloodDamage(playerPed)
        ResetPedVisibleDamage(playerPed)
        ClearPedLastWeaponDamage(playerPed)
        
        SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
        SetPedArmour(playerPed, 0)
        
        DoScreenFadeIn(1000)
        isDead = false
        
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local playerPed = PlayerPedId()
        isDead = IsPedDeadOrDying(playerPed)
    end
end)
