" ~/.vimrc

filetype plugin indent on

runtime! plugin/sensible.vim

call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align 
Plug 'junegunn/vim-easy-align'

" nerd tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Color schemes
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/vim-color-forest-night'
Plug 'sonph/onehalf'
Plug 'dracula/vim', { 'name': 'dracula' }

Plug 'scrooloose/syntastic'

" Clang
Plug 'rhysd/vim-clang-format'

" Utils
Plug 'bfrg/vim-cpp-modern'
Plug 'vifm/vifm.vim'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'vim-scripts/AutoComplPop'

" Initialize plugin system
call plug#end()

colorscheme dracula

set encoding=utf-8
syntax on

set mouse=a

set cmdheight=1

" search help
set ignorecase
set smartcase
set hlsearch
set incsearch
" set noswapfile

" space help
:set list
:set listchars:trail:.

" tab help
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" menu
set wildmenu
set wildmode=list:longest,full

" linebreak
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

let &t_SI = "\<esc>[6 q"  " solid I-beam in insert mode
let &t_SR = "\<esc>[4 q"  " solid underline in replace mode
let &t_EI = "\<esc>[2 q"  " default cursor solid block otherwise

set number
set tw=80

let g:clang_format#auto_format = 1

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif

" Make autocompl recognize tab as a return
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-y>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-tab> <c-n>
inoremap jk <ESC>
inoremap {<CR> <ESC>o{<CR>}<UP><CR>

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
let &t_ut=''
set laststatus=2
set noshowmode " because we already have lightline

" Solution of
" https://vim.fandom.com/wiki/Making_Parenthesis_And_Brackets_Handling_Easier to
" handle pairs of characters
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf
