# ESX SIMPLEGARAGES - ADVANCED BUT SIMPLE GARAGE SYSTEM FOR LEGACY ESX1.2
Author: Dividerz -> https://forum.cfx.re/u/dividerz/summary

Support: https://discord.gg/WxZ83u3 - New Discord Server for support

**DEPENDENCIES**

- es_extended
- LegacyFuel
- esx_vehicleshop

**HOW IT WORKS**

Well, its just another basic garage script, but rather lightweight with some nice extras.

**FEATURES**

- Saves fuel in database (LegacyFuel exports) and restores it on vehicle when spawning it
- Saves engine health in database and restores it on vehicle when spawning it
- Vehicle can only be spawned in the garage it initially got stored
- Vehicle stays visible in garage even if its impounded or in the car depot, but you can't get it out
- Easy to edit config and easy to add garages

**COMMANDS**

For Police:
- /policeimpound -> Send vehicle to an impound that players can't access

For Police and Mechanic (mecanojob)
- /impound PRICE -> Send vehicle to a public impound with a price owner needs to pay to get his/her vehicle back

**INSTALLATION**

Import the .sql file in your database. Drag and drop the resource in your ESX folder and start it by using ```ensure esx_simplegarages``` in your server.cfg file.


