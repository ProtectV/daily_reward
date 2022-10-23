ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('playerSpawned', function()
    Citizen.CreateThread(function()

        ESX.TriggerServerCallback('daily_reward:check', function(state)

            if state.state then

                if state.item ~= "money" then

                    exports["protectv_notify"]:notify("DAILY REWARD", "Du hast ".. state.amount .. " mal ".. state.item .. " bekommen")

                else

                    exports["protectv_notify"]:notify("DAILY REWARD", "Du hast $".. state.amount .. " bekommen")

                end

            end

        end)

    end)
end)