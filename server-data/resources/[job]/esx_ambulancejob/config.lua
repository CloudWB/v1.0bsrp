Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 102, g = 0, b = 102 }
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.5 }
Config.ReviveReward               = 1000  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders
Config.Locale                     = 'fr'

local second = 1000
local minute = 60 * second

-- How much time before auto respawn at hospital
Config.RespawnDelayAfterRPDeath   = 10 * minute

Config.EnablePlayerManagement       = true
Config.EnableSocietyOwnedVehicles   = false

Config.RemoveWeaponsAfterRPDeath    = true
Config.RemoveCashAfterRPDeath       = false
Config.RemoveItemsAfterRPDeath      = false

-- Will display a timer that shows RespawnDelayAfterRPDeath as a countdown
Config.ShowDeathTimer               = true

-- Will allow respawn after half of RespawnDelayAfterRPDeath has elapsed.
Config.EarlyRespawn                 = false
-- The player will be fined for respawning early (on bank account)
Config.EarlyRespawnFine                  = true
Config.EarlyRespawnFineAmount            = 5000

Config.Blip = {
	Pos     = { x = 289.93, y = -588.36, z = 43.17 },
	Sprite  = 61,
	Display = 4,
	Scale   = 1.2,
	Colour  = 2,
}

Config.HelicopterSpawner = {
	SpawnPoint = { x = 313.33, y = -1465.2, z = 45.5 },
	Heading    = 0.0
}

-- https://wiki.fivem.net/wiki/Vehicles
Config.AuthorizedVehicles = {

	{
		model = 'ambulance',
		label = 'Ambulance'
	},
	{
		model = 'dodgeEMS',
		label = 'Dodge'
	}

}

Config.Zones = {

	HospitalInteriorEntering1 = { -- Main entrance 
		Pos	= { x = 298.50, y = -584.70, z = -43.00 },
		Type = 1
	},

	HospitalInteriorInside1 = {
		Pos	= { x = 302.5, y = -585.60, z = -43.20 },
		Type = -1
	},

	HospitalInteriorOutside1 = {
		Pos	= { x = 297.60, y = -583.50, z = -43.25 },
		Type = -1
	},

	HospitalInteriorExit1 = {
		Pos	= { x = 301.00, y = -585.40, z = -43.30 },
		Type = 1
	},

	HospitalInteriorEntering2 = { -- Lift go to the roof helico
		Pos	= { x = 325.44, y = -598.81, z = -43.25 },
		Type = 1
	},

	HospitalInteriorInside2 = { -- Roof outlet sortie helico
		Pos	= { x = 341.56,	y = -584.52, z = -74.16 },
		Type = -1
	},

	HospitalInteriorOutside2 = { -- Lift back from roof sortie haut
		Pos	= { x = 324.51,	y = -598.12, z = -43.25 },
		Type = -1
	},

	HospitalInteriorExit2 = { -- Roof entrance entrer haut
		Pos	= { x = 338.59, y = -583.85, z = -74.16 },
		Type = 1
	},

	AmbulanceActions = { -- Cloakroom
		Pos	= { x = 314.201, y = -603.446, z = 42.538 },
		Type = 1
	},

	VehicleSpawner = {
		Pos	= { x = 342.245, y = -575.65, z = 28.89 },
		Type  = 39, Rotate = true
	},

	VehicleSpawnPoint = {
		Pos	= { x = 325.689, y = -567.38, z = 28.74 },
		Type = -1, Rotate = false,
		Heading = 338.699000
	},

	VehicleDeleter = {
		Pos	= { x = 337.227, y = -571.930, z = 28.5 },
		Type = 24
	},

	Pharmacy = {
		Pos	= { x = 337.956, y = -586.127, z = 28.898 },
		Type = 22, Rotate = false
	},

	ParkingDoorGoOutInside = { --entrer vehicule
		Pos	= { x = 325.52, y = -588.31, z = -43.26 },
		Type = 1
	},

	ParkingDoorGoOutOutside = { -- sortie vehicule
		Pos	= { x = 319.93, y = -557.26, z = -28.74 },
		Type = -1
	},

	ParkingDoorGoInInside = { -- sortie 2
		Pos	= { x = 324.36, y = -591.37, z = -43.26 },
		Type = -1
	},

	ParkingDoorGoInOutside = { -- entrer 2
		Pos	= { x = 319.57, y = -560.11, z = -28.74 },
		Type = 1
	},

	StairsGoTopTop = { --racoursie
		Pos	= { x = 251.91, y = -1363.3, z = 38.53 },
		Type = -1
	},

	StairsGoTopBottom = { --racoursie
		Pos	= { x = 237.45, y = -1373.89, z = 26.30 },
		Type = -1
	},

	StairsGoBottomTop = { --racoursie
		Pos	= { x = 256.58, y = -1357.7, z = 37.30 },
		Type = -1
	},

	StairsGoBottomBottom = { --racoursie
		Pos	= { x = 235.45, y = -1372.89, z = 26.30 },
		Type = -1
	}

}

