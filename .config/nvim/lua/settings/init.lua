local set = vim.opt

set.termguicolors = true

-- mouse
set.mouse = "a"

-- search help
set.ignorecase = true
set.smartcase = true
set.hlsearch = true
set.incsearch = true
-- set noswapfile

-- space help
set.list = true
set.listchars = 'tab:>-,trail:.'

-- tab help
set.expandtab = true
set.smarttab = true
set.shiftwidth = 4

-- The number of spaces inserted when you press tab.
-- -1 means the same value as shiftwidth
set.softtabstop = -1

-- menu
set.wildmenu = true
set.wildmode = 'longest,full'

-- linebreak
set.lbr = true
set.tw = 500

-- Set the minimal amount of lignes under and above the cursor
-- Useful for keeping context when moving with j/k
set.scrolloff = 8

set.ai = true -- Auto indent
set.si = true -- Smart indent
set.wrap = true -- Wrap lines
set.swapfile = false

set.relativenumber = true
set.number = true
