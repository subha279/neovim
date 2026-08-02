return {
	"folke/trouble.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	cmd = "Trouble",

	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<CR>",
			desc = "Diagnostics",
		},

		{
			"<leader>xw",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Workspace Diagnostics",
		},

		{
			"<leader>xt",
			"<cmd>Trouble todo toggle<CR>",
			desc = "Todo",
		},

		{
			"<leader>xl",
			"<cmd>Trouble loclist toggle<CR>",
			desc = "Location List",
		},

		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<CR>",
			desc = "Quickfix",
		},
	},

	opts = {},
}
