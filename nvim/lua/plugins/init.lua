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
                        row = "95%",
                        col = "100%",
                    },
                    border = {
                        style = "rounded"
                    }
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
    {
        "goolord/alpha-nvim",
        event =  "VimEnter",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = {
                "",
                "          ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ",
                "           ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
                "                 ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ",
                "                  ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
                "                 ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
                "          ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
                "         ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
                "        ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
                "        ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ",
                "             ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
                "              ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
                "",
                "",
                "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
                "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
                "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
                "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
                "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
                "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
                ""
            }

            local buttonhl = function(shortcut, text, command)
                local button = dashboard.button(shortcut, text, command)
                button.opts.hl_shortcut = "Boolean"
                button.opts.hl = "Array"
                return button
            end

            dashboard.section.buttons.val = {
                buttonhl("n", " > New file", "<CMD>ene<CR>"),
                buttonhl("d", "󰉋 > Open directory", "<CMD>e .<CR>"),
                buttonhl("f", "󰱽 > Find files", "<CMD>Telescope find_files<CR>"),
                buttonhl("g", " > Git", "<CMD>G<CR>"),
                buttonhl("t", " > Telescope", "<CMD>Telescope<CR>"),
                buttonhl("p", "󰚥 > Plugins", "<CMD>Lazy<CR>"),
                buttonhl("P", " > Profile", "<CMD>Lazy profile<CR>"),
                buttonhl("q", " > Quit", "<CMD>qa<CR>"),
            }

            dashboard.section.header.opts.hl = "Array"
            dashboard.section.footer.opts.hl = "Function"

            dashboard.section.footer.val = {
                "",
                "",
                "Theories are nothing more than words. Accept what you’ve seen.",
                "",
                "                                                        – Rintaro Okabe"
            }

            alpha.setup(dashboard.opts)
        end
    },
}
