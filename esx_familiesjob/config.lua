Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 3
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 0, g = 182, b = 19 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.familiesStations = {

  families = {

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
      { x = -910.10, y = 9940.11, z = 2340.56}, -- Vestiaire
    },

    Armories = {
      { x = -136.68, y = -1608.70, z = 35.03}, -- Armurerie
    },

    Vehicles = {
      {
        Spawner    = { x = -139.92, y = -1561.16, z = 34.43 }, -- Menu véhicules
        SpawnPoint = { x = -143.05, y = -1558.18, z = 34.46 }, -- Point d'apparitions
        Heading    = 318.50, -- Angle d'apparation
      }
    },

    VehicleDeleters = {
      { x = -151.63, y = -1550.45, z = 34.79 }, -- Ranger véhicule
    },

    BossActions = {
      { x = -157.07, y = -1602.87, z = 35.04 }, -- Actions Patron
    },

  },

}