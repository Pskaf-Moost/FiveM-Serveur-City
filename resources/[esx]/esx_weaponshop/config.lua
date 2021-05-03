Config               = {}

Config.DrawDistance  = 100
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 0, g = 128, b = 255 }
Config.Type          = 1

Config.Locale        = 'fr'

Config.LicenseEnable = true -- only turn this on if you are using esx_license
Config.LicensePrice  = 500

Config.WeaponAmmos = {
    {
		item = 'ammobox_pistol',
		weapon = 'WEAPON_PISTOL',
		amount = 20,
		price = 100
	},
    {
		item = 'ammobox_smg',
		weapon = 'WEAPON_MICROSMG',
		amount = 30,
		price = 100
	},
    {
		item = 'ammobox_shotgun',
		weapon = 'WEAPON_PUMPSHOTGUN',
		amount = 20,
		price = 100
	},
    {
		item = 'ammobox_assaultrifle',
		weapon = 'WEAPON_ASSAULTRIFLE',
		amount = 30,
		price = 100
	},
    {
		item = 'ammobox_specialcarbine',
		weapon = 'WEAPON_SPECIALCARBINE',
		amount = 20,
		price = 100
	},
    {
		item = 'ammobox_sniperrifle',
		weapon = 'WEAPON_SNIPERRIFLE',
		amount = 10,
		price = 100
	},
    {
		item = 'ammobox_apppistol',
		weapon = 'WEAPON_APPISTOL',
		amount = 20,
		price = 100
	},
    {
		item = 'ammobox_carbinerifle',
		weapon = 'WEAPON_CARBINERIFLE',
		amount = 10,
		price = 100
	},
    {
		item = 'ammobox_heavysniper',
		weapon = 'WEAPON_HEAVYSNIP',
		amount = 5,
		price = 100
	}
}

Config.Zones = {

	GunShop = {
		Legal = true,
		Items = {},
		Locations = {
			vector3(-662.1, -935.3, 20.8),
			vector3(810.2, -2157.3, 28.6),
			vector3(1693.4, 3759.5, 33.7),
			vector3(-330.2, 6083.8, 30.4),
			vector3(252.3, -50.0, 68.9),
			vector3(22.0, -1107.2, 28.8),
			vector3(2567.6, 294.3, 107.7),
			vector3(-1117.5, 2698.6, 17.5),
			vector3(842.4, -1033.4, 27.1)
		}
	},

	BlackWeashop = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(-1306.2, -394.0, 35.6)
		}
	}

}
