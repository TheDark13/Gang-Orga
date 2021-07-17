ESX = nil
local PlayerData                = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

---------------------------------------------------------------------------------------------------------------
--------------------------------------------- Gestion Menu ---------------------------------------------------
---------------------------------------------------------------------------------------------------------------


RegisterServerEvent('esx_marabunta:buyItem')
AddEventHandler('esx_marabunta:buyItem', function()
  	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_marabunta', function(account)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_marabunta', function(inventory)

		if account.money >= 15000 then
		
		  TriggerClientEvent('esx:showNotification', source, '1x Torche Plasma a été rajouté dans le Stock')
		  
		  inventory.addItem('oxycutter', 1)
		  account.removeMoney(15000)
		  
		else
		  TriggerClientEvent('esx:showNotification', source, 'Pas assez d\'argent')
		end

	end)
	end)
end)

RegisterServerEvent('esx_marabunta:buyItem1')
AddEventHandler('esx_marabunta:buyItem1', function()
  	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_marabunta', function(account)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_marabunta', function(inventory)

		if account.money >= 7500 then
		
		  TriggerClientEvent('esx:showNotification', source, '1x LockPick a été rajouté dans le Stock')
		  
		  inventory.addItem('lockpick', 1)
		  account.removeMoney(7500)
		  
		else
		  TriggerClientEvent('esx:showNotification', source, 'Pas assez d\'argent')
		end

	end)
	end)
end)

RegisterServerEvent('esx_marabunta:buyItem2')
AddEventHandler('esx_marabunta:buyItem2', function()
  	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_marabunta', function(account)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_marabunta', function(inventory)

		if account.money >= 7500 then
		
		  TriggerClientEvent('esx:showNotification', source, '1x Card BankID a été rajouté dans le Stock')
		  
		  inventory.addItem('pacificidcard', 1)
		  account.removeMoney(7500)
		  
		else
		  TriggerClientEvent('esx:showNotification', source, 'Pas assez d\'argent')
		end

	end)
	end)
end)

RegisterServerEvent('esx_marabunta:giveWeapon')
AddEventHandler('esx_marabunta:giveWeapon', function(weapon, ammo)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  xPlayer.addWeapon(weapon, ammo)
end)

RegisterServerEvent('esx_marabunta:confiscatePlayerItem')
AddEventHandler('esx_marabunta:confiscatePlayerItem', function(target, itemType, itemName, amount)

  local sourceXPlayer = ESX.GetPlayerFromId(source)
  local targetXPlayer = ESX.GetPlayerFromId(target)

  if itemType == 'item_standard' then

    local label = sourceXPlayer.getInventoryItem(itemName).label

    targetXPlayer.removeInventoryItem(itemName, amount)
    sourceXPlayer.addInventoryItem(itemName, amount)

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confinv') .. amount .. ' ' .. label .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confinv') .. amount .. ' ' .. label )

  end

  if itemType == 'item_account' then

    targetXPlayer.removeAccountMoney(itemName, amount)
    sourceXPlayer.addAccountMoney(itemName, amount)

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confdm') .. amount .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confdm') .. amount)

  end

  if itemType == 'item_weapon' then

    targetXPlayer.removeWeapon(itemName)
    sourceXPlayer.addWeapon(itemName, amount)

    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confweapon') .. ESX.GetWeaponLabel(itemName) .. _U('from') .. targetXPlayer.name)
    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confweapon') .. ESX.GetWeaponLabel(itemName))

  end

end)

ESX.RegisterServerCallback('esx_marabunta:getOtherPlayerData',function(source, cb, target)

  if Config.EnableESXIdentity then

    local xPlayer = ESX.GetPlayerFromId(target)

    local identifier = GetPlayerIdentifiers(target)[1]

    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
      ['@identifier'] = identifier
    })

    local user      = result[1]
    local firstname     = user['firstname']
    local lastname      = user['lastname']
    local sex           = user['sex']
    local dob           = user['dateofbirth']
    local height        = user['height'] .. " Inches"

    local data = {
      name        = GetPlayerName(target),
      job         = xPlayer.job,
      inventory   = xPlayer.inventory,
      accounts    = xPlayer.accounts,
      weapons     = xPlayer.loadout,
      firstname   = firstname,
      lastname    = lastname,
      sex         = sex,
      dob         = dob,
      height      = height
    }

    TriggerEvent('esx_status:getStatus', _source, 'drunk', function(status)

      if status ~= nil then
        data.drunk = math.floor(status.percent)
      end

    end)

    if Config.EnableLicenses then

      TriggerEvent('esx_license:getLicenses', _source, function(licenses)
        data.licenses = licenses
        cb(data)
      end)

    else
      cb(data)
    end

  else

    local xPlayer = ESX.GetPlayerFromId(target)

    local data = {
      name       = GetPlayerName(target),
      job        = xPlayer.job,
      inventory  = xPlayer.inventory,
      accounts   = xPlayer.accounts,
      weapons    = xPlayer.loadout
    }

    TriggerEvent('esx_status:getStatus', _source, 'drunk', function(status)

      if status ~= nil then
        data.drunk = status.getPercent()
      end

    end)

    TriggerEvent('esx_license:getLicenses', _source, function(licenses)
      data.licenses = licenses
    end)

    cb(data)

  end

