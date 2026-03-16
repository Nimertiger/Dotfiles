-- my package manager is lazy vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- plugins and options varaible,plugins moved to lua/plugins.lua and vim-options
vim.keymap.set('n', '<F5>', function()
  vim.cmd("write") -- Save the file first
  local file_path = vim.fn.expand('%:p')
  local output_path = vim.fn.expand('%:p:r')
  -- Open a terminal and run the command
  vim.cmd(string.format("split | term g++ %s -o %s && %s", file_path, output_path, output_path))
end, { desc = "Compile and Run C++" })

require("vim-options")
require("lazy").setup("plugins") -- sets up lazy using plugins in lua/plugins.lua
