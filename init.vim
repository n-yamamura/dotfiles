"----------------------------
" devin.vim
"----------------------------
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-scripts/QuickBuf')
  call dein#add('tomasr/molokai')

  call dein#end()
  call dein#save_state()
endif

"------------------------------------
" colorscheme
"------------------------------------
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

filetype plugin indent on
syntax enable

set background=dark
set encoding=utf-8
set modeline
set number
set smartindent
set smartcase
set ignorecase
set incsearch
set hlsearch
set nowrapscan
set nowrap
"set showmatch
highlight MatchParen cterm=NONE ctermfg=white ctermbg=black
set hidden
set nowritebackup
set nobackup
set mouse=a
set ambiwidth=double
set wildmenu
set laststatus=2
set noundofile
set stl=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set backspace=indent,eol,start
set list
set listchars=eol:\ ,trail:-
set scrolloff=5
set expandtab
set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set clipboard+=unnamed

"------------------------------------
" The NERD Tree
"------------------------------------
"autocmd vimenter * NERDTree "自動起動
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * if !argc() | NERDTree | endif
let g:NERDTreeWinSize=40  "Default: 31
let g:NERDTreeDirArrows=0
let g:NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

"------------------------------------
" QuickBuf
"------------------------------------
let g:qb_hotkey = "<C-b>"
