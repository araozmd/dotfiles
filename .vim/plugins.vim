call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" Typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" IDE
Plug 'easymotion/vim-easymotion'

" Folder explorer
Plug 'scrooloose/nerdtree'
" Find files
" Plug 'samoshkin/vim-find-files'
 Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Autocomplete for Java
Plug 'artur-shaik/vim-javacomplete2' 

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

call plug#end()
