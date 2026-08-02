local load = require("utils.plugin").load

return {
	load(require("plugins.lsp.conform"), "lsp"),
	load(require("plugins.lsp.lspconfig"), "lsp"),
	load(require("plugins.lsp.mason"), "lsp"),
}
