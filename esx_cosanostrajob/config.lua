Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 3
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 0, g = 0, b = 0 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.cosanostraStations = {

  cosanostra = {

    Blip = {
      Pos     = { x = 1400.66, y = 1118.88, z = 114.83},
      Sprite  = -1,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_KNIFE',      price = 8000 },
      { name = 'WEAPON_BAT',      price = 8000 },
      { name = 'WEAPON_SNSPISTOL',      price = 50000 },
      },

	  AuthorizedVehicles = {
		  { name = 'baller5',    label = 'Baller Blidné' },
      { name = 'btype',    label = "Roosvelt" },
      { name = 'toros',    label = "Toros" },
	  },

    Cloakrooms = {
      { x = 117.2726, y = -1963.9614, z = 222222.3276}, -- Vestiaire
    },

    Armories = {
      { x = 1399.85, y = 1132.31, z = 117.49}, -- Armurerie
    },

    Vehicles = {
      {
        Spawner    = { x = 1407.58, y = 1115.29, z = 114.83 }, -- Menu véhicules
        SpawnPoint = { x = 1394.16, y = 1118.69, z = 114.83 }, -- Point d'apparitions
        Heading    = 89.36, -- Angle d'apparation
      }
    },

    VehicleDeleters = {
      { x = 1414.24, y = 1118.35, z = 114.29 }, -- Ranger véhicule
    },

    BossActions = {
      { x = 1393.08, y = 1159.71, z = 114.33 }, -- Actions Patron
    },

  },

}