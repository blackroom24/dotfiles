"
"                                        ________ ++     ________
"                                       /VVVVVVVV\++++  /VVVVVVVV\
"                                       \VVVVVVVV/++++++\VVVVVVVV/
"                                        |VVVVVV|++++++++/VVVVV/'
"                                        |VVVVVV|++++++/VVVVV/'
"                                       +|VVVVVV|++++/VVVVV/'+
"                                     +++|VVVVVV|++/VVVVV/'+++++
"                                   +++++|VVVVVV|/VVVVV/'+++++++++
"                                     +++|VVVVVVVVVVV/'+++++++++
"                                       +|VVVVVVVVV/'+++++++++
"                                        |VVVVVVV/'+++++++++
"                                        |VVVVV/'+++++++++
"                                        |VVV/'+++++++++
"                                        'V/'   ++++++
"                                                 ++
"    __/\\\________/\\\__/\\\\\\\\\\\__/\\\\____________/\\\\____/\\\\\\\\\____________/\\\\\\\\\_
"     _\/\\\_______\/\\\_\/////\\\///__\/\\\\\\________/\\\\\\__/\\\///////\\\_______/\\\////////__
"      _\//\\\______/\\\______\/\\\_____\/\\\//\\\____/\\\//\\\_\/\\\_____\/\\\_____/\\\/___________
"       __\//\\\____/\\\_______\/\\\_____\/\\\\///\\\/\\\/_\/\\\_\/\\\\\\\\\\\/_____/\\\_____________
"        ___\//\\\__/\\\________\/\\\_____\/\\\__\///\\\/___\/\\\_\/\\\//////\\\____\/\\\_____________
"         ____\//\\\/\\\_________\/\\\_____\/\\\____\///_____\/\\\_\/\\\____\//\\\___\//\\\____________
"          _____\//\\\\\__________\/\\\_____\/\\\_____________\/\\\_\/\\\_____\//\\\___\///\\\__________
"           ______\//\\\________/\\\\\\\\\\\_\/\\\_____________\/\\\_\/\\\______\//\\\____\////\\\\\\\\\_
"            _______\///________\///////////__\///______________\///__\///________\///________\/////////__
" Leader key
let mapleader = ";"

" Install vim-plug for first time
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading vim-plug"
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

"=================================================================================================================
" PLUGINS
"=================================================================================================================
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
" code specific
Plug 'chiel92/vim-autoformat'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
" utility plugins
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
" ui specific plugins
Plug 'ayu-theme/ayu-vim' " used when i am edgy
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
call plug#end()
filetype plugin indent on
"=================================================================================================================
" BASIC SETTINGS
"=================================================================================================================
set nocompatible
set number relativenumber
set splitbelow splitright
set title
set showcmd
"=================================================================================================================
" TEXT SETTINGS
"=================================================================================================================
syntax on
set encoding=utf-8
set ruler
set linebreak
set wrap
set showmatch
set textwidth=79
set formatoptions=tcqrn1
"=================================================================================================================
" WHITESPACE SETTINGS
"=================================================================================================================
set autoindent
set smartindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
"=================================================================================================================
" SEARCHING SETTINGS
"=================================================================================================================
set hlsearch
set incsearch
set smartcase
"=================================================================================================================
" MISC SETTINGS
"=================================================================================================================
set autoread
set autowrite
set scrolloff=3
set backspace=indent,eol,start
set nomodeline
set hidden
set lazyredraw
set conceallevel=0
set ttyfast
"=================================================================================================================
" UI SETTINGS
"=================================================================================================================
if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif
set background=dark
colorscheme ayu
set cursorline
highlight Comment cterm=italic
"=================================================================================================================
" PLUGIN VARIABLES AND SETTINGS
"=================================================================================================================
" vim airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:ale_set_highlights = 0
" ale settings
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
" Vim Hexokinase
let g:Hexokinase_refreshEvents = ['InsertLeave']
let g:Hexokinase_optInPatterns = [
            \     'full_hex',
            \     'triple_hex',
            \     'rgb',
            \     'rgba',
            \     'hsl',
            \     'hsla',
            \     'colour_names'
            \ ]
let g:Hexokinase_highlighters = ['backgroundfull']
" Reenable hexokinase on enter
autocmd VimEnter * HexokinaseTurnOn
" Autoformat python scripts on save
autocmd Bufwrite *.py Autoformat
"=================================================================================================================
" Commands
"=================================================================================================================
" fix typos
command! W execute 'w'
command! Q execute 'q'
" Make tags
command! MakeTags !ctags -R .
"=================================================================================================================
" UTILITY SETTINGS
"=================================================================================================================
" Return Cursor on last edit
augroup line_return
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute "normal! g`\"" |
                \endif
augroup END
" Reloads xresources and xdefaults
autocmd BufWritePre *Xresources,*Xdefaults !xrdb %
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
" vimdiff
if &diff
    highlight! link DiffText MatchParen
endif
"=================================================================================================================
"  KEYMAPS
"=================================================================================================================
" Safety
nnoremap Q <nop>
" Split Navigation
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l
" clear highlighted search
noremap <silent><leader><space> :let @/=''<CR>
" Normal mode
imap ,. <ESC>
vmap ,. <ESC>
" Resize splits
nnoremap <silent><Up> :resize +2<CR>
nnoremap <silent><Down> :resize -2<CR>
nnoremap <silent><Left> :vertical resize +2<CR>
nnoremap <silent><Right> :vertical resize -2<CR>
" Buffer Navigation
noremap <silent><leader><tab> :b#<CR>
noremap <leader>b :buffers <CR>:b<space>
" Fuzzy
noremap <leader>F :Files<CR>
noremap <leader><space>h : Maps<CR>
