"        _       _ _
" __   _(_)_ __ (_) |_
" \ \ / / | '_ \| | __|
"  \ V /| | | | | | |_
"   \_/ |_|_| |_|_|\__|
set nocompatible
let mapleader = ";"
" Plugins
filetype off
call plug#begin()
" essentials
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
call plug#end()
filetype plugin indent on
" Basic Settings
syntax on
set encoding=utf-8
set number relativenumber
set splitbelow
" Searching
set hlsearch
set incsearch
set smartcase
set showmatch
noremap <leader><space> :let @/=''<CR>
" Make tags
command! MakeTags !ctags -R .
" Return Cursors on last edit
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute "normal! g`\"" |
                \endif
augroup END
" Reloads xresources and xdefaults
autocmd VimLeave *Xresources,*Xdefaults !xrdb %
" Removes trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e
" Split Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" welcome to the fold
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" Buffer Navigation
noremap N :bn <CR>
noremap P :bp <CR>
noremap <leader><tab> :b#<CR>
noremap <leader>d :bd <CR>
noremap <leader>bb :buffers <CR>:b<space>
