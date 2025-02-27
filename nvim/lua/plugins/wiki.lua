return {
  "lervag/wiki.vim",
  version = "*",
  -- tag = "v0.10", -- uncomment to pin to a specific release
  init = function()
    -- wiki.vim configuration goes here, e.g.
    vim.g.wiki_root = '~/wiki'
    vim.g.wiki_mappings_prefix = '<leader>n'
    vim.g.wiki_select_method = {
      pages = require("wiki.telescope").pages,
      tags = require("wiki.telescope").tags,
      toc = require("wiki.telescope").toc,
      links = require("wiki.telescope").links,
    }
  end
}
