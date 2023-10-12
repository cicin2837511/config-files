"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                         
"                         _                 
" _ __ ___  _   _  __   _(_)_ __ ___ 
"| '_ ` _ \| | | | \ \ / / | '_ ` _ \
"| | | | | | |_| |  \ V /| | | | | | |
"|_| |_| |_|\__, |   \_/ |_|_| |_| |_|
"           |___/
"                  __ _                       _   _                __ _ _
"  ___ ___  _ __  / _(_) __ _ _   _ _ __ __ _| |_(_) ___  _ __    / _(_) | ___
" / __/ _ \| '_ \| |_| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \  | |_| | |/ _ \
"| (_| (_) | | | |  _| | (_| | |_| | | | (_| | |_| | (_) | | | | |  _| | |  __/
" \___\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_| |_| |_|_|\___|
""""""""""""""""""""""""|___/"""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""
""look""
""""""""

"numbers
set number
set relativenumber

" colors
set background=dark

" syntax highlighting
syntax on

"""""""""""""
"keybindings"
"""""""""""""
inoremap kj <Esc>
cnoremap kj <Esc>
vnoremap kj <Esc>
inoremap <C-s> :Files<Cr>
vnoremap <C-s> :Files<Cr>
nnoremap <C-s> :Files<Cr>
cnoremap <C-s> :Files<Cr>

""""""""""
"behavior"
""""""""""

" indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" some stuff in the background
set fileformat=unix
set nocompatible
set encoding=utf-8

" autocomplete
set wildmode=longest,list,full

" statusbar
set laststatus=2

"""""""""
"plugins"
"""""""""

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" some basic good settings
Plug 'tpope/vim-sensible'

" Themes
Plug 'junegunn/seoul256.vim'

" vimwiki (something like markdown in obsidian or org mode in emacs)
Plug 'vimwiki/vimwiki'

" finder for any file
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" statusbar (needs the 'set statusbar=2' thing on line 59)
Plug 'vim-airline/vim-airline'
" Themes for the statusbar
Plug 'vim-airline/vim-airline-themes'

" color highlighting for example #ff0000 has red background
Plug 'ap/vim-css-color'
call plug#end()

""""""""""""""""""""""
"settings for plugins"
""""""""""""""""""""""

" vim-airline/vim-airline and vim-airline/vim-airline-themes
let g:airline_theme='monochrome'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
