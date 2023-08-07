local builtin = require('telescope.builtin')
local wk = require("which-key")

wk.register({
	f = {
		name = "file search",
		f = { "<cmd>Telescope find_files<cr>", "Find file" },
		g = { "<cmd>Telescope git_files<cr>", "Find git file" },
		l = { "<cmd>Telescope live_grep<cr>", "Live grep in files" },
		b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy find in buffer" },
		s = { function() builtin.grep_string({ search = vim.fn.input("Grep > ") });
		end, "Search in files" },
		u = { "<cmd>Telescope lsp_outgoing_calls<cr>", "Find usage" },
		c = { "<cmd>Telescope lsp_incoming_calls<cr>", "Find callers" },
	},
}, { prefix = "<leader>" })

-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)
