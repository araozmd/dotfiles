let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s3)
nmap <Leader>nt :NERDTreeFind<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>

" split resize ***************************************************************** 
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" git **************************************************************************
nnoremap <Leader>G :G<cr>
nnoremap <Leader>gp :Git push<cr>
nnoremap <Leader>gl :Git pull<cr>

" FZF
nmap <leader>t :Files<CR>
