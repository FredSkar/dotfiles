local M = {
    "nvim-treesitter/nvim-treesitter",
    version = '0.10.x',
    opts = {
	    ensure_installed = {
		    "bash",
		    "python",
		    "c",
		    "Markdown",
		    "lua",
	    },
    },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}

return { M }
