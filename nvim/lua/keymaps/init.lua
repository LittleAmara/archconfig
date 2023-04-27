-- Wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map jk to go back to normal mode
map('i', 'jk', '<Esc>', {silent = true })

-- Map double leader to remove search highlighting
map('n', '<leader><leader>', '<cmd>noh<cr>', {silent = true })

-- Pepega braces
-- map('i', '{<CR>', '<ESC>o{<CR>}<UP><CR>')
map('i', '{<CR>', '{<CR>}<UP><END><CR>')

map('n', '<leader>l', '<cmd>Lazy<cr>', {silent = true })

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
