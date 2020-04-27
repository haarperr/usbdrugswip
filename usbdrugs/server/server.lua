ESX = nil


TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)


ESX.RegisterUsableItem('whiteusb', function(source)
        
    local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.removeInventoryItem('whiteusb', 1)
TriggerClientEvent('usbdrugs:used', source)
end)


ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

    RegisterServerEvent('usbdrugs:reward')
    AddEventHandler('usbdrugs:reward', function(itemName, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.addInventoryItem('cokebrick', 10)
            ESX.ShowNotification('~r~You stole 10 bricks of cocaine!')
            TriggerClientEvent('usbdrugs:collected', source)
    end)