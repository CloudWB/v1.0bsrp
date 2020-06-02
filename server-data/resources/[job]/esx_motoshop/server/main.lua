ESX = nil
local categories, vehicles = {}, {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'motoshop', _U('dealer_customers'), false, false)
TriggerEvent('esx_society:registerSociety', 'motoshop', _U('car_dealer'), 'society_motoshop', 'society_motoshop', 'society_motoshop', {type = 'private'})

Citizen.CreateThread(function()
	local char = Config.PlateLetters
	char = char + Config.PlateNumbers
	if Config.PlateUseSpace then char = char + 1 end

	if char > 8 then
		print(('[esx_motoshop] [^3WARNING^7] Plate character count reached, %s/8 characters!'):format(char))
	end
end)

function RemoveOwnedVehicle(plate)
	MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	})
end

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM moto_categories', {}, function(_categories)
		categories = _categories

		MySQL.Async.fetchAll('SELECT * FROM moto', {}, function(_vehicles)
			vehicles = _vehicles

			for k,v in ipairs(vehicles) do
				for k2,v2 in ipairs(categories) do
					if v2.name == v.category then
						vehicles[k].categoryLabel = v2.label
						break
					end
				end
			end

			-- send information after db has loaded, making sure everyone gets vehicle information
			TriggerClientEvent('esx_motoshop:sendCategories', -1, categories)
			TriggerClientEvent('esx_motoshop:sendVehicles', -1, vehicles)
		end)
	end)
end)

function getVehicleLabelFromModel(model)
	for k,v in ipairs(vehicles) do
		if v.model == model then
			return v.name
		end
	end

	return
end

RegisterNetEvent('esx_motoshop:setVehicleOwnedPlayerId')
AddEventHandler('esx_motoshop:setVehicleOwnedPlayerId', function(playerId, vehicleProps, model, label)
	local xPlayer, xTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(playerId)

	if xPlayer.job.name == 'motoshop' and xTarget then
		MySQL.Async.fetchAll('SELECT id FROM motoshop_vehicles WHERE vehicle = @vehicle LIMIT 1', {
			['@vehicle'] = model
		}, function(result)
			if result[1] then
				local id = result[1].id

				MySQL.Async.execute('DELETE FROM motoshop_vehicles WHERE id = @id', {
					['@id'] = id
				}, function(rowsChanged)
					if rowsChanged == 1 then
						MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
							['@owner']   = xTarget.identifier,
							['@plate']   = vehicleProps.plate,
							['@vehicle'] = json.encode(vehicleProps)
						}, function(rowsChanged)
							xPlayer.showNotification(_U('vehicle_set_owned', vehicleProps.plate, xTarget.getName()))
							xTarget.showNotification(_U('vehicle_belongs', vehicleProps.plate))
						end)

						local dateNow = os.date('%Y-%m-%d %H:%M')

						MySQL.Async.execute('INSERT INTO moto_sold (client, model, plate, soldby, date) VALUES (@client, @model, @plate, @soldby, @date)', {
							['@client'] = xTarget.getName(),
							['@model'] = label,
							['@plate'] = vehicleProps.plate,
							['@soldby'] = xPlayer.getName(),
							['@date'] = dateNow
						})
					end
				end)
			end
		end)
	end
end)

ESX.RegisterServerCallback('esx_motoshop:getSoldVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT client, model, plate, soldby, date FROM moto_sold', {}, function(result)
		cb(result)
	end)
end)

RegisterNetEvent('esx_motoshop:rentVehicle')
AddEventHandler('esx_motoshop:rentVehicle', function(vehicle, plate, rentPrice, playerId)
	local xPlayer, xTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(playerId)

	if xPlayer.job.name == 'motoshop' and xTarget then
		MySQL.Async.fetchAll('SELECT id, price FROM motoshop_vehicles WHERE vehicle = @vehicle LIMIT 1', {
			['@vehicle'] = vehicle
		}, function(result)
			if result[1] then
				local price = result[1].price

				MySQL.Async.execute('DELETE FROM motoshop_vehicles WHERE id = @id', {
					['@id'] = result[1].id
				}, function(rowsChanged)
					if rowsChanged == 1 then
						MySQL.Async.execute('INSERT INTO rented_vehiclesmoto (vehicle, plate, player_name, base_price, rent_price, owner) VALUES (@vehicle, @plate, @player_name, @base_price, @rent_price, @owner)', {
							['@vehicle']     = vehicle,
							['@plate']       = plate,
							['@player_name'] = xTarget.getName(),
							['@base_price']  = price,
							['@rent_price']  = rentPrice,
							['@owner']       = xTarget.identifier
						}, function(rowsChanged2)
							xPlayer.showNotification(_U('vehicle_set_rented', plate, xTarget.getName()))
						end)
					end
				end)
			end
		end)
	end
end)

