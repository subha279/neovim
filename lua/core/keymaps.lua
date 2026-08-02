vim.g.mapleader = " "

local keymap = require("utils.keymap").keymap

-- Move selected lines up/down
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selected Line Up" })
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selected Line Down" })

-- Center screen on scroll
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Center screen on search
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Paste over selection without yanking
keymap("x", "<leader>p", [["_dP]])

-- Rename word under cursor
keymap(
	"n",
	"<leader>rw",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Rename Same Many Words Together In the Cursor" }
)

-- Tmux integration
keymap("n", "<C-f>", "<cmd>silent !tmux neww ~/Scripts/tmux-sessionizer<CR>")

-- Window management
keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Split Vertically" })
keymap("n", "<leader>sh", ":split<CR>", { desc = "Split Horizontally" })

-- Make file executable
keymap("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { desc = "Make File Executable" })
