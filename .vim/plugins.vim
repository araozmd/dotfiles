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
Plug 'preservim/nerdtree' |
  \ Plug 'Xuyuanp/nerdtree-git-plugin' |
  \ Plug 'ryanoasis/vim-devicons'

" Find files
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Find inside files
Plug 'mileszs/ack.vim'

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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

" Error checking
" Plug 'folke/trouble.nvim' |
"   \ Plug 'nvim-tree/nvim-web-devicons' |
"   \ Plug 'neovim/nvim-lspconfig' |
"   \ Plug 'williamboman/mason.nvim'

call plug#end()
