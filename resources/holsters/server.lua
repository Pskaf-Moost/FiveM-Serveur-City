function log(msg)
    print('^3[Holsters]^7 ' .. msg .. '^7')
end

local version = GetResourceMetadata(GetCurrentResourceName(), 'version')
if version == nil then version = 'UNKNOWN' end
local versionCheck = GetResourceMetadata(GetCurrentResourceName(), 'version_check') ~= 'no' -- Whether to check for new versions on GitHub

log('^2Successfully loaded version ' .. version)


-- Version checking
if versionCheck then
    PerformHttpRequest('https://api.github.com/repos/Jamelele/holsters/releases/latest', function(statusCode, text)
        -- Any status code that's not 200 would indicate something has gone wrong, so let's not continue
        if statusCode ~= 200 then log('^8Error retrieving latest version information from GitHub :( Status code: ' .. statusCode) return end

        local data = json.decode(text)
        if (data.tag_name) ~= version then
            log('A new version (' .. data.tag_name .. ') is available, you are currently on ' .. version .. '. You can download it from https://github.com/Jamelele/holsters/releases/latest.')
        end
    end, 'GET', "", { ["Accept"] = "application/vnd.github.v3+json",  ["User-Agent"] = "Holsters-FiveM" })
end