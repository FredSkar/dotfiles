local M = {
    "nvim-treesitter/nvim-treesitter",
    version = '*',
    opts = {
	    ensure_installed = {
		    "bash",
		    "python",
		    "c",
		    "Markdown",
	    },
    },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}

return { M }
