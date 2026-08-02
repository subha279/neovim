return {
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		config = function()
			vim.g.minianimate_config = {
				-- Window navigation
				open = {
					enable = true,
					timing = "sine",
					duration = 300,
					delay = 0,
					direction = "top",
				},
				close = {
					enable = true,
					timing = "sine",
					duration = 300,
					delay = 0,
					direction = "top",
				},

				-- cursor movement
				cursor = {
					enable = true,
					timing = "ease_out",
					duration = 100,
					delay = 0,
				},

				-- Scroll movement
				scroll = {
					enable = true,
					timing = "ease_out",
					duration = 100,
					delay = 0,
				},

				-- Resize movement
				resize = {
					enable = true,
					timing = "ease_out",
					duration = 100,
					delay = 0,
				},
			}
			require("mini.animate").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"echasnovski/mini.indentscope",
		event = "VeryLazy",
		config = function()
			require("mini.indentscope").setup()
		end,
	},
}
