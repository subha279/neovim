local M = {}

local function on_attach(client, bufnr)
	-- Keymaps
	local keymap = require("utils.keymap").keymap
	keymap("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "LSP Declaration" })
	keymap("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP Definition" })
	keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover" })
	keymap("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "LSP Implementation" })
	keymap("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "LSP Signature Help" })
	keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = "LSP Add Workspace Folder" })
	keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { buffer = bufnr, desc = "LSP Remove Workspace Folder" })
	keymap("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { buffer = bufnr, desc = "LSP List Workspace Folders" })
	keymap("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "LSP Type Definition" })
	keymap("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "LSP Rename" })
	keymap("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP Code Action" })
	keymap("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "LSP References" })
	keymap("n", "<leader>ed", vim.diagnostic.open_float, { buffer = bufnr, desc = "LSP Diagnostic" })
	keymap("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "LSP Previous Diagnostic" })
	keymap("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "LSP Next Diagnostic" })
	keymap("n", "<leader>q", vim.diagnostic.setloclist, { buffer = bufnr, desc = "LSP Diagnostic Setloclist" })

	-- Navic
	if client:supports_method("textDocument/documentSymbol", bufnr) then
		require("nvim-navic").attach(client, bufnr)
	end
end

function M.setup()
	-- Servers
	local servers = {
		"lua_ls",
		"pyright",
		"ruff",
		"clangd",
		"ts_ls",
		"html",
		"cssls",
		"jsonls",
		"yamlls",
		"bashls",
		"dockerls",
		"docker_compose_language_service",
		"tailwindcss",
		"emmet_language_server",
		"taplo",
		"marksman",
		"terraformls",
		"lemminx",
		"jdtls",
		"intelephense",
		"qmlls",
	}
	local capabilities = require("utils.lsp").get_capabilities()

	for _, server in ipairs(servers) do
		local opts = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		vim.lsp.config(server, opts)
		vim.lsp.enable(server)
	end
end

return M
