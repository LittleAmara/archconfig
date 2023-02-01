local ctp_feline = require('catppuccin.groups.integrations.feline')

local clrs = require("catppuccin.palettes").get_palette()
local U = require "catppuccin.utils.colors"

ctp_feline.setup({
    assets = {
        left_separator = "",
        right_separator = "",
        bar = "█",
        mode_icon = "⮞ ",
        -- mode_icon = "",
        dir = "  ",
        file = "   ",
        lsp = {
            server = "  ",
            error = "  ",
            warning = "  ",
            info = "  ",
            hint = "  ",
        },
        git = {
            branch = "  ",
            added = "  ",
            changed = "  ",
            removed = "  ",
        },
    },
    mode_colors = {
        ["n"] = { "NORMAL", clrs.lavender },
        ["no"] = { "N-PENDING", clrs.lavender },
        ["i"] = { "INSERT", clrs.green },
        ["ic"] = { "INSERT", clrs.green },
        ["t"] = { "TERMINAL", clrs.green },
        ["v"] = { "VISUAL", clrs.flamingo },
        ["V"] = { "V-LINE", clrs.flamingo },
        ["�"] = { "V-BLOCK", clrs.flamingo },
        ["R"] = { "REPLACE", clrs.maroon },
        ["Rv"] = { "V-REPLACE", clrs.maroon },
        ["s"] = { "SELECT", clrs.maroon },
        ["S"] = { "S-LINE", clrs.maroon },
        ["�"] = { "S-BLOCK", clrs.maroon },
        ["c"] = { "COMMAND", clrs.peach },
        ["cv"] = { "COMMAND", clrs.peach },
        ["ce"] = { "COMMAND", clrs.peach },
        ["r"] = { "PROMPT", clrs.teal },
        ["rm"] = { "MORE", clrs.teal },
        ["r?"] = { "CONFIRM", clrs.mauve },
        ["!"] = { "SHELL", clrs.green },
    }
})

require'feline'.setup({
    components = ctp_feline.get(),
})
require'feline'.winbar.setup()
