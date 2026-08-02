vim.g.startuptime_ref = vim.uv.hrtime()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	defaults = {
		lazy = true,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrw",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
		cache = {
			enabled = true,
		},
	},
	change_detection = {
		notify = false,
	},
	rocks = {
		enabled = false,
	},
	spec = {
		{ import = "plugins.ui" },
		{ import = "plugins.editor" },
		{ import = "plugins.coding" },
		{ import = "plugins.lsp" },
		{ import = "plugins.git" },
		{ import = "plugins.languages" },
		{ import = "plugins.debugging" },
		{ import = "plugins.completion" },
		{ import = "plugins.utilities" },
	},
}

require("lazy").setup(opts)
