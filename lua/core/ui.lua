local M = {}

function M.setup()
	local opt = vim.opt

	-- Numbers
	opt.number = true
	opt.relativenumber = true

	-- Appearance
	opt.termguicolors = true
	opt.colorcolumn = "80"
	opt.signcolumn = "yes"
	opt.cmdheight = 1
	opt.scrolloff = 8
	opt.laststatus = 3

	-- Conceal
	opt.conceallevel = 2
end

function M.colorscheme()
	require("utils.colors").apply_colorscheme()
end

return M
