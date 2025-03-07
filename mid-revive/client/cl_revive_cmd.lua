-- client/client.lua (Client-Side)
local isDead = false

RegisterNetEvent('revive:client')
AddEventHandler('revive:client', function()
    local playerPed = PlayerPedId()
    
    if IsPedDeadOrDying(playerPed) then
        -- Animasi layar fade
        DoScreenFadeOut(1000)
        while not IsScreenFadedOut() do
            Citizen.Wait(10)
        end
        
        -- Proses revive
        NetworkResurrectLocalPlayer(GetEntityCoords(playerPed), true, true, false)
        
        -- Reset karakter
        ClearPedBloodDamage(playerPed)
        ResetPedVisibleDamage(playerPed)
        ClearPedLastWeaponDamage(playerPed)
        
        -- Set kesehatan dan armor
        SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
        SetPedArmour(playerPed, 0)
        
        -- Animasi fade in
        DoScreenFadeIn(1000)
        isDead = false
        
        -- Notifikasi
        -- ESX.ShowNotification('Anda telah di-revive!')
    end
end)

-- Cek status kematian
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local playerPed = PlayerPedId()
        isDead = IsPedDeadOrDying(playerPed)
    end
end)