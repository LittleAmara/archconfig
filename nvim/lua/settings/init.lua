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
set.completeopt='menu,menuone,noselect'

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

-- Set a global statusline, previous one was 2
set.laststatus = 3

vim.api.nvim_create_user_command("FormatC", "%!clang-format --style=file %:p", {})
vim.api.nvim_create_user_command("FormatNix", "silent !nixpkgs-fmt %", {})
vim.api.nvim_create_user_command("FormatPython", "silent !black -l 120 %", {})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.nix"},
  command = "set shiftwidth=2",
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.[hc]"},
  command = "set comments=s:/*,mb:**,ex:*/,://,:///",
})

-- Apply automatically formatter

-- vim.api.nvim_create_autocmd({"BufWritePost"}, {
--   pattern = {"*.nix"},
--   command = "silent !nixpkgs-fmt <afile>",
-- })

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = {"*.fish"},
  command = "silent !fish_indent -w <afile>",
})

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = {"*.py"},
  command = "silent !black <afile>",
})


-- Auto reload file when nvim resumes from a suspend state
vim.api.nvim_create_autocmd({ "VimResume" }, {
    command = "silent checktime",
    pattern = { "*" },
})

