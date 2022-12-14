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

-- Map double escape to remove search highlighting
map('n', '<leader><leader>', ':noh<CR>', {silent = true })

-- Keybinds for moving faster between splits
map('n', '<C-l>', '<C-w>l', {silent = true })
map('n', '<C-h>', '<C-w>h', {silent = true })
map('n', '<C-j>', '<C-w>j', {silent = true })
map('n', '<C-k>', '<C-w>k', {silent = true })

-- Pepega braces
map('i', '{<CR>', '<ESC>o{<CR>}<UP><CR>')

-- Research visually selected text
map('v', '//',  'y<Esc>/<C-R>+<CR>')
