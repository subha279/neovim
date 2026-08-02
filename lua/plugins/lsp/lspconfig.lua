return {
	"neovim/nvim-lspconfig",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"SmiteshP/nvim-navic",
		"antosha417/nvim-lsp-file-operations",
		"b0o/SchemaStore.nvim",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {},
		},
	},
	config = function()
		require("config.lsp").setup()
	end,
}
