return {
  { 'jiangmiao/auto-pairs' }, 
  { 'tpope/vim-repeat' }, 
  { 
    'alvan/vim-closetag',
    config = function()
      vim.g.closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'
    end
  }, 
  { 'tpope/vim-surround' }
}
