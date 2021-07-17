Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 3
Config.MarkerSize                 = { x = 1.0, y = 2.0, z = 1.0 }
Config.MarkerColor                = { r = 158, g = 0, b = 255 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.ballasStations = {

  ballas = {

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
        { name = 'primo2',  label = 'Primo' },
        { name = 'manchez',     label = 'Manchez' },
        { name = 'rumpo3',     label = 'Rumpo' },
      },

    Cloakrooms = {
      { x = -91.100, y = 994.110, z = 234.560}, -- Vestiaire
    },

    Armories = {
      { x = 106.71, y = -1981.31, z = 20.96}, -- Armurerie
    },

    Vehicles = {
      {
        Spawner    = { x = 114.36, y = -1949.56, z = 20.63 }, -- Menu véhicules
        SpawnPoint = { x = 104.95, y = -1941.19, z = 20.80 }, -- Point d'apparitions
        Heading    = 45.53, -- Angle d'apparation
      }
    },

    VehicleDeleters = {
      { x = 89.73, y = -1966.37, z = 20.74 }, -- Ranger véhicule
    },

    BossActions = {
      { x = 119.61, y = -1968.37, z = 21.32 }, -- Actions Patron
    },

  },

}