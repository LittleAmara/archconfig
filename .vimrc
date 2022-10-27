" ~/.vimrc

filetype plugin indent on
set nocompatible

runtime! plugin/sensible.vim

call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align 
" Plug 'junegunn/vim-easy-align'

" Plugin outside ~/.vim/plugged with post-update hook
" Fuzzy finder fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Color schemes
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'rakr/vim-one'

Plug 'scrooloose/syntastic'
" Plug 'sheerun/vim-polyglot'

" Clang
" Plug 'rhysd/vim-clang-format'

" Utils
" Plug 'bfrg/vim-cpp-modern'
" Plug 'vifm/vifm.vim'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
" Plug 'vim-scripts/AutoComplPop'
Plug 'LnL7/vim-nix'
" Plug 'maxmellon/vim-jsx-pretty'

" Plug 'neoclide/coc.nvim', {'branch' : 'release'}

" Initialize plugin system
call plug#end()

colorscheme one
set termguicolors

set encoding=utf-8
syntax on

set mouse=a

" search help
set ignorecase
set smartcase
set hlsearch
set incsearch
" set noswapfile

" space help
set list
set listchars:trail:.,tab:>-

" tab help
set expandtab
set smarttab
set shiftwidth=4
" The number of spaces inserted when you press tab.
" -1 means the same value as shiftwidth
set softtabstop=-1

" Make backspace behave as expected
set backspace=eol,indent,start

" menu
set wildmenu
set wildmode=list:longest,full

" linebreak
set lbr
set tw=500

" Set the minimal amount of lignes under and above the cursor
" Useful for keeping context when moving with j/k
set scrolloff=5

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

let &t_SI = "\<esc>[6 q"  " solid I-beam in insert mode
let &t_SR = "\<esc>[4 q"  " solid underline in replace mode
let &t_EI = "\<esc>[2 q"  " default cursor solid block otherwise

" set number
set number relativenumber
set tw=80
" set colorcolumn=80



" let g:clang_format#auto_format = 1

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
    exe "set" git_settings
endif

inoremap jk <ESC>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap {<CR> <ESC>o{<CR>}<UP><CR>

let g:lightline = { 'colorscheme': 'catppuccin_mocha' }
let &t_ut=''
set laststatus=2
set noshowmode " because we already have lightline


" Abbreviations test

ab #i #include
ab abmain int main(void)<CR>{<CR>}<UP><CR>return 0;<UP>
cnoreabbrev ff FZF

" autocmds

" autocmd BufRead,BufNewFile *.htm,*.html,*.jsx setlocal 
"             \tabstop=2 shiftwidth=2 softtabstop=2
" autocmd BufNewFile,BufRead *.c,*.cpp,*.h,*.hh,*.hxx,*.cc call matchadd("ErrorMsg", "\\%>79v.\\+", 10, 4)