end)


RegisterServerEvent('esx_marabunta:handcuff')
AddEventHandler('esx_marabunta:handcuff', function(target)
  TriggerClientEvent('esx_marabunta:handcuff', target)
end)


RegisterServerEvent('esx_marabunta:drag')
AddEventHandler('esx_marabunta:drag', function(target)
  local _source = source
  TriggerClientEvent('esx_marabunta:drag', target, _source)
end)


RegisterServerEvent('esx_marabunta:putInVehicle')
AddEventHandler('esx_marabunta:putInVehicle', function(target)
  TriggerClientEvent('esx_marabunta:putInVehicle', target)
end)


RegisterServerEvent('esx_marabunta:OutVehicle')
AddEventHandler('esx_marabunta:OutVehicle', function(target)
    TriggerClientEvent('esx_marabunta:OutVehicle', target)
end)


ESX.RegisterServerCallback('esx_marabunta:getVehicleInfos',function(source, cb, plate)

  if Config.EnableESXIdentity then

    MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles',
      {},
      function(result)

        local foundIdentifier = nil

        for i=1, #result, 1 do

          local vehicleData = json.decode(result[i].vehicle)

          if vehicleData.plate == plate then
            foundIdentifier = result[i].owner
            break
          end

        end

        if foundIdentifier ~= nil then

          MySQL.Async.fetchAll(
            'SELECT * FROM users WHERE identifier = @identifier',
            {
              ['@identifier'] = foundIdentifier
            },
            function(result)

              local ownerName = result[1].firstname .. " " .. result[1].lastname

              local infos = {
                plate = plate,
                owner = ownerName
              }

              cb(infos)

            end
          )

        else

          local infos = {
          plate = plate
          }

          cb(infos)

        end

      end
    )

  else

    MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles',
      {},
      function(result)

        local foundIdentifier = nil

        for i=1, #result, 1 do

          local vehicleData = json.decode(result[i].vehicle)

          if vehicleData.plate == plate then
            foundIdentifier = result[i].owner
            break
          end

        end

        if foundIdentifier ~= nil then

          MySQL.Async.fetchAll(
            'SELECT * FROM users WHERE identifier = @identifier',
            {
              ['@identifier'] = foundIdentifier
            },
            function(result)

              local infos = {
                plate = plate,
                owner = result[1].name
              }

              cb(infos)

            end
          )

        else

          local infos = {
          plate = plate
          }

          cb(infos)

        end

      end
    )

  end

end)


ESX.RegisterServerCallback('esx_marabunta:getPlayerInventory',function(source, cb)

  local _source    = source
  local xPlayer    = ESX.GetPlayerFromId(_source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------bandits-------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

TriggerEvent('esx_society:registerSociety', 'marabunta', 'marabunta', 'society_marabunta', 'society_marabunta', 'society_marabunta', {type = 'private'})

PlayersHarvesting   = {}
PlayersHarvesting2  = {}
PlayersHarvesting3  = {}
PlayersHarvesting4  = {}
PlayersCrafting     = {}
PlayersCrafting2    = {}
PlayersCrafting3    = {}


RegisterServerEvent('esx_marabunta:getStockItemsBandits')
AddEventHandler('esx_marabunta:getStockItemsBandits', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_marabunta', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('esx_marabunta:getStockItemsBandits',function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_marabunta', function(inventory)
    cb(inventory.items)
  end)

end)

-- RegisterServerEvent('esx_marabunta:putStockItemsBandits')
-- AddEventHandler('esx_marabunta:putStockItemsBandits', function(itemName, count)

  -- local _source = source
  -- local xPlayer = ESX.GetPlayerFromId(_source)

  -- TriggerEvent('esx_addoninventory:getSharedInventory', 'society_marabunta', function(inventory)

    -- local item = inventory.getItem(itemName)

    -- if item.count >= 0 then
      -- xPlayer.removeInventoryItem(itemName, count)
      -- inventory.addItem(itemName, count)
    -- else
      -- TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité Invalide')
    -- end

    -- TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

  -- end)

-- end)

RegisterServerEvent('esx_marabunta:putStockItemsBandits')
AddEventHandler('esx_marabunta:putStockItemsBandits', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_marabunta', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, inventoryItem.label))
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)


ESX.RegisterServerCallback('esx_marabunta:putStockItemsBandits',function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_marabunta', function(inventory)
    cb(inventory.items)
  end)

end)


