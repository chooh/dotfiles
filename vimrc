" Set up Vundle:
" $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Install Plugins from command line:
" $ vim +PluginInstall +qall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'bling/vim-airline'
Plugin 'chooh/brightscript.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'kylef/apiblueprint.vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'matchit.zip'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'

call vundle#end()
filetype plugin indent on

set nocompatible
set incsearch
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
" backspace for dummys
set backspace=indent,eol,start
set ruler
set modeline
" bash-like filenames completion
set wildmode=longest,full
set wildmenu
set hlsearch

"nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

set directory=/tmp/
set encoding=utf-8

set ignorecase

let mapleader = ","

syntax on
set background=dark
colorscheme solarized
map <leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" bind <leader>d to toggle file browser
" requires NERDTree
nmap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

map <D-/> <C-O>,c<space>

" Omnicompletion
imap <c-space> <c-x><c-o>

"" Make it obvious where 80 characters is
"" New rule: 100 chars width
set textwidth=100
set colorcolumn=+1

"use :set list! to toggle visible whitespace on/off
set list
set listchars=nbsp:¬,tab:>-,trail:•,extends:➮

" jbuilder
au BufNewFile,BufRead *.jbuilder        set filetype=ruby

au BufNewFile,BufRead *.brs setlocal shiftwidth=4

" AirLine settings
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_section_b="%f%m"
let g:airline_section_c=""
let g:airline_section_z = '%3l:%3v'
set laststatus=2

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Syntastic

let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 1    " For correct works of next/previous error navigation

" open quicfix window with all error found
nmap <silent> <leader>ll :Errors<cr>
" previous syntastic error
nmap <silent> [ :lprev<cr>
" next syntastic error
nmap <silent> ] :lnext<cr>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " map Ag to `\` character:
  nnoremap \ :Ag<SPACE>

  " This searches for the text under the cursor and shows the results in a
  " “quickfix” window:
  nnoremap K :Ag "\b<cword>\b"<CR>
endif

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
