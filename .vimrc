" ~/.vimrc

filetype plugin indent on

runtime! plugin/sensible.vim

call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align 
" Plug 'junegunn/vim-easy-align'

" nerd tree
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'ryanoasis/vim-devicons'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Color schemes
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

Plug 'scrooloose/syntastic'

" Clang
" Plug 'rhysd/vim-clang-format'

" Utils
Plug 'bfrg/vim-cpp-modern'
Plug 'vifm/vifm.vim'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'vim-scripts/AutoComplPop'
Plug 'LnL7/vim-nix'

" Plug 'neoclide/coc.nvim', {'branch' : 'release'}

" Initialize plugin system
call plug#end()

colorscheme catppuccin_frappe
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
:set list
:set listchars:trail:.,tab:>-

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

"let &t_SI = "\<esc>[6 q"  " solid I-beam in insert mode
" let &t_SR = "\<esc>[4 q"  " solid underline in replace mode
"let &t_EI = "\<esc>[2 q"  " default cursor solid block otherwise

set number
set tw=80
" set colorcolumn=80
call matchadd("ErrorMsg", "\\%>79v.\\+", 10, 4)


let g:clang_format#auto_format = 1

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif

" Make autocompl recognize tab as a return
""function! InsertTabWrapper()
""    let col = col('.') - 1
""   if !col || getline('.')[col - 1] !~ '\k'
""        return "\<tab>"
""    else
""        return "\<c-y>"
""    endif
""endfunction


""inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-tab> <c-n>
inoremap jk <ESC>
inoremap {<CR> <ESC>o{<CR>}<UP><CR>

inoremap hc <ESC>
let g:lightline = { 'colorscheme': 'catppuccin_mocha' }
let &t_ut=''
set laststatus=2
set noshowmode " because we already have lightline

function! InsertCloseTag()
  " inserts the appropriate closing HTML tag
  " may require ignorecase to be set, or to type HTML tags in exactly the same case
  if &filetype == 'html' || &filetype=='php' || &filetype=='xml'

    " list of tags which shouldn't be closed:
    let UnaryTags = ' Area Base Br br BR DD dd Dd DT dt Dt HR hr Hr Img img IMG input INPUT Input li Li LI link LINK Link meta Meta p P Param param PARAM '

    " remember current position:
    normal mz
    normal mw

    " loop backwards looking for tags:
    let Found = 0
	let NBL = 0
    while Found == 0
		 let NBL = NBL+1
		 if NBL == 50
			 break
		endif

      " find the previous <, then go forwards one character and grab the first
      " character plus the entire word:
      execute "normal ?\<LT>\<CR>l"
      normal "zyl
      let Tag = expand('<cword>')

      " if this is a closing tag, skip back to its matching opening tag:
      if @z == '/'
        execute "normal ?\<LT>" . Tag . "\<CR>"

      " if this is a unary tag, then position the cursor for the next
      " iteration:
      elseif match(UnaryTags, ' ' . Tag . ' ') > 0
        normal h

      " otherwise this is the tag that needs closing:
      else
        let Found = 1

      endif
    endwhile " not yet found match

    " create the closing tag and insert it:
    let @z = '</' . Tag . '>'
    normal `z"zp
	normal `w
	execute "normal />\<cr>"
  else " filetype is not HTML
	normal mw
    let @z = '</'
    normal "zp`wll
  endif " check on filetype
endfunction " InsertCloseTag()
imap hc <Esc>:call InsertCloseTag()<CR>a

