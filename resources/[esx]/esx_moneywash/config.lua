Config 					= {}

Config.Locale 			= 'fr'
Config.DrawDistance 	= 10


local second = 1000
local minute = 60 * second
local hour = 60 * minute

--[[ 
	Below are the zones for laundering. You can set multiple zones just follow the format below. 
	Failure to do so will result in the script breaking.
	Set the job to 'any' if you want anybody to use the location. Otherwise set the required job you want to use for the location
	Any job not allowed to use the location WILL NOT see a marker or get a popup to use it.

	
	EXAMPLE LOCATION!!! JUST COPY THIS AND PASTE TO ADD MORE LOCATIONS!
		
	{
		Pos = {
			{x = 1090.84 , y = -2233.43 , z = 31.5}
		},
		
		Jobs = {
			--'any', -- SET THE 'any' TAG TO ALLOW ALL JOBS INCLUDING POLICE TO USE THE LOCATION
			--'miner',
			--'cardealer'
		},
		TaxRate = 0.50, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
	},
	
]]

Config.Zones = {
	
	['LaundryMat'] = {	
		Pos = { 
			{x = 2711.6 , y = 2783.2 , z = 36.8}, 
		},
		
		Jobs = {
			--'any', -- set to 'any' to allow the location for any player regardless of job
			'any'
		},
		TaxRate = 0.95, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r =0, g = 255, b = 0},
		Type = 1,
	
	},
	
	['Warehouse'] = {
		Pos = {
			{x = 1086.3 , y = -2289.4 , z = 29.2}
		},
		
		Jobs = {
			--'any', -- set to 'any' to allow the location for any player regardless of job
			'any'
		},
		TaxRate = 0.85, -- set taxrate per spot. Default is 0.85 or 85% of the dirty you will get back in clean
		enableTimer = true, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 0, g = 255, b = 0},
		Type = 1,
	
	}
}
