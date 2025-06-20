vim.g.mapleader = ' '

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

require("lazy").setup("nimer.plugins")


-- basic vim text edition configs 
vim.opt.clipboard = 'unnamedplus'       -- Use system clipboard
vim.opt.number = true                   -- Show line numbers
vim.opt.relativenumber = true           -- Relative numbers for movement
vim.opt.expandtab = true                -- Convert tabs to spaces
vim.opt.shiftwidth = 2                  -- Indentation width
vim.opt.tabstop = 2                     -- Number of spaces a tab counts for



