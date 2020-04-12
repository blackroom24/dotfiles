"        _       _ _   
" __   _(_)_ __ (_) |_ 
" \ \ / / | '_ \| | __|
"  \ V /| | | | | | |_ 
"   \_/ |_|_| |_|_|\__|

set nocompatible
let mapleader = ";"

"Plugins {
filetype off
call plug#begin()
"Essentials
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
"Code Specific
Plug 'w0rp/ale'
Plug 'chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'
"Text Objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
"UI
Plug 'blackroom24/predawn.vim'
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Searching RIP Ctrl-P
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()
filetype plugin indent on
"}

"Colorscheme Predawn {
set background=dark
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1
colorscheme predawn
set termguicolors
"}

"Basic Settings {
syntax on
set encoding=utf-8
set number relativenumber
au BufWrite *.py :Autoformat
" }

"Syntax Checking {
let g:ale_set_highlights=0
" let g:ale_sign_error = '●'
" let g:ale_sign_warning = '●'
let g:ale_sign_error = '∙'
let g:ale_sign_warning = '∙'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_fixers = { 'python': ['remove_trailing_lines', 'trim_whitespace', 'isort', 'yapf'] }
"}

"Whitespace Settings {
set textwidth=79
set formatoptions=tcqrn1
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set wrap
set noshiftround
"}

"Miscelaneous {
set ttyfast
set ruler
set modelines=0
set autowrite
set showmode
set showcmd
set autoindent
set smartindent
command! MakeTags !ctags -R .
" }

"Cursor Settings {
set scrolloff=3
set backspace=indent,eol,start
set cursorline
"}

"SEARCHING {
"Infile Search
set hlsearch
set incsearch
set smartcase
set showmatch
noremap <leader><space> :let @/=''<CR>
"File Search
noremap <leader><leader> :Files <CR>
"}

"Cursor on last EDIT {
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute "normal! g`\"" |
                \endif
augroup END
"}

"Navigation {
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap H gT
noremap L gt
noremap <C-j> <C-W><C-j>
noremap <C-k> <C-W><C-k>
noremap <C-h> <C-W><C-h>
noremap <C-l> <C-W><C-l>
noremap N :bn <CR>
noremap P :bp <CR>
noremap <leader><tab> :b#<CR>
noremap <leader>d :bd <CR>
noremap <leader>bb :buffers <CR>:b<space>
noremap <leader>n :NERDTreeToggle <CR>
" }
