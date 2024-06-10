return {
  'olexsmir/gopher.nvim',
  filetypes = { 'go', 'gomod' },
  requires = { -- dependencies
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local gopher = require 'gopher'
    gopher.setup {
      commands = {
        go = 'go',
        gomodifytags = 'gomodifytags',
        gotests = '~/go/bin/gotests', -- also you can set custom command path
        impl = 'impl',
        iferr = 'iferr',
      },
    }
  end,
  build = function()
    vim.cmd [[silent! GoInstallDeps]]
  end,
}
