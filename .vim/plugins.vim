call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
"Plug 'shinchu/lightline-gruvbox.vim'
Plug 'dracula/vim'

" Color picker
Plug 'norcalli/nvim-colorizer.lua'

" Typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" IDE
Plug 'easymotion/vim-easymotion'

" Folder explorer
Plug 'scrooloose/nerdtree'
" Find files
Plug 'wincent/command-t', {
   \   'do': 'cd lua/wincent/commandt/lib && make'
   \ }

" Find inside files
Plug 'mileszs/ack.vim'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Pretty js coding
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Pretty XML
" Plug 'othree/xml.vim'
  
" Status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
    
" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Syntax
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'sheerun/vim-polyglot'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()
