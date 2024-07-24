vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    if opts.desc then
      opts.desc = "keymaps.lua: " .. opts.desc
    end
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

vim.keymap.set('n', '<space>cf', vim.lsp.buf.format, {})

map("n", "n", "h", { desc = "left" })
map("n", "h", "j", { desc = "down" })
map("n", "t", "k", { desc = "up" })
map("n", "s", "l", { desc = "right" })

map("v", "n", "h", { desc = "left" })
map("v", "h", "j", { desc = "down" })
map("v", "t", "k", { desc = "up" })
map("v", "s", "l", { desc = "right" })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
-- Connect to system clipboard
local utils = require('utils')

if utils.is_nixos() then
  vim.opt.clipboard:append("unnamedplus")
end

if utils.is_macos() then
  vim.o.clipboard = 'unnamedplus'
end

vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })
