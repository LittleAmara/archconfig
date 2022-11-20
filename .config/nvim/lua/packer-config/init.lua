return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lsp plugins
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  -- Git plugins
  use 'tpope/vim-fugitive'
  use {
  'lewis6991/gitsigns.nvim',
  }

  -- Customization plugins
  use { "nvim-tree/nvim-web-devicons" }
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'feline-nvim/feline.nvim'

  -- Useful plugins
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
}

end)
