" Provider configurations
if has('python')
	set pyx=2
elseif has('python3')
	set pyx=3
endif

let g:perl_host_prog='/opt/homebrew/bin/perl'

" HTML, JSX
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'
" Lightlane
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      \   'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
      \ },
      \ 'inactive': {
      \   'left': [['inactive'], ['relativepath']],
      \   'right': [['bufnum']]
      \ },
      \ 'component': {
      \   'bufnum': '%n',
      \   'inactive': 'inactive'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'kitestatus': 'kite#statusline'
      \ },
      \ 'colorscheme': 'dracula',
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \}

" Vim find files config 
set wildignore+=*/node_modules,*/target

" ******* Git ** vim-gitgutter
let g:gitgutter_sign_added = ' '
let g:gitgutter_sign_modified = ' '
let g:gitgutter_sign_removed = ' '
let g:gitgutter_sign_removed_first_line = ' '
let g:gitgutter_sign_modified_removed = ' '
