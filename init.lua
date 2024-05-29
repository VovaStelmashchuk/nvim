vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = trueutanou
vim.opt.softtabstop = 2

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


map("n", "n", "h", { desc = "left" })  -- left
map("n", "h", "j", { desc = "down" })  -- down
map("n", "t", "k", { desc = "up" })    -- up
map("n", "s", "l", { desc = "right" }) -- right

map("v", "n", "h", { desc = "left" })  -- left
map("v", "h", "j", { desc = "down" })  -- down
map("v", "t", "k", { desc = "up" })    -- up
map("v", "s", "l", { desc = "right" }) -- right

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

vim.keymap.set("n", "<space>ff", ":Telescope file_browser<CR>")
vim.keymap.set("n", "<space>e", ":Neotree left<CR>")

-- Enable system clipboard integration
local utils = require('utils')

-- Apply configuration if on NixOS
if utils.is_nixos() then
  -- Enable system clipboard integration
  vim.opt.clipboard:append("unnamedplus")

  -- Yank to system clipboard with y
  vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })
end

if utils.is_macos() then
  vim.api.nvim_set_option("clipboard", "+unnamed")
end
