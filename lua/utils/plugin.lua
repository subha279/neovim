local M = {}

function M.load(spec, flag)
	if flag == nil or require("dist.features").features[flag] then
		return spec
	end
	return {}
end

return M
