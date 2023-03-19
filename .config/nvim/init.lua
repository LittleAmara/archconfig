require('impatient')

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

vim.cmd.colorscheme "catppuccin-frappe"
-- vim.cmd "highlight Comment cterm=italic"

-- Uncomment the next line if you want your background
-- colour to be same same as your terminal
-- vim.cmd "highlight Normal guibg=NONE ctermbg=NONE"
--
