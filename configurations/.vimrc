set backspace=indent,eol,start "退格键设置"
set clipboard=unnamed   "默认的剪切寄存器"
set ignorecase  "忽略大小写"
set relativenumber
set nu
        :vnoremap ci :s/^/\/\/<cr>
        :vnoremap cu :s/\/\//<cr>
        :nnoremap ci :s/^/\/\/<cr>
        :nnoremap cu :s/\/\//<cr>

        :inoremap jj <esc>  "退出插入模式"
        :noremap gd <c-]>zz "跳转到定义"
        :nnoremap gq ==     "代码格式format"
        :vnoremap gq ==
        :nnoremap <space> za "折叠"

        "end
"" Source your .vimrc
"source ~/.vimrc

"" -- Suggested options --
" Show a few lines of context around the cursor. Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
" 设置leader键"
let mapleader=" "

"设置剪贴板
set clipboard=unnamed
let &t_ut=''
set autochdir

set scrolloff=5

" Do incremental searching.
set incsearch

" Don't use Ex mode, use Q for formatting.
map Q gq

set number relativenumber

set clipboard^=unnamed,unnamedplus

set mouse=i

set ignorecase

noremap <silent> K 5k
noremap <silent> J 5j
nnoremap <F12> :action GotoImplementation<CR>

inoremap kj <ESC>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" 复制到系统剪贴板
vnoremap Y "+y
vnoremap P "+p
vnoremap <C-c> "+y

" Indentation/缩进一个> <  代表两个<>
nnoremap < <<
nnoremap > >>

noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

noremap za zc
noremap zx zo

"" -- Map IDE actions to IdeaVim -- https://jb.gg/abva4t
"" Map \r to the Reformat Code action
"map \r <Action>(ReformatCode)
" 代码格式化功能 <leader>fc
nnoremap fc :action ReformatCode<CR>
" 指定InspectCode
nnoremap <Leader>ic :action InspectCode<CR>
" idea自带的搜索功能
nnoremap f :action Find<CR>
" gi   GotoImplementation
nnoremap gi :action GotoImplementation<CR>
" gd   GotoDeclaration
nnoremap gd :action GotoDeclaration<CR>
" gf GotoFile
nnoremap gf :action GotoFile<CR>
" 设置debug为 zd
nnoremap zd :action Debug<CR>



"" Map <leader>d to start debug
"map <leader>d <Action>(Debug)

"" Map \b to toggle the breakpoint on the current line
"map \b <Action>(ToggleLineBreakpoint)


" Find more examples here: https://jb.gg/share-ideavimrc

