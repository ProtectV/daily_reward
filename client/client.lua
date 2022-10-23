ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.TriggerServerCallback('daily_reward:check', function(state)



end)

AddEventHandler('playerSpawned', function()
    Citizen.CreateThread(function()

        ESX.TriggerServerCallback('daily_reward:check', function(state)



        end)

    end)
end)