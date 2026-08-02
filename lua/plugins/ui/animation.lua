return {
	"s1n7ax/nvim-window-picker",
	name = "window-picker",
	event = "VeryLazy",
	version = "2.*",
	config = function()
		require("window-picker").setup({
			autoselect_one = true,
			include_tabs = false,
			filter_rules = {
				bo = {
					filetype = { "neo-tree", "neo-tree-popup", "notify" },
					buftype = { "terminal" },
				},
			},
			other_win_hl_color = "#e35f5f",
		})
	end,
}
