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
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        opts = {
            cmdline = {
                view = "cmdline",
            },
            views = {
                mini = {
                    align = "message-right",
                    position = {
                        row = -1,
                        col = "100%",
                    },
                }
            },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                long_message_to_split = true,
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
        },
    },
}
