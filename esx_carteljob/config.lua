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

Config.cartelStations = {

  cartel = {

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
      { x = -91.10, y = 994.11, z = 234.56}, -- Vestiaire
    },

    Armories = {
      { x = 5002.29, y = -5752.71, z = 28.68}, -- Armurerie
    },

    Vehicles = {
      {
        Spawner    = { x = 4977.44, y = -5713.78, z = 19.88 }, -- Menu véhicules
        SpawnPoint = { x = 4966.99, y = -5711.31, z = 19.65 }, -- Point d'apparitions
        Heading    = 345.44, -- Angle d'apparation
      }
    },

    VehicleDeleters = {
      { x = -112.26, y = 1002.57, z = 235.76 }, -- Ranger véhicule
    },

    BossActions = {
      { x = 5013.55, y = -5754.83, z = 28.90 }, -- Actions Patron
    },

  },

}