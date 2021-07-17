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

Config.ms13Stations = {

  ms13 = {

    Blip = {
      Pos     = { x = -125.04, y = -988.27, z = 235.74},
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
		  { name = 'xls2',    label = 'XLS Blindé' },
		  { name = 'schafter3',  label = 'Shafter V12' },
		  { name = 'rumpo3',     label = 'Rumpo' },
	  },

    Cloakrooms = {
      { x = 117.2726, y = -1963.9614, z = 2222.3276}, -- Vestiaire
    },

    Armories = {
      { x = 9.421, y = 528.79, z = 170.63}, -- Armurerie
    },

    Vehicles = {
      {
        Spawner    = { x = 13.78, y = 543.15, z = 176.01 }, -- Menu véhicules
        SpawnPoint = { x = 15.41, y = 548.68, z = 176.24 }, -- Point d'apparitions
        Heading    = 62.98, -- Angle d'apparation
      }
    },

    VehicleDeleters = {
      { x = 22.57, y = 544.47, z = 176.02 }, -- Ranger véhicule
    },

    BossActions = {
      { x = -9.96, y = 531.01, z = 170.61 }, -- Actions Patron
    },

  },

}