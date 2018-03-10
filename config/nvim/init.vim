if has('vim_starting')
  " Required:
  set runtimepath+=/home/dkoval/.config/nvim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/dkoval/.config/nvim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'shougo/neocomplete.vim'
NeoBundle 'tomasiser/vim-code-dark'
NeoBundle 'w0rp/ale'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'valloric/youcompleteme'
NeoBundle 'Rainbow-Parenthesis'
NeoBundle 'bling/vim-airline'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'elzr/vim-json'
NeoBundle 'othree/html5.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'vim-rubyformat'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set termguicolors
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set showcmd
set cursorline
set incsearch
set hlsearch
set splitbelow
set background=dark
colorscheme codedark

let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"

let g:airline#extensions#tabline#enabled = 1

map <silent> <C-b> :NERDTreeFocus<CR>
map <silent> <C-b> :NERDTreeFocus<CR>

map <silent> <C-n> :enew<CR>
map <silent> <C-o> :edit .<CR>
map <silent> <C-w> :bd<CR>

map  <silent> <C-Left> :bp<CR>
imap <silent> <C-Left> <ESC> :w<CR> :bp<CR>

map  <silent> <C-Right> :bn<CR>
imap <silent> <C-Right> <ESC> :w<CR> :bn<CR>

nmap <silent> <A-t> :e term://screen<CR>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

tmap <silent> <C-Left> <C-\><C-n> :bp<CR>
tmap <silent> <C-Right> <C-\><C-n> :bn<CR>

autocmd BufEnter,TermOpen term://* startinsert
autocmd BufLeave,TermClose term://* stopinsert

autocmd VimEnter,TabEnter * exe "NERDTreeFocus | wincmd l"

let g:rubyformat_on_save = 0
