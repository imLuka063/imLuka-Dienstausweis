
-- ESX = nil

-- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- RegisterCommand('dienstausweis', function()
-- 	ShowMenu()
-- end, false)

-- function ShowMenu()
-- 	local playerPed = PlayerPedId()
-- 	local elements = {}
-- 	local players = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)

-- 	-- Füge die eigene ID als Option hinzu
-- 	table.insert(elements, {
-- 		label = 'Selbst ansehen ',
-- 		player = PlayerId() -- Verwende PlayerId() anstelle von GetPlayerServerId(PlayerId())
-- 	})

-- 	for i=1, #players, 1 do
-- 		table.insert(elements, {
-- 			label = 'ID: ' .. GetPlayerServerId(players[i]),
-- 			player = players[i]
-- 		})
-- 	end

-- 	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'license_menu', {
-- 		title = 'Wem willst du den Dienstausweis zeigen?',
-- 		elements = elements
-- 	}, function(data, menu)
-- 		local player = data.current.player
-- 		menu.close()
-- 		TriggerServerEvent('luka:checkJob', player)
-- 	end, function(data, menu)
-- 		menu.close()
-- 	end)
-- end

-- RegisterKeyMapping('dienstausweis', 'Dienstausweis zeigen', 'keyboard', '')
-- RegisterKeyMapping('e idcardh', 'Gleiche Taste', 'keyboard', '')


-- ESX = nil

-- TriggerEvent('esx:getSharedObject', function(obj) 
--     ESX = obj 
-- end)

-- RegisterCommand('dienstausweis', function()
--     ShowMenu()
-- end, false)

-- function ShowMenu()
--     local playerPed = PlayerPedId()
--     local elements = {}
--     local players = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)

--     -- Füge die eigene ID als Option hinzu
--     table.insert(elements, {
--         label = 'Selbst ansehen ',
--         player = PlayerId()
--     })

--     for i=1, #players, 1 do
--         table.insert(elements, {
--             label = 'ID: ' .. GetPlayerServerId(players[i]),
--             player = players[i]
--         })
--     end

--     ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'license_menu', {
--         title = 'Wem willst du den Dienstausweis zeigen?',
--         elements = elements
--     }, function(data, menu)
--         local player = data.current.player
--         menu.close()
--         TriggerServerEvent('luka:checkJob', player)
--     end, function(data, menu)
--         menu.close()
--     end)
-- end

-- RegisterKeyMapping('dienstausweis', 'Dienstausweis zeigen', 'keyboard', '')
-- RegisterKeyMapping('e idcardh', 'Gleiche Taste', 'keyboard', '')


ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterCommand('dienstausweis', function()
    ShowIDCard()
end, false)

function ShowIDCard()
    local playerPed = PlayerPedId()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        local targetServerId = GetPlayerServerId(closestPlayer)
        TriggerServerEvent('luka:checkJob', targetServerId)
    else
        -- Handle case when no player is nearby
        TriggerEvent('esx:showNotification', 'Niemand in der nähe.')
    end
end

RegisterKeyMapping('dienstausweis', 'Dienstausweis zeigen', 'keyboard', '')
--RegisterKeyMapping('e idcardh', 'Gleiche Taste', 'keyboard', '')

