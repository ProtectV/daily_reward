ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("daily_reward:check", function(source, cb)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local currDate = os.date("*t").day ..".".. os.date("*t").month .."."..os.date("*t").year
    MySQL.query("SELECT * FROM users WHERE identifier = ?", {xPlayer.identifier}, function(result)

        if #result ~= 0 then

            if result[1].lastLogin ~= currDate then

                MySQL.query("UPDATE users SET lastLogin = ? WHERE identifier = ?", {currDate, xPlayer.identifier}, function(ignore)  end)
                cb({state = true, item = })

            end

        end

    end)

end)