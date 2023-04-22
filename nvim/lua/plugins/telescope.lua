return
{
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
        {'nvim-lua/plenary.nvim'}
    },
    lazy = true,
    cmd = "Telescope",
    keys = {
        {'<leader>ff', '<cmd>Telescope find_files<cr>', desc = "Telescope find file"},
        {'<leader>fb', '<cmd>Telescope buffers<cr>', desc = "Telescope buffers"},
        {'<leader>fg', '<cmd>Telescope git_files<cr>', desc = "Telescope git files"},
        {'<leader>fs', '<cmd>Telescope git_status<cr>',desc = "Telescope git status"},
        {'<leader>gg', '<cmd>Telescope live_grep<cr>', desc = "Telescope live grep"},
    },
    config = function()
        require("telescope").setup {
            defaults = {
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                    },
                },
                file_ignore_patterns = { "node_modules" },
            },
            pickers = {
                find_files = {
                    theme = "ivy",
                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--exclude", ".git"}
                },
                git_files = {
                    theme = "ivy",
                },
            }
        }

    end
}
