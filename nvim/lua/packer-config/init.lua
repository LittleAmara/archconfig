return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lsp plugins
  use 'neovim/nvim-lspconfig'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind.nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  -- use {
  --     'ms-jpq/coq_nvim',
  --     branch = 'coq',
  -- }
  -- use {
  --     'ms-jpq/coq.artifacts',
  --     branch = 'artifacts'
  -- }
  -- use {'neoclide/coc.nvim', branch = 'release'}

  -- Git plugins
  use 'tpope/vim-fugitive'
  use {
  'lewis6991/gitsigns.nvim',
  }

  -- Customization plugins
  use { "nvim-tree/nvim-web-devicons" }
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'feline-nvim/feline.nvim'
  use 'kvrohit/rasmus.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'marko-cerovac/material.nvim'
  use 'rose-pine/neovim'

  -- Useful plugins
  use 'lewis6991/impatient.nvim'
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'tpope/vim-vinegar'

  -- Notifications plugin
  use 'rcarriga/nvim-notify'

end)
