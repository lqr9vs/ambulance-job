ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Event to complete a call and payout
RegisterServerEvent('ambulance:completeCall')
AddEventHandler('ambulance:completeCall', function(payout)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney(payout)
    TriggerClientEvent('esx:showNotification', source, "You earned $" .. payout .. " for completing the call.")
end)