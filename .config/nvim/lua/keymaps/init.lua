local keymap = vim.keymap

keymap.set('i', 'jk', '<Esc>')

-- Keybinds for moving faster between splits
keymap.set('n', '<C-l>', '<C-w>l')
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
