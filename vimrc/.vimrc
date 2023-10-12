""""""""""""""""""""""""""_""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
set background=dark
set number
set relativenumber
syntax on
inoremap kj <Esc>
cnoremap kj <Esc>
vnoremap kj <Esc>
inoremap <C-s> :Files<Cr>
vnoremap <C-s> :Files<Cr>
nnoremap <C-s> :Files<Cr>
cnoremap <C-s> :Files<Cr>
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
set nocompatible
set encoding=utf-8
set wildmode=longest,list,full
set laststatus=2
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
"Plug 'itchyny/lightline.vim'
Plug 'vifm/vifm.vim'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:airline_theme='monochrome'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
