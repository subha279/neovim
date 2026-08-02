return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	keys = {
		{ "[b", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
		{ "]b", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
		{ "gb", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
		{ "<leader>bd", "<cmd>BufferLineClose<CR>", desc = "Close Buffer" },
	},
	opts = {
		options = {
			mode = "buffers",
			style_preset = "default",
			show_buffer_close_icons = true,
			show_close_icon = false,
			buffer_close_icon = "x",
			close_icon = "x",
			modified_icon = "●",
			show_buffer_icons = true,
			always_show_bufferline = true,
			separator_style = "thin",
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "NvimTree",
					text = "Explorer",
					highlight = "Directory",
					separator = true,
				},
			},
		},
	},
}
