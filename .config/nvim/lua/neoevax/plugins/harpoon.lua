return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      local keymap = vim.keymap -- for conciseness
      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      -- Harpoon Keymaps
      keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = '[A]dd file to Harpoon' })
      keymap.set('n', '<leader>he', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Toggle Harpoon' })

      keymap.set('n', '<C-1>', function()
        harpoon:list():select(1)
      end)
      keymap.set('n', '<C-2>', function()
        harpoon:list():select(2)
      end)
      keymap.set('n', '<C-3>', function()
        harpoon:list():select(3)
      end)
      keymap.set('n', '<C-4>', function()
        harpoon:list():select(4)
      end)
      keymap.set('n', '<leader>h1', function()
        harpoon:list():select(1)
      end)
      keymap.set('n', '<leader>h2', function()
        harpoon:list():select(2)
      end)
      keymap.set('n', '<leader>h3', function()
        harpoon:list():select(3)
      end)
      keymap.set('n', '<leader>h4', function()
        harpoon:list():select(4)
      end)
    end,
  },
}
