syntax on
set number
set tabstop=2
set expandtab
set autoindent
set nocompatible
set backspace=indent,eol,start
set encoding=utf-8
set hlsearch

nnoremap ; :
nnoremap : ;

nmap <Esc><Esc><Esc> :nohlsearch<CR><Esc>

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