-------------- Récupération de Formoll -------------
local function Harvest(source)

  SetTimeout(3000, function()

    if PlayersHarvesting[source] == true then

      local _source = source
      local xPlayer = ESX.GetPlayerFromId(_source)
      local FormolQuantity = xPlayer.getInventoryItem('formol').count

      if FormolQuantity >= 20 then
        TriggerClientEvent('esx:showNotification', _source, 'Vous en avez suffisament')
      else
                xPlayer.addInventoryItem('formol', 1)

        Harvest(source)
      end
    end
  end)
end

RegisterServerEvent('esx_marabunta:startHarvestBandits')
AddEventHandler('esx_marabunta:startHarvestBandits', function()
  local _source = source
  PlayersHarvesting[_source] = true
  TriggerClientEvent('esx:showNotification', _source, 'Récupération Formol')
  Harvest(source)
end)

RegisterServerEvent('esx_marabunta:stopHarvestBandits')
AddEventHandler('esx_marabunta:stopHarvestBandits', function()
  local _source = source
  PlayersHarvesting[_source] = false
end)

------------ Récupération Puce Cryptée --------------
local function Harvest2(source)

  SetTimeout(3000, function()

    if PlayersHarvesting2[source] == true then

      local _source = source
      local xPlayer = ESX.GetPlayerFromId(_source)
      local PuceQuantity = xPlayer.getInventoryItem('puce').count

      if PuceQuantity >= 20 then
        TriggerClientEvent('esx:showNotification', _source, 'Vous en avez suffisament')
      else
        xPlayer.addInventoryItem('puce', 1)

        Harvest2(source)
      end
    end
  end)
end

RegisterServerEvent('esx_marabunta:startHarvest2Bandits')
AddEventHandler('esx_marabunta:startHarvest2Bandits', function()
  local _source = source
  PlayersHarvesting2[_source] = true
  TriggerClientEvent('esx:showNotification', _source, 'Récupération Puce')
  Harvest2(source)
end)

RegisterServerEvent('esx_marabunta:stopHarvest2Bandits')
AddEventHandler('esx_marabunta:stopHarvest2Bandits', function()
  local _source = source
  PlayersHarvesting2[_source] = false
end)

------------ Récupération Spark --------------
local function Harvest3(source)

  SetTimeout(2000, function()

    if PlayersHarvesting3[source] == true then

      local _source = source
      local xPlayer = ESX.GetPlayerFromId(_source)
      local SparkQuantity  = xPlayer.getInventoryItem('spark').count
      if SparkQuantity >= 50 then
        TriggerClientEvent('esx:showNotification', _source, 'Vous en avez suffisament')
      else
        xPlayer.addInventoryItem('spark', 1)

        Harvest3(source)
      end
    end
  end)
end

RegisterServerEvent('esx_marabunta:startHarvest3Bandits')
AddEventHandler('esx_marabunta:startHarvest3Bandits', function()
  local _source = source
  PlayersHarvesting3[_source] = true
  TriggerClientEvent('esx:showNotification', _source, 'Récupération Spark en cours..')
  Harvest3(source)
end)

RegisterServerEvent('esx_marabunta:stopHarvest3Bandits')
AddEventHandler('esx_marabunta:stopHarvest3Bandits', function()
  local _source = source
  PlayersHarvesting3[_source] = false
end)

------------ Récupération Tesla --------------
local function Harvest4(source)

  SetTimeout(3000, function()

    if PlayersHarvesting4[source] == true then

      local _source = source
      local xPlayer = ESX.GetPlayerFromId(_source)
      local TeslaQuantity  = xPlayer.getInventoryItem('tesla').count
      if TeslaQuantity >= 50 then
        TriggerClientEvent('esx:showNotification', _source, 'Vous en avez suffisament')
      else
        xPlayer.addInventoryItem('tesla', 1)

        Harvest4(source)
      end
    end
  end)
