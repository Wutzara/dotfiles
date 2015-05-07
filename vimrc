set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader=","
let maplocalleader="-"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

""""""""""""""""""""""""
" General
""""""""""""""""""""""""
if has("gui_running")
  set lines=999 columns=999
endif
set history=700
set autoread
set t_Co=256
" fast saving
nmap <leader>w :w!<cr>

""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""
set so=7
"set textwidth=80

set wildmenu
set ruler
set wildignore=*.o,*~,*.pyc

set number
set numberwidth=5

set cmdheight=2
set vb

" set hid

set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set hlsearch
set incsearch
set magic

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
"Plugin 'rdnetto/YCM-Generator'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'klen/python-mode'
Plugin 'Raimondi/delimitMate'
Plugin 'ledger/vim-ledger'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/vim-easy-align'
"Plugin 'jceb/vim-orgmode'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

call vundle#end()            " required


""""""""""""""""""""""""
" ultisnips
""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="^"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'


""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""

colorscheme tango2
syntax enable
"set background=dark
set encoding=utf8
set ffs=unix,dos,mac

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata-dz\ for\ Powerline\ 11
    "set guifont=Anonymous\ Pro\ for\ Powerline
    "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
  endif
endif
set colorcolumn=80
highlight ColorColumn guibg=#2b2b2b
highlight ColorColumn ctermbg=24
let &colorcolumn=join(range(81,999),",")
highlight FoldColumn guifg=White guibg=White
highlight Folded guifg=#ffc3c3 guibg=#2d2d2d
""""""""""""""""""""""""
" Files, backups and undo
""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile
""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""
"set expandtab
"set smarttab
"set shiftwidth=2
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

"set lbr
"set tw=500
"set ai
"set si
"set wrap
set autoindent
set smartindent

""""""""""""""""""""""""
" Moving aroung, tabs, windows and buffers
""""""""""""""""""""""""
map j gj
map k gk

map <silent> <leader><cr> :noh<cr>

map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l 
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

set laststatus=2

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

filetype plugin indent on    " required
" Map NERDTreeToggle to convenient key
nnoremap <silent> <leader>n :NERDTreeToggle<cr>

" Youcompleteme
let g:ycm_register_as_syntastic_checker = 1
let g:Show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1

" tagbar
let g:tagbar_ctags_bin = 'anjuta-tags'
nmap <F8> :TagbarToggle<cr>
nmap <F3> :make<cr>
nmap <F4> :make maintainer-clean<cr>
let g:airline_powerline_fonts = 1

nmap <leader>no :e ~/notes.org<cr>

let g:ledger_fillstring = '    -'
let g:ledger_maxwidth = 80
au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger

nmap <leader>is :set list!<CR>

set listchars=tab:▸\ ,eol:¬

highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

let g:notmuch_folders = [
    \ [ 'new', 'tag:inbox and tag:unread'],
    \ [ 'inbox', 'tag:inbox'],
    \ [ 'unread', 'tag:unread'],
    \ [ 'todo', 'tag:to-do' ],
    \ [ 'studium', 'tag:studium' ],
    \ [ 'projekt', 'tag:projekt'],
    \ ]

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd User GoyoEnter call <SID>goyo_enter()
autocmd User GoyoLeave call <SID>goyo_leave()

let g:org_agenda_files=['~/notes.org']

:command! R let f=expand("src/binpacking")|vnew|execute '.!"' . f . '"'
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Ctrlp
"
let g:ctrlp_open_new_file = 'r'
