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

-- Created by Jamelele

-- Take a look at the documentation for configuring:
-- https://github.com/Jamelele/holsters/wiki/Configuration-Guide

config = {
  ["weapon"] = { "WEAPON_PISTOL", "WEAPON_COMBATPISTOL" },
  ["peds"] = {
    ["mp_m_freemode_01"] = { -- Male multiplayer ped
      ["components"] = {
        [7] = { -- Component ID, "Neck" or "Teeth" category
          [1] = 3, -- Drawable ID, can specify multiple, separated by comma and or line breaks
          [6] = 5,
          [8] = 2,
          [42] = 43,
          [110] = 111,
          [119] = 120
        },
        [8] = { 
          [16] = 18
        }
      }
    },
    ["mp_f_freemode_01"] = { -- Female multiplayer ped
      ["components"] = {
        [7] = { -- Component ID, "Neck" or "Teeth" category
          [1] = 3,
          [6] = 5,
          [8] = 2,
          [29] = 30,
          [81] = 82
        },
        [8] = {
          [9] = 10
        }
      }
    },
    ["s_m_y_hwaycop_01"] = {
      ["enabled"] = true, -- true/false. Optional field, the ped will default as enabled
      ["components"] = {
        [9] = {
          [1] = 0
        }
      }
    },
    ["s_m_y_cop_01"] = {
      ["components"] = {
        [9] = {
          [1] = 0
        }
      }
    },
    ["s_m_y_sheriff_01"] = {
      ["components"] = {
        [9] = {
          [1] = 0
        }
      }
    },
  }
}