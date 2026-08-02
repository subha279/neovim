return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Fuzzy find files in cwd" },
    { "<leader>th", function() require("telescope.builtin").colorscheme() end, desc = "Change Color Scheme" },
    { "<leader>fo", function() require("telescope.builtin").oldfiles() end, desc = "Fuzzy find recent files" },
    { "<leader>fl", function() require("telescope.builtin").live_grep() end, desc = "Find string in cwd" },
    { "<leader>fg", function() require("telescope.builtin").grep_string() end, desc = "Find string under cursor in cwd" },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
  },
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				file_ignore_patterns = {
					"node_modules",
					".git/",
					"dist",
					"build",
					"__pycache__",
				},
				preview = {
					-- Telescope's Tree-sitter preview API is incompatible with the installed parser API.
					treesitter = false,
				},
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<Esc>"] = actions.close,
					},
					n = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<Esc>"] = actions.close,
					},
				},
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("todo-comments")
	end,
}
