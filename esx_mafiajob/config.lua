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

Config.mafiaStations = {

  mafia = {

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
		  { name = 'Kuruma2',    label = 'Kuruma Blindé' },
		  { name = 'schafter3',  label = 'Shafter V12' },
		  { name = 'baller4',     label = 'Baller' },
      { name = 'rs7r',     label = 'RS7' },
      { name = 'tmaxDX_hi',     label = 'Tmax' },
	  },

    Cloakrooms = {
      { x = -1531.50, y = 142.40, z = 55.66}, -- Vestiaire
    },

    Armories = {
      { x = -1518.51, y = 114.61, z = 50.05}, -- Armurerie
    },

    Vehicles = {
      {
        Spawner    = { x = -1535.50, y = 95.07, z = 56.75 }, -- Menu véhicules
        SpawnPoint = { x = -1533.19, y = 81.66, z = 56.77 }, -- Point d'apparitions
        Heading    = 311.73, -- Angle d'apparation
      }
    },

    VehicleDeleters = {
      { x = -1524.60, y = 63.35, z = 56.52 }, -- Ranger véhicule
    },

    BossActions = {
      { x = -1496.52, y = 127.74, z = 55.66 }, -- Actions Patron
    },

  },

}