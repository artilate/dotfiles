" auto-install vim-plug
if empty(glob('C:\Users\aleck\AppData\Local\nvim\autoload\plug.vim'))
  silent !curl -fLo C:\Users\aleck\AppData\Local\nvim\autoload\plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(C:\Users\aleck\AppData\Local\nvim\autoload\plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
	" COC
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()