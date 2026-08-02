return {
	"stevearc/conform.nvim",

	dependencies = {
		"williamboman/mason.nvim",
	},

	event = { "BufWritePre" },

	cmd = { "ConformInfo" },

	keys = {
		{
			"<leader>gf",
			function()
				require("conform").format({
					async = true,
					lsp_format = "fallback",
				})
			end,
			desc = "Format Buffer",
		},
	},

	opts = {
		----------------------------------------------------------
		-- Formatter Mapping
		----------------------------------------------------------
		formatters_by_ft = {
			lua = { "stylua" },

			python = { "isort", "black" },

			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },

			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },

			json = { "prettier" },
			jsonc = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },

			sh = { "shfmt" },
			bash = { "shfmt" },
			zsh = { "shfmt" },

			c = { "clang_format" },
			cpp = { "clang_format" },

			toml = { "taplo" },

			terraform = { "terraform_fmt" },
		},
		----------------------------------------------------------
		-- Format on Save
		----------------------------------------------------------
		format_on_save = function(bufnr)
			local disable_filetypes = {
				c = true,
				cpp = true,
			}

			return {
				timeout_ms = 1500,

				lsp_format = disable_filetypes[vim.bo[bufnr].filetype] and "never" or "fallback",
			}
		end,

		----------------------------------------------------------
		-- Formatter Options
		----------------------------------------------------------
		default_format_opts = {
			timeout_ms = 1500,
			async = false,
			quiet = true,
		},

		notify_on_error = true,

		notify_no_formatters = false,
	},
}
