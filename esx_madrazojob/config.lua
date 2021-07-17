Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 3
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 255, g = 247, b = 0 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.madrazoStations = {

  madrazo = {

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
		  { name = 'Sultan',    label = 'Sultan' },
		  { name = 'Chino2',  label = 'Chino' },
		  { name = 'manchez',     label = 'Manchez' },
      { name = 'rumpo3',     label = 'Rumpo' },
	  },

    Cloakrooms = {
      { x = 3420.39, y = -20150.11, z = 250.59}, -- Vestiaire
    },

    Armories = {
      { x = 337.19, y = -2011.86, z = 22.39}, -- Armurerie
    },

    Vehicles = {
      {
        Spawner    = { x = 334.61, y = -2026.72, z = 21.61 }, -- Menu véhicules
        SpawnPoint = { x = 331.10, y = -2037.23, z = 20.99 }, -- Point d'apparitions
        Heading    = 55.77, -- Angle d'apparation
      }
    },

    VehicleDeleters = {
      { x = 324.74, y = -2038.48, z = 20.69 }, -- Ranger véhicule
    },

    BossActions = {
      { x = 348.84, y = -2028.95, z = 22.39 }, -- Actions Patron
    },

  },

}