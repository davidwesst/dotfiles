set nocompatible
syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab

set cursorline
set number
set relativenumber
set signcolumn=yes
set scrolloff=4

set showcmd
set noswapfile
set undodir=~/.vim/undodir
set undofile

set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <Esc> :noh<CR><CR>

" fix for starting in replace mode
set t_u7=

so ~/.vim/plugins-config.vim


