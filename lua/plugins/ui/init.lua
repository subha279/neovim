return {
	require("utils.plugin").load(require("plugins.ui.alpha"), "dashboard"),
	require("plugins.ui.animation"),
	require("plugins.ui.bufferline"),
	require("plugins.ui.color-scheme"),
	require("plugins.ui.highlight-color"),
	require("plugins.ui.highlight-yanked"),
	require("plugins.ui.lualine"),
	require("plugins.ui.maximizer"),
	require("plugins.ui.trouble"),
	require("plugins.ui.which-key"),
}
