ESX = nil
local IsDead = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('pngt_liivi:SmallArmor')
AddEventHandler('pngt_liivi:SmallArmor', function()
    local inventory = ESX.GetPlayerData().inventory
    local ped = GetPlayerPed(-1)
    local armor = GetPedArmour(ped)
    local item = 'SmallArmor'

    if(armor >= 100) or (armor+30 > 100) then
        exports['mythic_notify']:DoHudText('inform', 'Sinulla on jo luotiliivi käytössä!')
        TriggerServerEvent('returnItem', item)
        return
    end

    TriggerEvent('mythic_progbar:client:progress', {
        name = 'smallb_armor',
        duration = 5000,
        label = 'Puetaan kevyttä luotiliiviä päälle...',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "rcmfanatic3",
            anim = "kneel_idle_a",
        },
        prop = {
            model = "prop_bodyarmour_02",
        }
    }, function(status)
        if not status then
            SetPedComponentVariation(ped, 9, 10, 0, 0)
            AddArmourToPed(ped, 30)
            exports['mythic_notify']:DoHudText('inform', 'Puit päällesi kevyeen luotiliivin.')
        end
    end)
end)

RegisterNetEvent('pngt_liivi:MedArmor')
AddEventHandler('pngt_liivi:MedArmor', function()
    local inventory = ESX.GetPlayerData().inventory
    local ped = GetPlayerPed(-1)
    local armor = GetPedArmour(ped)
    local item = 'MedArmor'

    if(armor >= 100) or (armor+30 > 100) then
        exports['mythic_notify']:DoHudText('inform', 'Sinulla on jo luotiliivi käytössä!')
        TriggerServerEvent('returnItem', item)
        return
    end

    TriggerEvent('mythic_progbar:client:progress', {
        name = 'medb_armor',
        duration = 5000,
        label = 'Puetaan painavaa luotiliiviä päälle...',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "rcmfanatic3",
            anim = "kneel_idle_a",
        },
        prop = {
            model = "prop_bodyarmour_02",
        }
    }, function(status)
        if not status then
            SetPedComponentVariation(ped, 9, 10, 0, 0)
            AddArmourToPed(ped, 60)
            exports['mythic_notify']:DoHudText('inform', 'Puit päällesi painavan luotiliivin.')
        end
    end)
end)

RegisterNetEvent('pngt_liivi:HeavyArmor')
AddEventHandler('pngt_liivi:HeavyArmor', function()
    local inventory = ESX.GetPlayerData().inventory
    local ped = GetPlayerPed(-1)
    local armor = GetPedArmour(ped)
    local item = 'HeavyArmor'

    if(armor >= 100) or (armor+30 > 100) then
        exports['mythic_notify']:DoHudText('inform', 'Sinulla on jo luotiliivi käytössä!')
        TriggerServerEvent('returnItem', item)
        return
    end

    TriggerEvent('mythic_progbar:client:progress', {
        name = 'heavyb_armor',
        duration = 5000,
        label = 'Puetaan raskasta luotiliiviä päälle...',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "rcmfanatic3",
            anim = "kneel_idle_a",
        },
        prop = {
            model = "prop_bodyarmour_02",
        }
    }, function(status)
        if not status then
            SetPedComponentVariation(ped, 9, 10, 0, 0)
            AddArmourToPed(ped, 100)
            exports['mythic_notify']:DoHudText('inform', 'Puit päällesi raskaan luotiliivin.')
        end
    end)
end)

function table.includes(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end