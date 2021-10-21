" Set up vim-plug:
" $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Install plugins from command line:
" $ nvim +PlugInstall +qall

call plug#begin(stdpath('data') . '/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
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

autocmd BufEnter * :checktime

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

" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous

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

" # Make background transparent
hi Normal guibg=NONE ctermbg=NONE

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

lua << EOF
local lspconfig = require('lspconfig')

lspconfig.solargraph.setup {
  settings = {
    solargraph = {
      diagnostics = true,
      useBundler = true
    }
  }
}

lspconfig.elixirls.setup{
cmd = { "elixir-ls" };
}

vim.lsp.set_log_level("debug")
EOF

lua << EOF
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
    emoji = true;
  };
}
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF
