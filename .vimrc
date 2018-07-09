call plug#begin('~/.vim/plugged')

" Plugins
Plug 'sickill/vim-monokai'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'nvie/vim-flake8'
Plug 'bling/vim-airline'
Plug 'docunext/closetag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'Raimondi/delimitMate'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'mattn/emmet-vim'
Plug 'ervandew/supertab'
Plug 'tmhedberg/SimpylFold'
Plug 'davidhalter/jedi-vim'
Plug 'posva/vim-vue'

" SnipMate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

call plug#end()

" Line numbers
set number

" Rebind <Leader> key
" Old key: \
" New key: ,
let mapleader = ","

" set cursorline

" Hidden chars
set list!
set list listchars=tab:»>,trail:·,extends:#

" Backspace bug fix
set backspace=2

" Syntax highlighting
syntax enable

" Color scheme settings
colorscheme monokai

autocmd FileType python set colorcolumn=79

" Indenting
set smartindent
set expandtab
set nowrap
set autoindent
set sw=2 ts=2 sts=2
autocmd FileType python :setlocal sw=4 ts=4 sts=4

" Searching
set hlsearch " highlight matches
set incsearch " incremental searching
set ignorecase " searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter

" Clear highlight
nnoremap <space> :noh<return><space>

" File completion
set wildmode=longest,list,full
set wildmenu

" Special copy paste bindings
vnoremap <C-c> "+ygv
vnoremap <C-x> "+x
vnoremap <C-v> c<space><esc>"+gPx
nnoremap <C-v> "+gP
inoremap <C-v> <esc>"+gPa

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <C-t> :CtrlPBuffer<return>

" Ignoring files
set wildignore+=*.pyc

" The NERD tree
map <F2> :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit = "s"
let NERDTreeMapOpenVSplit = "v"
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
" autocmd VimEnter * NERDTree
" Open NERDTReee in case no file is specified
autocmd VimEnter * if eval("@%") == "" | silent NERDTree

" CtrlP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.pyc$\|target$'
let g:ctrlp_switch_buffer = 'etH'

" Powerline hack
set laststatus=2
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Flake8
autocmd BufWritePost *.py call Flake8()
let g:pep8_ignore="E702"

" Folding
" set foldmethod=indent
" set foldnestmax=2

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Quicksave command
noremap <C-z> :update<CR>
vnoremap <C-z> <C-c>:update<CR>
inoremap <C-z> <C-o>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Disable stupid backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Open current file in Google Chrome web browser
nnoremap <silent> <leader>w :!open -a "Google Chrome" %<CR><CR>

" Emmet settings
let g:user_emmet_install_global = 0

autocmd FileType html,css,htmldjango EmmetInstall

" Jedi-vim
autocmd FileType python setlocal completeopt-=preview

" au BufRead,BufNewFile *.vue set filetype=html
