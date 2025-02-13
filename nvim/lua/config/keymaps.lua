local whichkey = require("which-key")
local builtin = require("telescope.builtin")

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local keymap_others = {
    { "<leader>w", "<cmd>update!<CR>", desc = "Save" },
    { "<leader>q", "<cmd>q!<CR>", desc = "Quit" },
}

local keymap_b = {
    { "b", group = "Buffer" },
    { "bc", "<Cmd>bd!<Cr>", desc = "Close current buffer" },
    { "bD", "<Cmd>%bd|e#|bd#<Cr>", desc = "Delete all buffers" },
}

local keymap_Z = {
    { "Z", group = "Lazy" },
    { "ZZ", "<cmd>Lazy<cr>", desc = "Open Lazy" },
    { "Zc", "<cmd>Lazy build<cr>", desc = "Build" },
    { "Zi", "<cmd>Lazy install<cr>", desc = "Install" },
    { "Zs", "<cmd>Lazy sync<cr>", desc = "Sync" },
    { "Zu", "<cmd>Lazy update<cr>", desc = "Update" },
}

local keymap_l = {
    { "<leader>l", group = "Code" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
    { "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Line Diagnostics" },
    { "<leader>li", "<cmd>LspInfo<CR>", desc = "Lsp Info" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
}

local keymap_g = {
    { "g", group = "Goto" },
    { "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Declaration" },
    { "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Goto Implementation" },
    { "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", desc = "Definition" },
    { "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
    { "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Goto Type Definition" },
}

-- telescope find keymaps
 local keymap_f = {
     { "<leader>f", group = "File search"},
     { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file" },
     { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find git file" },
     { "<leader>fl", "<cmd>Telescope live_grep<cr>", desc = "Live grep in files" },
     { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy find in buffer" },
     { "<leader>fs", function() builtin.grep_string({ search = vim.fn.input("Grep > ") });
     end, desc = "Search in files" },
     { "<leader>fu", "<cmd>Telescope lsp_outgoing_calls<cr>", desc = "Find usage" },
     { "<leader>fc", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "Find callers" },
 }

whichkey.add(opts)
whichkey.add(keymap_others)
whichkey.add(keymap_l)
whichkey.add(keymap_g)
whichkey.add(keymap_Z)
whichkey.add(keymap_b)
whichkey.add(keymap_f)
