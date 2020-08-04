ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('SmallArmor', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('SmallArmor', 1)
    TriggerClientEvent('pngt_liivi:SmallArmor', source)
end)

ESX.RegisterUsableItem('MedArmor', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('MedArmor', 1)
    TriggerClientEvent('pngt_liivi:MedArmor', source)
end)

ESX.RegisterUsableItem('HeavyArmor', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('HeavyArmor', 1)
    TriggerClientEvent('pngt_liivi:HeavyArmor', source)
end)

RegisterNetEvent('returnItem')
AddEventHandler('returnItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(item, 1)
end)