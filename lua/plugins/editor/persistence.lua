return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- start session tracking once a file is opened
	keys = {
		{ "<leader>ss", function() require("persistence").save() end, desc = "Save Session" },
		{ "<leader>sr", function() require("persistence").load() end, desc = "Restore Session" },
		{ "<leader>sR", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
	},
	opts = {
		dir = vim.fn.stdpath("state") .. "/sessions/",
		need = 1, -- minimum number of file buffers to save
		branch = true, -- save per git branch
	},
}
