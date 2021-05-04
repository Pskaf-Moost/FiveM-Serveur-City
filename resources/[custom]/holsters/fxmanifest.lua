--[[
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
--]]

fx_version 'bodacious'
game 'gta5'

name 'Holsters'
description 'Removes handguns from holsters when a weapon is drawn'
author 'Jamelele'
version 'v1.1.0'
version_check 'no' -- Set this to 'no' if you don't want update checks

client_scripts {
  'config.lua',
  'client.lua'
}

server_script 'server.lua'