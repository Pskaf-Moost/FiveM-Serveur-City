Config = {}
Config.Locale = 'fr'

Config.Removeables = {
	-- true = Removes when used | false = Does opposite of true
	Bandage = true,
	BulletProofVest = true,
	Defib = true,
	Drill = false,
	Firework = true,
	FirstAidKit = true,
	OxygenMask = true,
	RepairKit = true,
	TireKit = true,
	WeaKit = false,
	-- true = Removes if Failed | false = Doesn't remove if Failed
	LockPick = true
}

-- Item Scenario Wait Times in MS
Config.Wait = {
	Drill = 10000,
	LockPick = 10000,
	RepairKit = 10000,
	TireKit = 10000
}

Config.Heal = true -- true = Will allow First Aid Kits to Heal Players | false = Will give 3 Bandages

-- Binoculars
Config.BinocularsPutAway = 177 -- Backspace Key


-- Vehicle GPS
Config.GPS = {
	VehicleGPS = false, -- Set to true to use Vehicle GPS.
	LimitedVehicles = true, -- Set to true to only allow Aircrafts, Boats, & Cars to use GPS.
	OnlyFrontSeats = false, -- Set to true to only allow the front 2 seats to be able to see Radar if they used it.
	BikeGPS = {
		'sanchez'
	}
}
