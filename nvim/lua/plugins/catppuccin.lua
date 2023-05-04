return
{
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 4242,
    build = function()
        require('catppuccin').compile()
    end,
    init = function()
        vim.cmd.colorscheme 'catppuccin'
    end,
    opts = {
        flavour = "frappe", -- latte, frappe, macchiato, mocha
        background = { -- h: background
            light = "latte",
            dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false, -- show the '~' characters after the end of buffers
        term_colors = false,
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
        },
        custom_highlights = {
            Pmenu = {
                bg = "None"
            },
            PmenuSel = {
                bg = "None"
            },
            NormalFloat = {
                bg = "None"
            }
        },
        integrations = {
            cmp = true,
            gitsigns = true,
            telescope = true,
            treesitter = true,
        },
    }
}
