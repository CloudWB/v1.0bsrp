Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 3
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 239, g = 224, b = 0 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.CircleZones = {
    DrugDealer = {coords = vector3(-173.718, -1547.2945, 35.127), name = _U('map_blip'), color = 25, sprite = 84, radius = 110.0},
}

Config.FamilliesStations = {
  Famillies = {

    AuthorizedWeapons = {
      { name = 'WEAPON_COMBATPISTOL',     price = 4000 },
      { name = 'WEAPON_ASSAULTSMG',       price = 15000 },
      { name = 'WEAPON_ASSAULTRIFLE',     price = 25000 },
      -- { name = 'WEAPON_PUMPSHOTGUN',      price = 9000 },
      -- { name = 'WEAPON_STUNGUN',          price = 250 },
      { name = 'WEAPON_FLASHLIGHT',       price = 50 },
      { name = 'WEAPON_FIREEXTINGUISHER', price = 50 },
      -- { name = 'WEAPON_FLAREGUN',         price = 3000 },
      { name = 'GADGET_PARACHUTE',        price = 2000 },
      -- { name = 'WEAPON_SNIPERRIFLE',      price = 50000 },
      -- { name = 'WEAPON_FIREWORK',         price = 5000 },
      -- { name = 'WEAPON_BZGAS',            price = 8000 },
      -- { name = 'WEAPON_SMOKEGRENADE',     price = 8000 },
      { name = 'WEAPON_APPISTOL',         price = 12000 },
      { name = 'WEAPON_CARBINERIFLE',     price = 25000 },
      -- { name = 'WEAPON_HEAVYSNIPER',      price = 100000 },
      { name = 'WEAPON_FLARE',            price = 8000 },
      { name = 'WEAPON_SWITCHBLADE',      price = 500 },
	  { name = 'WEAPON_REVOLVER',         price = 6000 },
	  { name = 'WEAPON_POOLCUE',          price = 100 },
	  -- { name = 'WEAPON_GUSENBERG',        price = 17500 },

    },

	  AuthorizedVehicles = {
		  { name = 'tornado',    label = 'Tornado' },
		  { name = 'buccaneer',  label = 'Buccaneer' },
		  { name = 'peyote',     label = 'Peyote' },
		  { name = 'speedo',     label = 'Cammionette' },
	  },

    Cloakrooms = {
      { x = 353.286, y = -2036.662, z = 0 }, -- fait
    },

    Armories = {
      { x = -137.2207, y = -1609.9901, z = 35.0301 }, -- fait
    },

    Vehicles = {
      {
      Spawner    = { x = -231.519, y = -1692.376, z = 33.812 }, -- fait
      SpawnPoint = { x = -228.248, y = -1700.814, z = 33.969 }, -- fait
        Heading    = 142.937, -- fait
      }
    },

    VehicleDeleters = {
      { x = -223.624, y = -1707.051, z = 33.918 }, -- fait
    },

    BossActions = {
      { x = -131.3046, y = -1606.5225, z = 35.0302 } -- fait
    },

  },

}
