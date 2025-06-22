return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  { "projekt0n/github-nvim-theme", name = "github-theme" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_light_default",
    },
  },
}
