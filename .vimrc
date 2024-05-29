set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax on
set colorcolumn=80
set showcmd
set ruler 
set cursorline
set encoding=utf-8
set showmatch
set smartindent
set ts=2
set expandtab
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set termguicolors

so ~/.vim/plugins.vim
so ~/.vim/maps.vim
so ~/.vim/plugins-config.vim
" 
" lua << EOF
"   require("mason").setup()
" EOF
