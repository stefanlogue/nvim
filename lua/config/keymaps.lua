-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<C-s>", ":w<cr>", { desc = "Save" })
map("n", "<C-q>", ":q<cr>", { desc = "Quit" })

-- tmux
wk.register({
  t = {
    name = "tmux",
    s = { "<cmd>silent !tmux neww tmux-sessionizer<CR>", "sessionizer" },
  },
}, {
  prefix = "<leader>",
})

-- Neotree
map("n", "<S-e>", ":Neotree toggle<cr>")
-- Refactoring
wk.register({
  r = {
    name = "refactoring",
    e = { ":Refactoring extract<cr>", "extract" },
    f = { ":Refactoring extract_to_file", "extract to file" },
  },
}, {
  prefix = "<leader>",
  mode = { "v", "n" },
})
map("n", "<leader>rr", ":lua require'telescope'.extensions.refactoring.refactors()<CR>")
map("v", "<leader>re", ":Refactor extract<cr>")
map("v", "<leader>rf", ":Refator extract_to_file<cr>")
map("v", "<leader>rr", ":lua require'telescope'.extensions.refactoring.refactors()<CR>")

-- Dev
map("n", "<leader><leader>x", ":w | source %<CR>", { desc = "Write and source" })
