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
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>4 :qa!<CR>



" Wayland clipboard
" Yanking {{{

" The '+' register doesn't work for yanking if:
" - vim was built without 'clipboard'.
" - x11 / xwayland is unavailable.
" (https://github.com/vim/vim/blob/93197fde0f1db09b1e495cf3eb14a8f42c318b80/src/register.c#L247)
"
" My solution is to map '"+' to '"w' and send the 'w' register to the
" Wayland clipboard as well.
"
" This variable controls whether '"+' gets mapped to '"w'. It's on by default
" if the 'clipboard' feature isn't available, or if $DISPLAY isn't set,
" but the user can turn it off always if desired.
let s:plus_to_w = (!has('clipboard') || empty($DISPLAY)) && !exists('g:wayland_clipboard_no_plus_to_w')

" remap '"+' to '"w' -- this will only apply to yanking since '"+p' and '"+P'
" are also remapped below
if s:plus_to_w
    nnoremap "+ "w
    vnoremap "+ "w
endif

let s:copy_args = exists('g:wayland_clipboard_copy_args') ? g:wayland_clipboard_copy_args : []

" pass register contents to wl-copy if the '+' (or 'w') register was used
function! s:WaylandYank()
    if v:event['regname'] == '+' ||
                \ (v:event['regname'] == 'w' && s:plus_to_w) ||
                \ (v:event['regname'] == '' && &clipboard =~ 'unnamedplus')
        silent call job_start(['wl-copy'] + s:copy_args + ['--', getreg(v:event['regname'])], {
            \   "in_io": "null", "out_io": "null", "err_io": "null",
            \   "stoponexit": "",
            \ })
    endif
endfunction

" run s:WaylandYank() after every time text is yanked
augroup waylandyank
    autocmd!
    autocmd TextYankPost * call s:WaylandYank()
augroup END

" }}}

" Pasting {{{

" remap paste commands to first pull in clipboard contents with wl-paste

let s:paste_args = exists('g:wayland_clipboard_paste_args') ? g:wayland_clipboard_paste_args : []
let s:paste_args_str = empty(s:paste_args) ? '' : ' ' . join(s:paste_args)

function! s:clipboard_to_unnamed()
    silent let @"=substitute(system('wl-paste --no-newline' . s:paste_args_str), "\r", '', 'g')
endfunction

function! s:put(p, fallback)
    if a:fallback
        return a:p
    endif

    call s:clipboard_to_unnamed()
    return '""' . a:p
endfunction

function! s:ctrl_r(cr)
    call s:clipboard_to_unnamed()
    return a:cr . '"'
endfunction

nnoremap <expr> <silent> "+p <SID>put('p', v:false)
nnoremap <expr> <silent> "+P <SID>put('P', v:false)
nnoremap <expr> <silent> p <SID>put('p', &clipboard !~ 'unnamedplus')
nnoremap <expr> <silent> P <SID>put('P', &clipboard !~ 'unnamedplus')

vnoremap <expr> <silent> "+p <SID>put('p', v:false)
vnoremap <expr> <silent> "+P <SID>put('P', v:false)
vnoremap <expr> <silent> p <SID>put('p', &clipboard !~ 'unnamedplus')
vnoremap <expr> <silent> P <SID>put('P', &clipboard !~ 'unnamedplus')

inoremap <expr> <silent> <C-R>+ <SID>ctrl_r("\<C-R>")
inoremap <expr> <silent> <C-R><C-R>+ <SID>ctrl_r("\<C-R>\<C-R>")
inoremap <expr> <silent> <C-R><C-O>+ <SID>ctrl_r("\<C-R>\<C-O>")
inoremap <expr> <silent> <C-R><C-P>+ <SID>ctrl_r("\<C-R>\<C-P>")
