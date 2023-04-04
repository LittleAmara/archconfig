require('impatient')

-- ##################### --
-- # Lua configuration # --
-- ##################### --

require('packer-config')
require('keymaps')
require('settings')
require('lsp-config.language-servers')
require('lsp-config.nvim-cmp')
require('treesitter-config')
require('telescope-config')
require('feline-config')
require('gitsigns-config')
-- require('coc-config')

-- ############### --
-- # COLORSCHEME # --
-- ############### --
vim.cmd.colorscheme "catppuccin-frappe"
-- Uncomment the next line if you want your background
-- colour to be same same as your terminal
-- vim.cmd "highlight Normal guibg=NONE ctermbg=NONE"

-- ################################################### --
-- # Now popup windows have a transparent background # --
-- ################################################### --

vim.cmd "highlight Pmenu guibg=None"
vim.cmd "highlight PmenuSel guibg=None"
vim.cmd "highlight NormalFloat guibg=None"
