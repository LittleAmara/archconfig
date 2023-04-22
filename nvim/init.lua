-- Setup lazy if not installed
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

-- require('impatient')

-- ##################### --
-- # Lua configuration # --
-- ##################### --

require('lazy-config')

-- require('packer-config')
require('keymaps')
require('settings')
require('catppuccin-config')
require('lsp-config.language-servers')
require('lsp-config.nvim-cmp')
require('treesitter-config')
-- require('telescope-config')
require('feline-config')
require('gitsigns-config')
-- require('coc-config')
