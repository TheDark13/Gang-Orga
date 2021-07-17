Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 3
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 0, g = 158, b = 255 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.cripsStations = {

  crips = {

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
      { x = 1438.29, y = -1489.59, z = 66.61}, -- Armurerie
    },

    Vehicles = {
      {
        Spawner    = { x = 1427.48, y = -1506.30, z = 61.40 }, -- Menu véhicules
        SpawnPoint = { x = 1436.88, y = -1508.40, z = 62.32 }, -- Point d'apparitions
        Heading    = 93.90, -- Angle d'apparation
      }
    },

    VehicleDeleters = {
      { x = 1422.44, y = -1504.68, z = 60.91 }, -- Ranger véhicule
    },

    BossActions = {
      { x = 1445.12, y = -1488.12, z = 66.61 }, -- Actions Patron
    },

  },

}