set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'bling/vim-airline'

Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'tomtom/tcomment_vim'
Plugin 'ecomba/vim-ruby-refactoring'

Plugin 'kien/rainbow_parentheses.vim'
Plugin 'chrisbra/colorizer'
Plugin 'gregsexton/matchtag'
Plugin 'bronson/vim-trailing-whitespace'

call vundle#end()            " required
filetype plugin indent on    " required

"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

syntax on

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

set splitright
set splitbelow

set autoindent
set number
set modeline

set nobackup
set noswapfile

set wildmenu
set laststatus=2

"
" fugitive
"
nmap gs :Gstatus<cr>
nmap gl :Gllog<cr>
nmap gpu :Git push<cr>

"
" CtrlP
"

let g:ctrlp_map = '<c-p>'

"
" Tagbar
"
nmap <F8> :TagbarToggle<CR>

" Solarize
"

colorscheme gruvbox
set background=dark

let g:airline#extensions#tabline#enabled = 1

let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_iminsert=0

map <C-n> :NERDTreeToggle<CR>
