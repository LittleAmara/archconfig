return {
    {'folke/lazy.nvim'},
    {
        'christoomey/vim-tmux-navigator',
        lazy = false,
        keys = {
            {'<C-w>h', '<cmd>TmuxNavigateLeft<cr>', desc = "Switch to left pane"},
            {'<C-w>l', '<cmd>TmuxNavigateRight<cr>', desc = "Switch to right pane"},
            {'<C-w>k', '<cmd>TmuxNavigateUp<cr>', desc = "Switch to up pane"},
            {'<C-w>j', '<cmd>TmuxNavigateDown<cr>', desc = "Switch to down pane"},
        }
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {'-', '<cmd>Oil<cr>', desc = "Open parent directory"},
            {'<leader>-', '<cmd>Oil --float<cr>', desc = "Open parent directory in a floating window"},
        },
    },
}
