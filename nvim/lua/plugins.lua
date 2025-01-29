-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use ('wbthomason/packer.nvim')

  use {
          "dhananjaylatkar/cscope_maps.nvim", branch = 'main'
  }
  use {
	  "rbmarliere/telescope-cscope.nvim", branch = 'main'
  }
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  config = function()
		  require("cscope_maps").setup({
		  	disable_maps = true,
			cscope = {
				picker = "telescope",
			},
		  })
	  end,
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Code navigation
  use {
          "ludovicchabant/vim-gutentags", branch = 'master',
          init = function()
            vim.g.gutentags_modules = {"cscope_maps"} -- This is required. Other config is optional
            vim.g.gutentags_cscope_build_inverted_index_maps = 1
            vim.g.gutentags_cache_dir = vim.fn.expand("~/code/.gutentags")
            vim.g.gutentags_file_list_command = "find -type f \\( -name \"*.c\" -o -name \"*.h\" \\)"
            -- vim.g.gutentags_trace = 1
          end
  }
------------------------

  use {
          'github/copilot.vim', branch = 'release'
  }

  use ('vim-scripts/DrawIt')

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Lua
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("whichkey")
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    end,
  }

  -- Icons used by which-key
  use {
	"nvim-tree/nvim-web-devicons",
  }
  use {
	"echasnovski/mini.icons",
  }

  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {                                      -- Optional
		  'williamboman/mason.nvim',
		  run = function()
			  pcall(vim.cmd, 'MasonUpdate')
		  end,
		  },
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},     -- Required
		  {'hrsh7th/cmp-nvim-lsp'}, -- Required
		  {'L3MON4D3/LuaSnip'},     -- Required
	  }
	}
  use('ellisonleao/gruvbox.nvim')
  use('alexghergh/nvim-tmux-navigation')
end)
