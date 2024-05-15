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


map("n", "n", "h", {desc = "left" }) -- left
map("n", "h", "j", {desc = "down" }) -- down
map("n", "t", "k", {desc = "up" }) -- up
map("n", "s", "l", {desc = "right" }) -- right


map("v", "n", "h", {desc = "left" }) -- left
map("v", "h", "j", {desc = "down" }) -- down
map("v", "t", "k", {desc = "up" }) -- up
map("v", "s", "l", {desc = "right" }) -- right

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

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000  }
}

require("lazy").setup(plugins, {})
