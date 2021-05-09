local streetName = {}

-- Configuration. Please be careful when editing. It does not check for errors.
streetName.show = true
streetName.position = {x = 0.5, y = 0.02, centered = true}
streetName.textSize = 0.35
streetName.textColour = {r = 255, g = 255, b = 255, a = 255}
-- End of configuration


Citizen.CreateThread( function()
	local playerPed = GetPlayerPed(-1)
	local lastStreetA = 0
	local lastStreetB = 0
	local lastStreetNameA = ''
	local lastStreetNameB = ''
	local streetText = '' 

	while true do

		::continue::
		Wait( 5 )

		if not streetName.show then
			goto continue
		end 

		
		local playerPos = GetEntityCoords( playerPed)
		local streetA, streetB = GetStreetNameAtCoord(playerPos.x, playerPos.y, playerPos.z)
		local lastStreetNameA =  GetStreetNameFromHashKey( lastStreetA )
		local lastStreetNameB = GetStreetNameFromHashKey( lastStreetB )
			
		
		if not ((streetA == lastStreetA or streetA == lastStreetB) and (streetB == lastStreetA or streetB == lastStreetB)) then
			-- Ignores the switcharoo while doing circles on intersections
			lastStreetA = streetA
			lastStreetB = streetB
		end
		
		if lastStreetA ~= 0 then 
			streetText = lastStreetNameA
		end
		
		if lastStreetB ~= 0 then
			streetText = lastStreetNameA .. ' & ' .. lastStreetNameB
		end
			

		drawText(streetText  , streetName.position.x, streetName.position.y, {
			size = streetName.textSize,
			colour = streetName.textColour,
			outline = true,
			centered = streetName.position.centered
		})
	end
end)