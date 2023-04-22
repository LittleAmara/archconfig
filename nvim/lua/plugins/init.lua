return {

-- Lsp plugins
'neovim/nvim-lspconfig',
'saadparwaiz1/cmp_luasnip',
'L3MON4D3/LuaSnip',
'onsails/lspkind.nvim',
'hrsh7th/cmp-buffer',
'hrsh7th/cmp-cmdline',
'hrsh7th/nvim-cmp',
'hrsh7th/cmp-path',
'hrsh7th/cmp-nvim-lsp',

-- Git plugins
'tpope/vim-fugitive',
{
'lewis6991/gitsigns.nvim',
},

-- Customization plugins
{ "nvim-tree/nvim-web-devicons" },
{ "catppuccin/nvim", as = "catppuccin" },
'feline-nvim/feline.nvim',
'kvrohit/rasmus.nvim',
'EdenEast/nightfox.nvim',
'marko-cerovac/material.nvim',
'rose-pine/neovim',

-- Useful plugins
{
    'nvim-treesitter/nvim-treesitter',
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })
    end,
},
'tpope/vim-vinegar',

-- Notifications plugin
'rcarriga/nvim-notify',

}
