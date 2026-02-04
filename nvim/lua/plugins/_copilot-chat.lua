return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    version = '4.7.x',
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
	    mappings = {
		    reset = { normal = '<C-n>', insert = '<C-n>' }, -- Reset the chat window
	    }
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
