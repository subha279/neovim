return {
	"williamboman/mason.nvim",
	cmd = {
		"Mason",
		"MasonInstall",
		"MasonUninstall",
		"MasonUpdate",
		"MasonLog",
		"MasonToolsInstall",
		"MasonToolsUpdate",
	},
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("config.mason").setup()
	end,
}
