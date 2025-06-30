Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500) -- Tarkistetaan 2x sekunnissa

        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            DisplayRadar(true) -- Näyttää mapin
        else
            DisplayRadar(false) -- Piilottaa mapin
        end
    end
end)