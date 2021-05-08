-- Made by Ramsus --
Config = {}
Config.Locale = 'fr'

-- Locations
Config.OutsideLocation = vector3(1847.95, 2586.26, 45.60)
Config.JailSpawnLocation = vector3(1638.07, 2542.61, 45.56)
Config.PrisonBlip = vector3(1858.0, 2606.0, 45.0)
Config.OutsideLocationPJail = vector3(432.34, -984.17, 30.71)
Config.UpdateTime = 60000 -- MS

-- Escape
Config.DrawDistance = 10
Config.EscapeAttempt = vector3(1831.34, 2603.36, 44.9)
Config.Color = {r = 0, g = 0, b = 255}
Config.Item = 'bread'
Config.Job = 'police'
Config.AdminTitle = 'admin'
Config.Mhacking = false
Config.TimeToAlarm = math.random(2000, 5000)
Config.TimeToHack = math.random(2000, 10000)
Config.TimeAlarmLeft = 40000 -- MS

-- Jail Blip
Config.BlipSprite = 188
Config.BlipColor = 63
Config.BlipScale = 0.9

-- Discord Webhooks
Config.IsWebhookEnabled = false
Config.WebhookLink = "https://discord.com/api/webhooks/"
Config.BotName = "Server"
Config.Logo = "" -- Must end with .png

-- Uniforms
Config.Wear = {
		Male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 146, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 0,   ['pants_1']  = 3,
			['pants_2']  = 7,   ['shoes_1']  = 12,
			['shoes_2']  = 12,  ['chain_1']  = 50,
			['chain_2']  = 0
		},
		Female = {
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
			['torso_1']  = 38,  ['torso_2']  = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 2,   ['pants_1']  = 3,
			['pants_2']  = 15,  ['shoes_1']  = 66,
			['shoes_2']  = 5,   ['chain_1']  = 0,
			['chain_2']  = 2
		}
}