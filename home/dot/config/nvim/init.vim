set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'twerth/ir_black'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'

call vundle#end()

set hidden
set directory=~/.nvim/tmp
set encoding=utf-8
set showcmd
set visualbell
set autoread

set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start

set list
set listchars=""
set listchars=tab:..,trail:.,extends:>,precedes:<

set hlsearch
set incsearch
set ignorecase
set smartcase

set textwidth=120
set colorcolumn=120
set ruler
set number
set laststatus=2
set numberwidth=4
set autoindent

set undofile
set undodir=~/.nvim/tmp/undo

set wildmode=longest,list,full
set wildmenu

set clipboard=unnamedplus,unnamed

filetype plugin indent on
syntax enable

silent! colorscheme ir_black

let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'

" leader-n to toggle NERDTree
:map <leader>n :execute 'NERDTreeToggle ' . getcwd()<CR>

" leader-/ to :nohlsearch
map <leader>/ :nohlsearch<CR>

" leader-r to copy the current filename to the clipboard (relative path)
:map <leader>r :let @*=expand("%")<CR>

" leader-a to copy the current filename to the clipboard (absolute path)
:map <leader>a :let @*=expand("%:p")<CR>

" leader-l to copy the current filename and line number to the clipboard
:map <leader>l :let @*=expand("%:p") . ":" . <C-r>=line('.')<CR><CR>

" move through open buffers
nmap <D-{> :bprev<CR>
nmap <D-}> :bnext<CR>

" move through window splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" make Y act like C, D et al and map to y$
map Y y$

" remap ; to : for maximum laziness
nnoremap ; :
vnoremap ; :

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
