return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true,
        ts_config = {
          lua = {'string'},
          javascript = {'template_string'},
        }
      })
      -- Integration with nvim-cmp
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
  }, 
  { 'tpope/vim-repeat' }, 
  { 
    'alvan/vim-closetag',
    ft = { 'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    config = function()
      vim.g.closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'
    end
  }, 
  { 'tpope/vim-surround' }
}
