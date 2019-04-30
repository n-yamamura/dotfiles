set encoding=utf-8
set modeline
set background=dark
set number
set smartindent
set smartcase
set ignorecase
set incsearch
set hlsearch
set nowrapscan
set nowrap
set noshowmatch
set hidden
set nowritebackup
set nobackup
set mouse=a
set ttymouse=xterm2
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
set t_Co=256
"set virtualedit=all

let loaded_matchparen = 1

augroup vimrc
  autocmd! FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd! FileType swift setlocal shiftwidth=4 tabstop=4 softtabstop=4
augroup END

syntax on

imap ^[OA <Up>
imap ^[OB <Down>
imap ^[OC <Right>
imap ^[OD <Left>

vnoremap <silent> > >gv
vnoremap <silent> < <gv

"----------------------------------------
"swpファイルを /ramdisk ディレクトリがあればそちらを指定する
"----------------------------------------
let ramdisk_dir = "/ramdisk"
if isdirectory(ramdisk_dir)
  let ramdisk_cache_dir = ramdisk_dir . "/vim_swaps/"
  if !isdirectory(ramdisk_cache_dir)
    call mkdir(ramdisk_cache_dir)
  endif
  "execute 'set directory=' . ramdisk_cache_dir
  let &directory = ramdisk_cache_dir
endif

"---------------------------------
" NeoVundle
"---------------------------------

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Install Plugins
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-scripts/QuickBuf'
NeoBundle 'nanotech/jellybeans.vim'
" HTML5
NeoBundle 'othree/html5.vim'
" php
NeoBundle 'joonty/vdebug'
" slim
NeoBundle 'slim-template/vim-slim'
" coffeescript
NeoBundle 'kchmck/vim-coffee-script'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"------------------------------------
"colorscheme
"------------------------------------
colorscheme jellybeans

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