RegisterNetEvent('esx_motoshop:getStockItem')
AddEventHandler('esx_motoshop:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_motoshop', function(inventory)
		local item = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then

			-- can the player carry the said amount of x item?
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				xPlayer.showNotification(_U('have_withdrawn', count, item.label))
			else
				xPlayer.showNotification(_U('player_cannot_hold'))
			end
		else
			xPlayer.showNotification(_U('not_enough_in_society'))
		end
	end)
end)

RegisterNetEvent('esx_motoshop:putStockItems')
AddEventHandler('esx_motoshop:putStockItems', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_motoshop', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			xPlayer.showNotification(_U('have_deposited', count, item.label))
		else
			xPlayer.showNotification(_U('invalid_amount'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_motoshop:getCategories', function(source, cb)
	cb(categories)
end)

ESX.RegisterServerCallback('esx_motoshop:getVehicles', function(source, cb)
	cb(vehicles)
end)

ESX.RegisterServerCallback('esx_motoshop:buyVehicle', function(source, cb, model, plate)
	local xPlayer = ESX.GetPlayerFromId(source)
	local modelPrice

	for k,v in ipairs(vehicles) do
		if model == v.model then
			modelPrice = v.price
			break
		end
	end

	if modelPrice and xPlayer.getMoney() >= modelPrice then
		xPlayer.removeMoney(modelPrice)

		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
			['@owner']   = xPlayer.identifier,
			['@plate']   = plate,
			['@vehicle'] = json.encode({model = GetHashKey(model), plate = plate})
		}, function(rowsChanged)
			xPlayer.showNotification(_U('vehicle_belongs', plate))
			cb(true)
		end)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx_motoshop:getCommercialVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT price, vehicle FROM motoshop_vehicles ORDER BY vehicle ASC', {}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('esx_motoshop:buymotoshopVehicle', function(source, cb, model)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'motoshop' then
		local modelPrice

		for k,v in ipairs(vehicles) do
			if model == v.model then
				modelPrice = v.price
				break
			end
		end

		if modelPrice then
			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_motoshop', function(account)
				if account.money >= modelPrice then
					account.removeMoney(modelPrice)
	
					MySQL.Async.execute('INSERT INTO motoshop_vehicles (vehicle, price) VALUES (@vehicle, @price)', {
						['@vehicle'] = model,
						['@price'] = modelPrice
					}, function(rowsChanged)
						cb(true)
					end)
				else
					cb(false)
				end
			end)
		end
	end
end)

RegisterNetEvent('esx_motoshop:returnProvider')
AddEventHandler('esx_motoshop:returnProvider', function(vehicleModel)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'motoshop' then
		MySQL.Async.fetchAll('SELECT id, price FROM motoshop_vehicles WHERE vehicle = @vehicle LIMIT 1', {
			['@vehicle'] = vehicleModel
		}, function(result)
			if result[1] then
				local id = result[1].id

				MySQL.Async.execute('DELETE FROM motoshop_vehicles WHERE id = @id', {
					['@id'] = id
				}, function(rowsChanged)
					if rowsChanged == 1 then
						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_motoshop', function(account)
							local price = ESX.Math.Round(result[1].price * 0.75)
							local vehicleLabel = getVehicleLabelFromModel(vehicleModel)

							account.addMoney(price)
							xPlayer.showNotification(_U('vehicle_sold_for', vehicleLabel, ESX.Math.GroupDigits(price)))
						end)
					end
				end)
			else
				print(('[esx_motoshop] [^3WARNING^7] %s attempted selling an invalid vehicle!'):format(xPlayer.identifier))
			end
		end)
	end
end)

ESX.RegisterServerCallback('esx_motoshop:getRentedVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT * FROM rented_vehiclesmoto ORDER BY player_name ASC', {}, function(result)
		local vehicles = {}

		for i=1, #result, 1 do
			table.insert(vehicles, {
				name = result[i].vehicle,
				plate = result[i].plate,
				playerName = result[i].player_name
			})
		end

		cb(vehicles)
	end)
