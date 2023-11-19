return {
  { "ellisonleao/gruvbox.nvim" },

  -- TODO: Make rose-pine transparent
  {
    "rose-pine/neovim",
    priority = 1000,
    name = "rose-pine",
    opts = {
      variant = "moon",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
