set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim


""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'nathangrigg/vim-ledger'
Plugin 'junegunn/goyo.vim'
Plugin 'mtth/scratch.vim'
Plugin 'scrooloose/syntastic'
Plugin 'plasticboy/vim-markdown'
Plugin 'Raimondi/delimitMate'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'Shougo/vimproc'
Plugin 'Shougo/vimshell'
"Plugin 'Shougo/neocomplete'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/vim-easy-align'
Plugin 'ervandew/supertab'
Plugin 'freitass/todo.txt-vim'
Plugin 'tpope/vim-fugitive'

Plugin 'edthedev/minion'
Plugin 'mattn/calendar-vim'
Plugin 'vimwiki/vimwiki'
Plugin 'imain/notmuch-vim'
Plugin 'vim-scripts/a.vim'
"Plugin 'klen/python-mode'
"Plugin 'rdnetto/YCM-Generator'
"Plugin 'scrooloose/nerdtree'
"Plugin 'jceb/vim-orgmode'
"Plugin 'xolox/vim-notes'

call vundle#end()            " required

if has("gui_running")
  if has("gui_gtk2")
    "set guifont=Inconsolata-dz\ for\ Powerline\ 8
    set guifont=tewi\ 8
    "set guifont=uushi\ 8
    "set guifont=monofur\ for\ Powerline\ 13
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11
    "set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
   "set guifont=Menlo\ for\ Powerline\ Bold\ 11
  endif
endif

filetype plugin indent on    " required
syntax enable
syntax on


source ~/.vimrc_general
source ~/.vimrc_plugins
nmap <leader>v :e $MYVIMRC<cr>
nmap <leader>vg :e ~/.vimrc_general<cr>
