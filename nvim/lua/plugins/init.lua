return {
    {'folke/lazy.nvim'},
    {
        'stevearc/oil.nvim',
        opts = {},
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {'-', '<cmd>Oil<cr>', desc = "Open parent directory"},
            {'<leader>-', '<cmd>Oil --float<cr>', desc = "Open parent directory in a floating window"},
        },
    }
}
