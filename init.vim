" Set up vim-plug:
" $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Install plugins from command line:
" $ nvim +PlugInstall +qall

call plug#begin(stdpath('data') . '/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'shougo/deoplete-lsp'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'

call plug#end()

" HARD MODE
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set autoindent                    " carry over indenting from previous line
set autoread                      " don't bother me hen a file changes
set autowrite                     " write on :next/:prev/^Z
set backspace=indent,eol,start    " backspace for dummys
set colorcolumn=+1
set encoding=utf-8
set expandtab
set hlsearch
set ignorecase
set inccommand=nosplit
set incsearch
set laststatus=2
set list                          " use :set list! to toggle visible whitespace on/off
set listchars=nbsp:¬,tab:>-,trail:•,extends:➮
set modeline
set relativenumber
set shiftwidth=2
set smarttab
set spell
set spelllang=en,ru
set tabstop=2
set textwidth=100  " Make it obvious where 100 characters is
set updatetime=500
set wildignorecase
set wildmenu
set wildmode=longest,full   " bash-like filenames completion

let mapleader = ","

syntax on
set background=dark
colorscheme solarized
map <leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
set pastetoggle=<leader>pp

" bind <leader>d to toggle file browser
" requires NERDTree
nnoremap <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" bind <leader>b to toggle tag browser
nnoremap <silent> <leader>b :TagbarToggle<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>

autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead *.brs setlocal shiftwidth=4
autocmd Filetype php setlocal ts=4 sts=4 sw=4

" AirLine settings
let g:airline#extensions#hunks#enabled = 0
" truncate long branch names to a fixed length >
let g:airline#extensions#branch#displayed_head_limit = 10
" truncate all path sections but the last one
let g:airline#extensions#branch#format = 2
let g:airline_section_z = '%3l:%3v'

" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
nmap ; :Buffers<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Ag<CR>

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

" map Ack to `\` character:
nnoremap \ :Ack<SPACE>

" Syntastic

" Enable autochecks
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
" For correct works of next/previous error navigation
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checkers=['eslint']

" open quickfix window with all error found
nmap <silent> <leader>ll :Errors<cr>
" previous syntastic error
nmap <silent> [ :lprev<cr>
" next syntastic error
nmap <silent> ] :lnext<cr>

" # Easier split navigations
"
" We can use different key mappings for easy navigation between splits to save a keystroke.
" So instead of `ctrl-w` then `j`, it’s just `ctrl-j`:

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" # More natural split opening
"
" Open new split panes to right and bottom, which feels more natural than Vim’s default:

set splitbelow
set splitright

let g:deoplete#enable_at_startup = 1
