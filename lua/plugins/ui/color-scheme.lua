return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("core.ui").colorscheme()
	end,
}