end

RegisterServerEvent('esx_marabunta:startHarvest4Bandits')
AddEventHandler('esx_marabunta:startHarvest4Bandits', function()
  local _source = source
  PlayersHarvesting4[_source] = true
  TriggerClientEvent('esx:showNotification', _source, 'Récupération Spark en cours..')
  Harvest4(source)
end)

RegisterServerEvent('esx_marabunta:stopHarvest4Bandits')
AddEventHandler('esx_marabunta:stopHarvest4Bandits', function()
  local _source = source
  PlayersHarvesting4[_source] = false
end)

------------ Craft Sédatif -------------------
local function Craft(source)

  SetTimeout(3000, function()

    if PlayersCrafting[source] == true then

      local _source = source
      local xPlayer = ESX.GetPlayerFromId(_source)
      local FormolQuantity = xPlayer.getInventoryItem('formol').count

      if FormolQuantity <= 0 then
        TriggerClientEvent('esx:showNotification', _source, 'Pas assez de Formol')
      else
        xPlayer.removeInventoryItem('formol', 2)
        xPlayer.addInventoryItem('sedatif', 1)

        Craft(source)
      end
    end
  end)
end

RegisterServerEvent('esx_marabunta:startCraftBandits')
AddEventHandler('esx_marabunta:startCraftBandits', function()
  local _source = source
  PlayersCrafting[_source] = true
  TriggerClientEvent('esx:showNotification', _source, 'Fabrication de Sédatif')
  Craft(source)
end)

RegisterServerEvent('esx_marabunta:stopCraftBandits')
AddEventHandler('esx_marabunta:stopCraftBandits', function()
  local _source = source
  PlayersCrafting[_source] = false
end)

------------ Craft SmartPhone Crypté --------------
local function Craft2(source)

  SetTimeout(3000, function()

    if PlayersCrafting2[source] == true then

      local _source = source
      local xPlayer = ESX.GetPlayerFromId(_source)
      local PuceQuantity  = xPlayer.getInventoryItem('puce').count
      local TelQuantity  = xPlayer.getInventoryItem('tel').count
      if PuceQuantity and TelQuantity <= 0 then
        TriggerClientEvent('esx:showNotification', _source, 'Pas assez d\'éléments')
      else
        xPlayer.removeInventoryItem('tel', 1)
        xPlayer.removeInventoryItem('puce', 1)
        xPlayer.addInventoryItem('cryptedphone', 1)

        Craft2(source)
      end
    end
  end)
end

RegisterServerEvent('esx_marabunta:startCraft2Bandits')
AddEventHandler('esx_marabunta:startCraft2Bandits', function()
  local _source = source
  PlayersCrafting2[_source] = true
  TriggerClientEvent('esx:showNotification', _source, 'Assemblage Phone Crypté')
  Craft2(source)
end)

RegisterServerEvent('esx_marabunta:stopCraft2Bandits')
AddEventHandler('esx_marabunta:stopCraft2Bandits', function()
  local _source = source
  PlayersCrafting2[_source] = false
end)

------------ Craft IEM --------------
local function Craft3(source)

  SetTimeout(4000, function()

    if PlayersCrafting3[source] == true then

      local _source = source
      local xPlayer = ESX.GetPlayerFromId(_source)
      local SparkQuantity  = xPlayer.getInventoryItem('spark').count
      local TeslaQuantity  = xPlayer.getInventoryItem('tesla').count
      if SparkQuantity and TeslaQuantity <= 0 then
        TriggerClientEvent('esx:showNotification', _source, 'Pas assez d\'éléments')
      else
        xPlayer.removeInventoryItem('spark', 2)
        xPlayer.removeInventoryItem('tesla', 2)
        xPlayer.addInventoryItem('lightbreak', 1)

        Craft3(_source)
      end
    end
  end)
end

RegisterServerEvent('esx_marabunta:startCraft3Bandits')
AddEventHandler('esx_marabunta:startCraft3Bandits', function()
  local _source = source
  PlayersCrafting3[_source] = true
  TriggerClientEvent('esx:showNotification', _source, 'Assemblage IEM en cours...')
  Craft3(_source)
end)

RegisterServerEvent('esx_marabunta:stopCraft3Bandits')
AddEventHandler('esx_marabunta:stopCraft3Bandits', function()
  local _source = source
  PlayersCrafting3[_source] = false
end)

-------------------------------
---- Stock Armes Banditsm ----
-------------------------------

