local M = {}

function M.setup()
	require("nvim-ts-autotag").setup()

	local ts = require("nvim-treesitter")
	local parsers = require("nvim-treesitter.parsers")

	-- Install essential parsers (no-op for already-installed)
	ts.install({ "c", "lua", "bash", "python", "css", "html", "json", "yaml" })

	-- Auto-install parser when opening a file whose language is missing
	vim.api.nvim_create_autocmd("FileType", {
		callback = function(args)
			local lang = vim.bo[args.buf].filetype
			if lang and lang ~= "" and parsers[lang] then
				ts.install(lang)
			end
		end,
	})
end

return M
