local M = {}

function M.setup()
	-- import mason
	local mason = require("mason")

	-- import mason-lspconfig
	local mason_lspconfig = require("mason-lspconfig")

	local mason_tool_installer = require("mason-tool-installer")

	-- enable mason and configure icons
	mason.setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	mason_lspconfig.setup({
		automatic_installation = false,
		handlers = {
			function(server_name)
				if require("mason-registry").is_installed(server_name) then
					vim.lsp.enable(server_name)
				else
					require("utils.prompt").prompt("Install " .. server_name .. "?", { "Yes", "No" }, function(choice)
						if choice == "Yes" then
							vim.cmd("MasonInstall " .. server_name)
						end
					end)
				end
			end,
		},
	})

	mason_tool_installer.setup({
		ensure_installed = {
			-- Lua
			"lua-language-server",
			"stylua",

			-- Python
			"pyright",
			"black",
			"isort",
			"ruff",

			-- C/C++
			"clangd",
			"clang-format",

			-- Web
			"typescript-language-server",
			"prettier",
			"html-lsp",
			"css-lsp",
			"json-lsp",
			"yaml-language-server",

			-- Shell
			"bash-language-server",
			"shellcheck",
			"shfmt",

			-- Docker
			"dockerfile-language-server",
			"docker-compose-language-service",

			-- Markdown
			"marksman",

			-- Tailwind
			"tailwindcss-language-server",

			-- Emmet
			"emmet-language-server",

			-- TOML
			"taplo",

			-- Terraform
			"terraform-ls",

			-- XML
			"lemminx",

			-- Java
			"jdtls",

			-- PHP
			"intelephense",

			-- QML
			"qmlls",
		},
	})
end

return M
