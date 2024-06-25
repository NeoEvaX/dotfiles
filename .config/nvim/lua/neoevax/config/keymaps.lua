-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Moving between panes
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Toggles
function Toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.enable(false, _)
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.enable()
  end
end
vim.keymap.set('n', '<leader>td', Toggle_diagnostics, { noremap = true, silent = true, desc = 'Toggle [D]iagnostic' })
vim.keymap.set('n', '<leader>tp', '<cmd>Precognition toggle<CR>', { desc = 'Toggle [P]recognition' })
vim.keymap.set('n', '<leader>ts', '<cmd>SupermavenToggle<CR>', { desc = 'Toggle [S]upermaven' })
vim.keymap.set('n', '<leader>tk', '<cmd>Screenkey toggle<CR>', { desc = 'Toggle Screen[K]ey' })

-- Go Specific Keymaps
vim.keymap.set('n', '<leader>gj', '<cmd>GoTagAdd json<CR>', { desc = 'Add [J]son struct tags' })
vim.keymap.set('n', '<leader>gy', '<cmd>GoTagAdd json<CR>', { desc = 'Add [Y]aml struct tags' })
vim.keymap.set('n', '<leader>gt', '<cmd>GoMod tidy<CR>', { desc = 'Go mod [T]idy' })
vim.keymap.set('n', '<leader>gi', '<cmd>GoIfErr<CR>', { desc = 'Generate [I]f error blocks' })
vim.keymap.set('n', '<leader>gg', '<cmd>GoTestAll<CR>', { desc = 'Generate tests' })

-- Don't put the character into the clipboard/register
vim.keymap.set('n', 'x', '_x')

vim.keymap.set('n', '<C-j>', function()
  vim.diagnostic.goto_next()
end)
