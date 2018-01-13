" Load Pathogen
execute pathogen#infect()

" Colors
syntax enable
" color dracula
colorscheme deus

set nocompatible              " be iMproved, required
filetype off                  " required
" Make Vim more useful
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
"set clipboard=unnamedplus
" Enhance command-line completion¬
set wildmenu
" Enable line numbers
set number
" Dispalay syntax
syntax on
" Highlight current line
set cursorline
" Turn indent plugin
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Respect modeline in files
set modeline
set modelines=4
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Make backspace work like most other apps
set backspace=indent,eol,start 

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif
" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Set default encoding
set encoding=utf-8

" KEYS MAPPINGS
" Set comma as a leader
let mapleader=","
" Move to the next buffer
nmap <leader>l :bn<cr>
" Move to the previous buffer
nmap <leader>h :bp<cr>

" PLUGINS configuration

" Set smart tab for airline
let g:airline#extensions#tabline#enabled = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled=1
" Show just a filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Idents display
let g:indent_guides_enable_on_vim_startup = 1

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERDtree config
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

