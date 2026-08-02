local M = {}

function M.get_colorscheme()
	local ok, defaults = pcall(require, "dist.defaults")
	if ok and defaults and defaults.defaults and defaults.defaults.colorscheme then
		return defaults.defaults.colorscheme
	end
	return "onedark" -- Fallback to onedark
end

function M.get_colorscheme_config()
	local colorscheme_name = M.get_colorscheme()
	local ok, colorschemes = pcall(require, "dist.colorschemes")
	if ok and colorschemes and colorschemes.colorschemes and colorschemes.colorschemes[colorscheme_name] then
		return colorschemes.colorschemes[colorscheme_name]
	end
	return nil
end

function M.apply_colorscheme()
	local config = M.get_colorscheme_config()
	if config and config.setup then
		config.setup()
	end

	local colorscheme = M.get_colorscheme()
	local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not ok then
		vim.notify("Colorscheme " .. colorscheme .. " not found!", vim.log.levels.ERROR)
		return
	end

	if config and config.transparent then
		M.make_transparent()
	end
end

--- Clear backgrounds of floating window groups for full transparency.
function M.make_transparent()
	local groups = {
		"NormalFloat",
		"FloatBorder",
		"Pmenu",
		"PmenuThumb",
	}
	for _, group in ipairs(groups) do
		local hl = vim.api.nvim_get_hl_by_name(group, {})
		local attrs = { fg = hl.foreground, bg = "NONE" }
		local extras = {
			sp = hl.special,
			bold = hl.bold,
			italic = hl.italic,
			underline = hl.underline,
			undercurl = hl.undercurl,
			strikethrough = hl.strikethrough,
			reverse = hl.reverse,
		}
		for k, v in pairs(extras) do
			if v ~= nil then
				attrs[k] = v
			end
		end
		vim.api.nvim_set_hl(0, group, attrs)
	end
end

return M
