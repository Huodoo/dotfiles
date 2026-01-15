local M = {}

-- Returns true when the current Neovim version is at least the provided minimum.
-- Accepts either a string "0.10.0"/"0.10" or a table { major=0, minor=10, patch=0 }.
local function normalize(min_version)
	if type(min_version) == "string" then
		local major, minor, patch = min_version:match("^(%d+)%.(%d+)%.?(%d*)$")
		if not major then
			return nil
		end
		return {
			major = tonumber(major),
			minor = tonumber(minor),
			patch = tonumber(patch) or 0,
		}
	elseif type(min_version) == "table" then
		local major = tonumber(min_version.major or min_version[1])
		local minor = tonumber(min_version.minor or min_version[2] or 0)
		local patch = tonumber(min_version.patch or min_version[3] or 0)
		if major and minor then
			return { major = major, minor = minor, patch = patch }
		end
	end
	return nil
end

function M.nvim_at_least(min_version)
	local min = normalize(min_version)
	if not min then
		return false
	end

	local v = vim.version()
	if v.major ~= min.major then
		return v.major > min.major
	end
	if v.minor ~= min.minor then
		return v.minor > min.minor
	end
	return (v.patch or 0) >= (min.patch or 0)
end

return M
