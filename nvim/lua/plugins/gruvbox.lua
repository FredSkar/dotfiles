return {
  -- add gruvbox
   "ellisonleao/gruvbox.nvim",
   version = '*',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
}
