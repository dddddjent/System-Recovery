set backspace=indent,eol,start
set ignorecase 
set relativenumber
set clipboard^=unnamed,unnamedplus
set nu
set autochdir
set incsearch
set scrolloff=5
set tabstop=4
set shiftwidth=4
set expandtab

filetype plugin indent on
colorscheme sorbet
syntax on


let mapleader=" "

map Q gq

noremap <silent> K 5k
noremap <silent> J 5j

inoremap kj <ESC>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
nnoremap <C-h> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

vnoremap Y "+y
vnoremap P "+p
nnoremap <Leader>y :%y<cr>

nnoremap < <<
nnoremap > >>

nnoremap \| :vsplit<CR>
nnoremap - :split<CR>
