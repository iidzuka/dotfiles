if has('vim_starting')
  " 初回起動時のみruntimepathにneobundleのパスを指定する
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundle "slim-template/vim-slim"
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'digitaltoad/vim-pug'
NeoBundle 'miyakogi/seiya.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'hail2u/vim-css3-syntax'
call neobundle#end()
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
let g:seiya_auto_enable = 1
syntax on
set number
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set nocompatible
set backspace=indent,eol,start
set encoding=utf-8
set hlsearch
set background=dark

nmap <Esc><Esc><Esc> :nohlsearch<CR><Esc>
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

autocmd BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
au BufRead,BufNewFile,BufReadPre *.jade set filetype=pug

set viminfo='50,\"1000,n~/.viminfo

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
