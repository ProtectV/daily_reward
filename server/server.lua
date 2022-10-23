ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("daily_reward:check", function(source, cb)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local currDate = os.date("*t").day ..".".. os.date("*t").month .."."..os.date("*t").year
    MySQL.query("SELECT * FROM users WHERE identifier = ?", {xPlayer.identifier}, function(result)

        if #result ~= 0 then

            if result[1].lastLogin ~= currDate then

                item = Config.items[math.random(#Config.items)]
                amount = nil

                MySQL.query("UPDATE users SET lastLogin = ? WHERE identifier = ?", {currDate, xPlayer.identifier}, function(ignore)  end)

                if item == "money" then

                    amount = math.random(Config.moneyAmount.min, Config.moneyAmount.max)
                    xPlayer.addAccountMoney("bank", amount)

                else

                    amount = math.random(Config.itemAmount.min, Config.itemAmount.max)
                    xPlayer.addInventoryItem(item, amount)

                end

                MySQL.query("SELECT * FROM items WHERE name = ?", {item}, function(itemMeta)

                    if item ~= "money" then

                        cb({state = true, item = itemMeta[1].label, amount = amount})

                    else

                        cb({state = true, item = "money", amount = amount})

                    end

                end)

            else

                cb({state = false})

            end

        else

            cb({state = false})

        end

    end)

end)