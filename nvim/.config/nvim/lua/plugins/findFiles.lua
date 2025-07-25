return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
    },
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = {
            'node_modules',
            '.git',
            'target',
            'dist',
            'logs'
          }
        },
        pickers = {
          find_files = {
            hidden = true
          },
          live_grep = {
            additional_args = function()
              return {"--hidden"}
            end
          }
        }
      }
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<Leader>ff', builtin.find_files)
      vim.keymap.set('n', '<Leader>fg', builtin.live_grep)
      vim.keymap.set('n', '<Leader>fb', builtin.buffers)
      vim.keymap.set('n', '<Leader>fh', builtin.help_tags)
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require 'telescope'.setup {
        extensions = {
          ["ui-select"] = {
            require 'telescope.themes'.get_dropdown {}
          }
        }
      }
      require 'telescope'.load_extension('ui-select')
    end
  }
}
