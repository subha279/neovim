# MyNeovim

A modern Neovim distribution built with [lazy.nvim](https://github.com/folke/lazy.nvim), organized like LazyVim/NvChad: a `dist/` layer for defaults and feature flags, a `core/` layer for base editor configuration, and a modular `plugins/` tree.

## Requirements

- Neovim **>= 0.12**
- `git`, `make`, `gcc`, `g++` in PATH
- Optional: `fortune` (dashboard), `rg` (telescope), `tmux` (tmux navigator + sessionizer)

## Installation

```sh
git clone https://github.com/YOUR_USER/MyNeovim ~/.config/nvim
nvim "+Lazy sync"
```

## Structure

```
lua/
├── dist/          # Distribution layer: defaults, feature flags, colorscheme registry
├── core/          # Base config: options, keymaps, globals, ui, diagnostics, health
├── config/        # Setup modules: lazy, lsp, mason, cmp, treesitter
├── plugins/       # Plugin specs by category (ui, editor, coding, lsp, git, ...)
└── utils/         # Shared helpers (keymap, colors, icons, prompt, plugin loader)
```

## Feature Flags

Toggle whole plugin groups in `lua/dist/features.lua`:

```lua
M.features = {
  dashboard = true,
  lsp = true,
  completion = true,
  treesitter = true,
}
```

## Keymaps

| Key | Action |
|-----|--------|
| `<leader>` | Space |
| `K` / `J` (visual) | Move selected lines up / down |
| `<C-d>` / `<C-u>` | Scroll half page, centered |
| `n` / `N` | Search next / prev, centered |
| `<leader>e` | Toggle file explorer |
| `<leader>sv` / `<leader>sh` | Split vertical / horizontal |
| `<leader>cx` | Make file executable |
| `<leader>ss` / `<leader>sr` | Save / restore session |
| `<leader>ff` / `<leader>fo` | Telescope find files / recent files |
| `<leader>fl` / `<leader>fg` | Telescope live grep / grep under cursor |
| `<leader>ft` | Todo comments via telescope |
| `<leader>fh` | Harpoon list |
| `<leader>a` | Harpoon add file |
| `gd` / `K` / `gr` | LSP definition / hover / references |
| `<leader>rn` / `<leader>ca` | LSP rename / code action |
| `<leader>ed` / `]d` / `[d` | Diagnostic float / next / prev |
| `<leader>gf` | Format buffer |
| `<leader>gp` / `<leader>gb` | Gitsigns preview / blame |
| `[b` / `]b` / `<S-h>` / `<S-l>` | Cycle buffers |
| `gb` | Pick buffer |
| `<leader>bd` | Close buffer |
| `<leader>xx` / `<leader>xw` | Trouble diagnostics / workspace diagnostics |
| `<leader>db` / `<leader>dc` | DAP toggle breakpoint / continue |
| `<leader>gt` / `]t` | Todo comments / next todo |

## Colorschemes

Add new colorschemes to `lua/dist/colorschemes.lua` and switch with `<leader>th` (telescope colorscheme picker). Transparency is enabled per-colorscheme via the `transparent = true` flag.

## Debugging

Adapters are managed by `mason-nvim-dap` (debugpy, codelldb, node2). Language configurations live in `lua/plugins/debugging/dap.lua`.

## Health

```vim
:checkhealth
```
