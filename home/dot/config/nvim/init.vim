set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'fatih/vim-go'
Plugin 'fisadev/vim-isort'
Plugin 'github/copilot.vim'
Plugin 'mileszs/ack.vim'
Plugin 'psf/black'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'twerth/ir_black'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/indentpython'
Plugin 'vim-syntastic/syntastic'

call vundle#end()

set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamedplus,unnamed
set colorcolumn=120
set directory=~/.nvim/tmp
set encoding=utf-8
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=""
set listchars=tab:..,trail:.,extends:>,precedes:<
set mouse=a
set nowrap
set number
set numberwidth=4
set ruler
set shiftwidth=2
set showcmd
set smartcase
set tabstop=2
set textwidth=120
set ttyfast
set undodir=~/.nvim/tmp/undo
set undofile
set visualbell
set wildmenu
set wildmode=longest,list,full

filetype plugin indent on
syntax enable

silent! colorscheme dracula

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

" Syntastic
let g:syntastic_python_checkers=['pyflakes', 'pylint', 'mypy']

" Black on save
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end
