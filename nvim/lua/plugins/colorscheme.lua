-- lua/plugins/colorscheme.lua
return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    init = function()
      vim.o.background = "dark"
    end,
    opts = {
      terminal_colors = true,
      contrast = "hard",
      transparent_mode = false,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
