-- Core editor options

local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
local undodir = vim.fn.expand("~/.nvim/undodir")
vim.fn.mkdir(undodir, "p")
opt.undodir = undodir
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.isfname:append("@-@")
opt.updatetime = 50
opt.timeoutlen = 200
opt.ttimeoutlen = 10
opt.mouse = "a"
opt.clipboard:append("unnamedplus")
opt.completeopt = "menuone,noinsert,noselect"

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99

