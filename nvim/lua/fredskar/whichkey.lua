--local M = {}

--function M.setup()
local whichkey = require "which-key"
local builtin = require('telescope.builtin')

--local conf = {
--  window = {
--    border = "single", -- none, single, double, shadow
--    position = "bottom", -- bottom, top
--  },
--}

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

--local mappings = {
--  ["w"] = { "<cmd>update!<CR>", "Save" },
--  ["q"] = { "<cmd>q!<CR>", "Quit" },
--
--  b = {
--    name = "Buffer",
--    c = { "<Cmd>bd!<Cr>", "Close current buffer" },
--    D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
--  },
--
--  z = {
--    name = "Packer",
--    c = { "<cmd>PackerCompile<cr>", "Compile" },
--    i = { "<cmd>PackerInstall<cr>", "Install" },
--    s = { "<cmd>PackerSync<cr>", "Sync" },
--    S = { "<cmd>PackerStatus<cr>", "Status" },
--    u = { "<cmd>PackerUpdate<cr>", "Update" },
--  },
--}

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
    { "Z", group = "Packer" },
    { "Zc", "<cmd>PackerCompile<cr>", desc = "Compile" },
    { "Zi", "<cmd>PackerInstall<cr>", desc = "Install" },
    { "Zs", "<cmd>PackerSync<cr>", desc = "Sync" },
    { "ZS", "<cmd>PackerStatus<cr>", desc = "Status" },
    { "Zu", "<cmd>PackerUpdate<cr>", desc = "Update" },
}
-- Key mappings
-- buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
-- keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
-- keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
-- keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)

-- Whichkey
local keymap_l = {
    { "<leader>l", group = "Code" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
    { "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Line Diagnostics" },
    { "<leader>li", "<cmd>LspInfo<CR>", desc = "Lsp Info" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
}
-- if client.resolved_capabilities.document_formatting then
--   keymap_l.l.f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" }
-- end

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

--whichkey.add(conf)
whichkey.add(opts)
whichkey.add(keymap_others)
whichkey.add(keymap_l)
whichkey.add(keymap_g)
whichkey.add(keymap_Z)
whichkey.add(keymap_b)
whichkey.add(keymap_f)


--whichkey.setup(conf)
--whichkey.register(mappings, opts)
--end

--return M
