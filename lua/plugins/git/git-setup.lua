return {
	{
		"tpope/vim-fugitive",
		lazy = false,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			signs_staged = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
		config = function(_, opts)
			require("gitsigns").setup(opts)
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns Preview Hunk" })
			vim.keymap.set(
				"n",
				"<leader>gt",
				":Gitsigns toggle_current_line_blame<CR>",
				{ desc = "Gitsigns Toggle Current Line Blame" }
			)

			-- Actions
			vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Gitsigns Blame Line" })
			vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns Preview Hunk" })
			vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Gitsigns Reset Hunk" })
			vim.keymap.set("n", "<leader>gR", ":Gitsigns reset_buffer<CR>", { desc = "Gitsigns Reset Buffer" })
			vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Gitsigns Stage Hunk" })
			vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Gitsigns Undo Stage Hunk" })

			-- Navigation
			vim.keymap.set("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, desc = "Next Hunk" })
			vim.keymap.set("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, desc = "Previous Hunk" })
		end,
	},
}
