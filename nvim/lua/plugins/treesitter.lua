local M = {
    "nvim-treesitter/nvim-treesitter",
    version = '*',
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}

return { M }
