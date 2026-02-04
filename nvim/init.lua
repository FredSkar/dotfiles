require("config.lazy")
require("config.keymaps")
require("config.options")

local ok, marks = pcall(require, "marks")
if not ok then
	vim.notify("marks.nvim not found!", vim.log.levels.WARN)
else
	marks.setup({
	  symbol = "🔖",       -- Customize symbol
	  highlight = "Todo",  -- Highlight group
	})

	vim.keymap.set("n", "<leader>m", function() marks.add_mark() end)
	vim.keymap.set("n", "<leader>ms", function() marks.show_note() end)
	vim.keymap.set("n", "<leader>md", function() marks.remove_mark() end)
	vim.keymap.set("n", "<leader>M", function() marks.show_marks() end)
end

