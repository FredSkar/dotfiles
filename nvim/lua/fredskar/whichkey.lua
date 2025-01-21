--local M = {}

--function M.setup()
local whichkey = require "which-key"

local conf = {
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
  },
}

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
  ["w"] = { "<cmd>update!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },

  b = {
    name = "Buffer",
    c = { "<Cmd>bd!<Cr>", "Close current buffer" },
    D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
  },

  z = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
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
whichkey.add(keymap_l, { buffer = bufnr, prefix = "<leader>" })
whichkey.add(keymap_g, { buffer = bufnr, prefix = "g" })


whichkey.setup(conf)
whichkey.register(mappings, opts)
--end

--return M
