vim.g.mapleader = "\\" -- Make sure to set `mapleader` before lazy so your mappings are correct

return require('lazy').setup( "plugins",
{
    ui = {
        border = "rounded",
    },
    defaults = {
        lazy = false,
    }
})
