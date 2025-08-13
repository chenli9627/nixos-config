return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "projekt0n/github-nvim-theme", name = "github-theme" },

  -- Configure LazyVim to load gruvbox

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "github_dark_default",
      colorscheme = "gruvbox",
    },
  },
}
-- { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...}
