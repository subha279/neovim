local M = {}

M.colorschemes = {
	onedark = {
		transparent = true,
		setup = function()
			require("onedark").setup({
				style = "darker",
				transparent = true,
			})
		end,
	},
}

return M