-- ESX.RegisterServerCallback('esx_marabunta:getArmoryWeaponsBandits',function(source, cb)

  -- TriggerEvent('esx_datastore:getSharedDataStore', 'society_marabunta', function(store)

    -- local weapons = store.get('weapons')

    -- if weapons == nil then
      -- weapons = {}
    -- end

    -- cb(weapons)

  -- end)

-- end)

ESX.RegisterServerCallback('esx_marabunta:getArmoryWeaponsBandits', function(source, cb)
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_marabunta', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('esx_marabunta:addArmoryWeaponBandits',function(source, cb, weaponName)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_marabunta', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_marabunta:removeArmoryWeaponBandits',function(source, cb, weaponName)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_marabunta', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)


ESX.RegisterServerCallback('esx_marabunta:buyBandits',function(source, cb, amount)

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_marabunta', function(account)

    if account.money >= amount then
      account.removeMoney(amount)
      cb(true)
    else
      cb(false)
    end

  end)

end)


----------------------------------------------------------------------------------------------------------------------
--------------------------------------Coffre argent sale / Armes ------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
ESX.RegisterServerCallback('esx_marabunta:getBlackMoneySociety', function(source, cb)
  local _source = source
  local xPlayer    = ESX.GetPlayerFromId(_source)
  local blackMoney = 0
  local items      = {}
  local weapons    = {}

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_marabunta_black', function(account)
    blackMoney = account.money
  end)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_marabunta', function(inventory)
    items = inventory.items
  end)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_marabunta_weapons', function(store)
    local storeWeapons = store.get('weapons')

    if storeWeapons ~= nil then
      weapons = storeWeapons
    end
  end)

  cb({
    blackMoney = blackMoney,
    items      = items,
    weapons    = weapons
  })

end)

RegisterServerEvent('esx_marabunta:getItem')
AddEventHandler('esx_marabunta:getItem', function(type, item, count)

  local _source      = source
  local xPlayer      = ESX.GetPlayerFromId(_source)

  if type == 'item_account' then

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_marabunta_black', function(account)

      local roomAccountMoney = account.money

      if roomAccountMoney >= count then
        account.removeMoney(count)
        xPlayer.addAccountMoney(item, count)
      else
        TriggerClientEvent('esx:showNotification', _source, 'Montant invalide')
      end

    end)
  end

  if type == 'item_weapon' then

    TriggerEvent('esx_datastore:getSharedDataStore', 'society_marabunta_weapons', function(store)

      local storeWeapons = store.get('weapons')

      if storeWeapons == nil then
        storeWeapons = {}
      end

      local weaponName   = nil
      local ammo         = nil

      for i=1, #storeWeapons, 1 do
        if storeWeapons[i].name == item then
          weaponName = storeWeapons[i].name
          ammo       = storeWeapons[i].ammo
          table.remove(storeWeapons, i)
          break
        end
      end
      store.set('weapons', storeWeapons)
      xPlayer.addWeapon(weaponName, ammo)
    end)
  end
end)

RegisterServerEvent('esx_marabunta:putItem')
AddEventHandler('esx_marabunta:putItem', function(type, item, count)

  local _source      = source
  local xPlayer      = ESX.GetPlayerFromId(_source)

  if type == 'item_account' then
    local playerAccountMoney = xPlayer.getAccount(item).money

    if playerAccountMoney >= count then

      xPlayer.removeAccountMoney(item, count)
      TriggerEvent('esx_addonaccount:getSharedAccount', 'society_marabunta_black', function(account)
        account.addMoney(count)
      end)
    else
      TriggerClientEvent('esx:showNotification', _source, 'Montant invalide')
    end
  end

  if type == 'item_weapon' then
    TriggerEvent('esx_datastore:getSharedDataStore', 'society_marabunta_weapons', function(store)
      local storeWeapons = store.get('weapons')

      if storeWeapons == nil then
        storeWeapons = {}
      end

      table.insert(storeWeapons, {
        name = item,
        ammo = count
      })
      store.set('weapons', storeWeapons)

      xPlayer.removeWeapon(item)
    end)
  end
end)

ESX.RegisterServerCallback('esx_marabunta:getPlayerInventory2', function(source, cb)
  local _source = source
  local xPlayer    = ESX.GetPlayerFromId(_source)
  local blackMoney = xPlayer.getAccount('black_money').money
  local items      = xPlayer.inventory

  cb({
    blackMoney = blackMoney,
    items      = items
  })
end)

---------------------------------
--- Copyright by ikNox#6088 ---
---------------------------------