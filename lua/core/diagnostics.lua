local M = {}

function M.setup()
	for name, icon in pairs(require("utils.icons").diagnostics) do
		local sign = "DiagnosticSign" .. name
		vim.fn.sign_define(sign, { text = icon, texthl = sign, numhl = sign })
	end

	vim.diagnostic.config({
		virtual_text = true,
		signs = {
			active = vim.fn.sign_getdefined(),
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})
end

return M
