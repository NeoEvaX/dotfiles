return {

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').add {
        { '<leader>s', desc = '[S]earch', icon = '󰍉' },
        { '<leader>t', desc = '[T]oggle', icon = '' },
        { '<leader>l', desc = '[L]SP', icon = '' },
        { '<leader>g', desc = '[G]o', icon = '' },
        { '<leader>d', desc = '[D]ebug', icon = '' },
        { '<leader>h', desc = '[H]arpoon', icon = '󱡅' },
        { '<leader>o', desc = '[O]sidian', icon = '󰇈' },
        { '<leader>c', desc = '[C]hatGPT', icon = '󰚩' },
        { '<leader>m', desc = '[M]arkdown', icon = '󱇠' },
      }
    end,
  },
}
