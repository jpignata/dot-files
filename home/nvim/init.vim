execute pathogen#infect()

set nocompatible
set hidden

set directory=~/.vim/tmp
set nocompatible
set encoding=utf-8
set showcmd

set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set paste

set list
set listchars=""
set listchars=tab:..
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<

set hlsearch
set incsearch
set ignorecase
set smartcase

set textwidth=80
set colorcolumn=80
set ruler
set number
set laststatus=2
set numberwidth=4
set autoindent

set undofile
set undodir=/tmp

set wildmode=longest,list,full
set wildmenu

filetype plugin indent on
syntax enable

set t_Co=256

" leader-/ to :nohlsearch
map <leader>/ :nohlsearch<CR>

" command-R to copy the current filename to the clipboard (relative path)
:map <leader>r :let @*=expand("%")<CR>

" command-A to copy the current filename to the clipboard (absolute path)
:map <leader>a :let @*=expand("%:p")<CR>

" command-L to copy the current filename and line number to the clipboard
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