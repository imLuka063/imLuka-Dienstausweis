
-- ESX = nil

-- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- RegisterServerEvent('luka:checkJob')
-- AddEventHandler('luka:checkJob', function(targetId)
--     local xPlayer = ESX.GetPlayerFromId(source)
--     --local xTarget = ESX.GetPlayerFromId(targetId)

--     if xPlayer ~= nil then

--         if HasRequiredJob(xPlayer) and HasRequiredItems(xPlayer) then
--             TriggerClientEvent('esx:showNotification', source, 'Du hast der Person deinen Dienstausweis gezeigt.')
--             --TriggerClientEvent('esx:showNotification', targetId, 'Diese Person ist ein Staatsbeamter.')
--         else
--             --TriggerClientEvent('esx:showNotification', targetId, 'Etwas am Dienstausweis dieser Person wirkt komisch.')
--         end
--     end
--     if HasRequiredItems(xPlayer) then

--     else
--         TriggerClientEvent('esx:showNotification', source, 'Du brauchst einen Dienstausweis.')
--     end   
--     if HasRequiredJob(xPlayer) then 
        
--     else
--         TriggerClientEvent('esx:showNotification', source, 'Du hast der Person deinen Dienstausweis gezeigt.')
--     end
--     TriggerServerEvent('luka:checkJob2', targetId)        
-- end)

-- RegisterServerEvent('luka:checkJob2')
-- AddEventHandler('luka:checkJob2', function(source)
--     local xTarget = ESX.GetPlayerFromId(targetId)

    
--     if xTarget ~= nil then

--         if HasRequiredJob(xPlayer) and HasRequiredItems(xPlayer) then
--             --TriggerClientEvent('esx:showNotification', source, 'Du hast der Person deinen Dienstausweis gezeigt.')
--             TriggerClientEvent('esx:showNotification', source, 'Diese Person ist ein Staatsbeamter.')
--         else
--             TriggerClientEvent('esx:showNotification', source, 'Etwas am Dienstausweis dieser Person wirkt komisch.')
--         end
--     end
       
-- end)

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

RegisterServerEvent('luka:checkJob')
AddEventHandler('luka:checkJob', function(targetServerId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(targetServerId)  -- Use the provided targetServerId

    if xPlayer ~= nil and xTarget ~= nil then
        if HasRequiredJob(xPlayer) and HasRequiredItems(xPlayer) then
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Du hast der Person deinen Dienstausweis gezeigt.')
            TriggerClientEvent('esx:showNotification', xTarget.source, 'Diese Person ist ein Staatsbeamter.')
        elseif not HasRequiredJob(xPlayer) and HasRequiredItems(xPlayer) then
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Du hast der Person deinen Dienstausweis gezeigt.')
            TriggerClientEvent('esx:showNotification', xTarget.source, 'Die Person könnte ein Beamter sein, aber vielleicht auch nicht.')
        elseif not HasRequiredItems(xPlayer) and HasRequiredJob(xPlayer) then
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Du hast keinen Dienstausweis dabei')
            TriggerClientEvent('esx:showNotification', xTarget.source, 'Die Person hat keinen Dienstausweis dabei.')
        elseif not HasRequiredItems(xPlayer) and not HasRequiredJob(xPlayer) then
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'Du hast keinen Dienstausweis dabei')
            TriggerClientEvent('esx:showNotification', xTarget.source, 'Die Person hat keinen Dienstausweis dabei.')
        end    
    else
        TriggerClientEvent('esx:showNotification', source, 'Fehler beim Abrufen der Spieler.')
    end
end)


function HasRequiredJob(xPlayer)
    local playerJob = xPlayer.job.name
    return playerJob == Config.Job
end

function HasRequiredItems(xPlayer)
    local itemLabel = ESX.GetItemLabel(Config.Item)  -- Hier sollte der Artikelname direkt angegeben werden
    local playerItems = xPlayer.getInventory()

    for _, item in pairs(playerItems) do
        if item.name == Config.Item then
            return true  -- Der Spieler hat das erforderliche Element
        end
    end

    return false  -- Der Spieler hat das erforderliche Element nicht
end

-- RegisterServerEvent('playerConnecting')
-- AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
--     local playerName = GetPlayerName(source)

--     if GetCurrentResourceName() ~= 'Luka_Dienstausweis' then
--         deferrals.done('Luka Scripts dürfen nicht umbenannt werden!')  
--     end

--     deferrals.done()  
-- end)