end)

ESX.RegisterServerCallback('esx_motoshop:giveBackVehicle', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT base_price, vehicle FROM rented_vehiclesmoto WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] then
			local vehicle = result[1].vehicle
			local basePrice = result[1].base_price

			MySQL.Async.execute('DELETE FROM rented_vehiclesmoto WHERE plate = @plate', {
				['@plate'] = plate
			}, function(rowsChanged)
				MySQL.Async.execute('INSERT INTO motoshop_vehicles (vehicle, price) VALUES (@vehicle, @price)', {
					['@vehicle'] = vehicle,
					['@price']   = basePrice
				})
	
				RemoveOwnedVehicle(plate)
				cb(true)
			end)
		else
			cb(false)
		end
	end)
end)

ESX.RegisterServerCallback('esx_motoshop:resellVehicle', function(source, cb, plate, model)
	local resellPrice

	-- calculate the resell price
	for i=1, #vehicles, 1 do
		if GetHashKey(vehicles[i].model) == model then
			resellPrice = ESX.Math.Round(vehicles[i].price / 100 * Config.ResellPercentage)
			break
		end
	end

	if not resellPrice then
		print(('[esx_motoshop] [^3WARNING^7] %s attempted to sell an unknown vehicle!'):format(GetPlayerIdentifiers(source)[1]))
		cb(false)
	else
		MySQL.Async.fetchAll('SELECT * FROM rented_vehiclesmoto WHERE plate = @plate', {
			['@plate'] = plate
		}, function(result)
			if result[1] then -- is it a rented vehicle?
				cb(false) -- it is, don't let the player sell it since he doesn't own it
			else
				local xPlayer = ESX.GetPlayerFromId(source)

				MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND @plate = plate', {
					['@owner'] = xPlayer.identifier,
					['@plate'] = plate
				}, function(result)
					if result[1] then -- does the owner match?
						local vehicle = json.decode(result[1].vehicle)

						if vehicle.model == model then
							if vehicle.plate == plate then
								xPlayer.addMoney(resellPrice)
								RemoveOwnedVehicle(plate)
								cb(true)
							else
								print(('[esx_motoshop] [^3WARNING^7] %s attempted to sell an vehicle with plate mismatch!'):format(xPlayer.identifier))
								cb(false)
							end
						else
							print(('[esx_motoshop] [^3WARNING^7] %s attempted to sell an vehicle with model mismatch!'):format(xPlayer.identifier))
							cb(false)
						end
					end
				end)
			end
		end)
	end
end)

ESX.RegisterServerCallback('esx_motoshop:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_motoshop', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('esx_motoshop:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items = xPlayer.inventory

	cb({items = items})
end)

ESX.RegisterServerCallback('esx_motoshop:isPlateTaken', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil)
	end)
end)

ESX.RegisterServerCallback('esx_motoshop:retrieveJobVehicles', function(source, cb, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND type = @type AND job = @job', {
		['@owner'] = xPlayer.identifier,
		['@type'] = type,
		['@job'] = xPlayer.job.name
	}, function(result)
		cb(result)
	end)
end)

RegisterNetEvent('esx_motoshop:setJobVehicleState')
AddEventHandler('esx_motoshop:setJobVehicleState', function(plate, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored WHERE plate = @plate AND job = @job', {
		['@stored'] = state,
		['@plate'] = plate,
		['@job'] = xPlayer.job.name
	}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('[esx_motoshop] [^3WARNING^7] %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)

function PayRent(d, h, m)
	MySQL.Async.fetchAll('SELECT * FROM rented_vehiclesmoto', {}, function(result)
		for i=1, #result, 1 do
			local xPlayer = ESX.GetPlayerFromIdentifier(result[i].owner)

			if xPlayer then -- message player if connected
				xPlayer.removeAccountMoney('bank', result[i].rent_price)
				xPlayer.showNotification(_U('paid_rental', ESX.Math.GroupDigits(result[i].rent_price)))
			else -- pay rent by updating SQL
				MySQL.Sync.execute('UPDATE users SET bank = bank - @bank WHERE identifier = @identifier', {
					['@bank'] = result[i].rent_price,
					['@identifier'] = result[i].owner
				})
			end

			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_motoshop', function(account)
				account.addMoney(result[i].rent_price)
			end)
		end
	end)
end

TriggerEvent('cron:runAt', 22, 00, PayRent)
