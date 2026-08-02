local function lsp_clients()
  local names = {}

  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    table.insert(names, client.name)
  end

  return table.concat(names, ", ")
end

local function has_lsp_clients()
  return #vim.lsp.get_clients({ bufnr = 0 }) > 0
end

local function transparent_theme()
  local theme = require("lualine.themes.onedark")
  for _, mode in pairs(theme) do
    if type(mode) == "table" then
      for _, section in pairs(mode) do
        if type(section) == "table" then
          section.bg = "NONE"
        end
      end
    end
  end
  return theme
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "onedark",
      globalstatus = true,
      icons_enabled = true,
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "alpha", "dashboard", "lazy", "mason", "NvimTree" },
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        {
          "diff",
          symbols = { added = "+", modified = "~", removed = "-" },
        },
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          sections = { "error", "warn", "info", "hint" },
          symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " },
        },
      },
      lualine_c = {
        {
          "filename",
          path = 1,
          symbols = { modified = " [+]", readonly = " [RO]", unnamed = "[No Name]" },
        },
      },
      lualine_x = {
        { lsp_clients, cond = has_lsp_clients, icon = "LSP" },
        { "searchcount", maxcount = 999, timeout = 500 },
        "encoding",
        "fileformat",
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { "nvim-tree", "quickfix" },
  },
  config = function(_, opts)
    opts.options.theme = transparent_theme()
    require("lualine").setup(opts)
  end,
}
