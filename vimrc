" Set up Vundle:
" $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Install Plugins from command line:
" $ vim +PluginInstall +qall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'junegunn/fzf.vim'
Plugin 'kylef/apiblueprint.vim'
Plugin 'matchit.zip'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on

set autoindent                    " carry over indenting from previous line
set autoread                      " don't bother me hen a file changes
set autowrite                     " write on :next/:prev/^Z
set backspace=indent,eol,start    " backspace for dummys
set colorcolumn=+1
set directory=/tmp/
set encoding=utf-8
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list                          " use :set list! to toggle visible whitespace on/off
set listchars=nbsp:¬,tab:>-,trail:•,extends:➮
set modeline
set number
set relativenumber
set shiftwidth=2
set smarttab
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
nmap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

map <D-/> <C-O>,c<space>

" Omnicompletion
imap <c-space> <c-x><c-o>

" Use the space key to toggle folds
nnoremap <space> za
vnoremap <space> zf

autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead *.brs setlocal shiftwidth=4
autocmd Filetype php setlocal ts=4 sts=4 sw=4

" AirLine settings
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_section_b="%f%m"
let g:airline_section_c=""
let g:airline_section_z = '%3l:%3v'

" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
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

map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]

map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '

map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .

map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }

map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "

map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
