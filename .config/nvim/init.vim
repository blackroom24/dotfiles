"        _       _ _
" __   _(_)_ __ (_) |_
" \ \ / / | '_ \| | __|
"  \ V /| | | | | | |_
"   \_/ |_|_| |_|_|\__|
set nocompatible
let mapleader = ";"
" installs vim-plug if not found
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading vim-plug"
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif
" Plugins
filetype off
call plug#begin('~/.config/nvim/plugged')
" essentials
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-entire'
    Plug 'kana/vim-textobj-line'
" ui specific
    Plug 'ayu-theme/ayu-vim' " used when i am edgy
    Plug 'xdefrag/vim-beelzebub' " disable termguicolors used with th1 term
    " Plug 'rakr/vim-one' " used by onehalfdark term
    Plug 'lifepillar/vim-solarized8' " used with solarized term
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
call plug#end()
filetype plugin indent on
" Basic Settings
syntax on
set encoding=utf-8
set number relativenumber
set title
set splitbelow splitright
set ruler
set linebreak
set wrap
set showcmd
set textwidth=79
set formatoptions=tcqrn1
" Whitespace
set autoindent
set smartindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
" Misc
set autoread
set autowrite
set scrolloff=3
set backspace=indent,eol,start
set nomodeline
set hidden
set lazyredraw
set conceallevel=0
set ttyfast
" Ui settings
if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif
set background=dark
colorscheme solarized8_flat
set cursorline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" Searching
set hlsearch
set incsearch
set smartcase
set showmatch
noremap <leader><space> :let @/=''<CR>
" Make tags
command! MakeTags !ctags -R .
" Return Cursor on last edit
augroup line_return
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute "normal! g`\"" |
                \endif
augroup END
" Reloads xresources and xdefaults
autocmd VimLeave *Xresources,*Xdefaults !xrdb %
" Removes comments on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Removes trailing whitespaces
augroup remove_trailing_whitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * %s/\n\+\%$//e
augroup END
" Some Lang specific commands
autocmd BufNewFile,BufRead *.py " making sure it is pep8 compliant
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
autocmd BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2
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
noremap <leader><tab> :b#<CR>
noremap <leader>d :bd <CR>
noremap <leader>b :buffers <CR>:b<space>
" vimdiff
if &diff
    highlight! link DiffText MatchParen
endif
