local ESX = nil

-- Hanki ESX
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end

    -- ⏱ Odota että pelaajan data on varmasti ladattu
    while ESX.GetPlayerData().accounts == nil do
        Citizen.Wait(100)
    end

    -- ⬇️ Hae pankkiraha manuaalisesti kerran alussa
    local accounts = ESX.GetPlayerData().accounts
    for _, account in pairs(accounts) do
        if account.name == 'bank' then
            SendNUIMessage({
                action = 'updateBank',
                value = account.money
            })
        end
    end
end)

-- 🔁 Päivitys rahalle (tapahtuma, viiveellä)
RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
    if account.name == 'bank' then
        Citizen.CreateThread(function()
            Citizen.Wait(1500)
            SendNUIMessage({
                action = 'updateBank',
                value = account.money
            })
        end)
    end
end)

-- ⏰ Kellonaika
Citizen.CreateThread(function()
    while true do
        local hour = GetClockHours()
        local minute = GetClockMinutes()
        local timeStr = string.format("%02d:%02d", hour, minute)

        SendNUIMessage({
            action = 'updateTime',
            time = timeStr
        })

        Citizen.Wait(1000)
    end
end)