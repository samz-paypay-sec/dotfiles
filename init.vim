set nocompatible

let mapleader = ' '

" Show line number
set number
set relativenumber

" Tab
set tabstop=2
set shiftwidth=2
set expandtab

" Visuals
set encoding=utf-8
set t_CO=256

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
" normal regex
nnoremap / /\v

" ReaLoad a file if was changed outside of Vim
set autoread

" Giff target<-local copy->merge
set diffopt+=vertical

noremap <Leader>w :write<CR>
noremap <Leader>q <C-W><C-C>
noremap <Leader>l :set cursorcolumn!<CR>

" No highlight
nnoremap <C-C> :nohl<CR><C-C>

" Source vimrc
nnoremap <Leader>s :source<space>$MYVIMRC<CR>
" edit vimrc
nnoremap <Leader>e :edit<space>$MYVIMRC<CR>

" open help vertically
cabbrev h vertical help

set nofixendofline

set hidden

set updatetime=100

set termguicolors

" Neovim terminal
autocmd TermOpen * setlocal nonumber norelativenumber
tnoremap <Esc> <C-\><C-n>

set clipboard+=unnamedplus

set nobackup
set nowritebackup
set noundofile
set noswapfile

" use treesitter
syntax off

" copy current file path
command CopyPath let @* = expand("%")

" ----------*---------- ----------*---------- ----------*---------- "

call plug#begin('~/.vim/plugged')
  Plug 'morhetz/gruvbox'

  Plug 'preservim/nerdtree'
  Plug 'google/vim-searchindex'

  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'Raimondi/delimitMate'

  " Plug 'editorconfig/editorconfig-vim'

  " Completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " HTML
  Plug 'mattn/emmet-vim'

  " Formatter
  Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'typescriptreact', 'vue', 'css', 'json', 'markdown', 'html'] }
  Plug 'godlygeek/tabular'

  "" Syntax highlight
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " neovim
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'numToStr/Comment.nvim'
  Plug 'danymat/neogen'
call plug#end()

set background=dark
colorscheme gruvbox

" fzf
let g:fzf_preview_window = ''
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \ 'rg --column --line-number --no-heading --color=always --smart-case ' . (<bang>0 ? '--fixed-strings ' : '') . <q-args>,
      \ 1, fzf#vim#with_preview('up:40%:hidden', '?'), 1)

nnoremap <Leader>b :Buffers<CR>
nnoremap <C-P> :GFiles --recurse-submodules<CR>
nnoremap <Leader>m :Commands<CR>
nnoremap <Leader>rg yiw:Rg! <C-R>"<CR>
vnoremap <Leader>rg y:<c-u>Rg! '<C-R>"'<CR>
nnoremap <Leader>rr yiw:Rg! <C-R>" <C-R>%
vnoremap <Leader>rr y:<c-u>Rg! '<C-R>"' <C-R>%

" Prettier
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'es5'
" let g:prettier#config#bracket_spacing = 'true'
" nnoremap gp :silent %!prettier --no-config --stdin --stdin-filepath % --trailing-comma all --single-quote<CR>


" GitGutter
let g:gitgutter_map_keys = 0

" NerdTree
let NERDTreeShowHidden=1
nmap <Leader>n :NERDTree
nmap <Leader>nf :NERDTreeFind<CR>
nmap <Leader>nc :NERDTreeClose<CR>
nmap <Leader>nv :NERDTreeVCS<CR>

" Fugitive
nmap <Leader>gb :Git blame<CR>

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> dp <Plug>(coc-diagnostic-prev)
nmap <silent> dn <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 CocStop :call coc#rpc#stop()

" Emmet  
let g:user_emmet_leader_key = '<C-K>'


" built in editorconfig
let g:editorconfig = v:false

" JoosepAlviste/nvim-ts-context-commentstring
lua << EOF
require('ts_context_commentstring').setup {
  enable_autocmd = false,
}
EOF

" numToStr/Comment.nvim
lua << EOF
require('Comment').setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
EOF

" danymat/neogen
lua << EOF
require('neogen').setup {}
EOF
