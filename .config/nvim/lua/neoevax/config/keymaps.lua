local keymap = vim.keymap -- for conciseness
-- TIP: Disable arrow keys in normal mode
keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NvimTree
keymap.set('n', '<leader>te', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' }) -- toggle file explorer
keymap.set('n', '<leader>tc', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' }) -- collapse file explorer
keymap.set('n', '<leader>tr', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' }) -- refresh file explorer

-- Moving between panes
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Markdown
keymap.set('n', '<leader>mw', '<cmd>MarkmapWatch<CR>', { desc = 'Watch for changes' })
keymap.set('n', '<leader>ms', '<cmd>MarkmapSave<CR>', { desc = 'Save Markmap' })
keymap.set('n', '<leader>mo', '<cmd>MarkmapOpen<CR>', { desc = 'Open Markmap' })
keymap.set('n', '<leader>mk', '<cmd>MarkmapWatchStop<CR>', { desc = 'Manual Close Watch Markmap' })

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
keymap.set('n', '<leader>td', Toggle_diagnostics, { noremap = true, silent = true, desc = 'Toggle [D]iagnostic' })
keymap.set('n', '<leader>tp', '<cmd>Precognition toggle<CR>', { desc = 'Toggle [P]recognition' })
keymap.set('n', '<leader>ts', '<cmd>SupermavenToggle<CR>', { desc = 'Toggle [S]upermaven' })
keymap.set('n', '<leader>tk', '<cmd>Screenkey toggle<CR>', { desc = 'Toggle Screen[K]ey' })
keymap.set('n', '<leader>tb', '<cmd>Barbecue toggle<CR>', { desc = 'Toggle [B]arebecue' })
keymap.set('n', '<leader>tf', '<cmd>FormatToggle<CR>', { desc = 'Toggle [F]ormat' })
keymap.set('n', '<leader>tl', function()
  vim.g.codespell_active = not vim.g.codespell_active
  if vim.g.codespell_active then
    vim.notify('Enabled codespell', vim.log.levels.INFO)
    vim.g.try_lint()
  else
    vim.notify('Disabled codespell', vim.log.levels.INFO)
    vim.diagnostic.reset(nil, 0)
  end
end, { desc = 'Toggle codespe[l]l' })

-- Go Specific Keymaps
keymap.set('n', '<leader>gj', '<cmd>GoTagAdd json<CR>', { desc = 'Add [J]son struct tags' })
keymap.set('n', '<leader>gy', '<cmd>GoTagAdd json<CR>', { desc = 'Add [Y]aml struct tags' })
keymap.set('n', '<leader>gt', '<cmd>GoMod tidy<CR>', { desc = 'Go mod [T]idy' })
keymap.set('n', '<leader>gi', '<cmd>GoIfErr<CR>', { desc = 'Generate [I]f error blocks' })
keymap.set('n', '<leader>gg', '<cmd>GoTestAll<CR>', { desc = 'Generate tests' })

-- Oil

keymap.set('n', '<leader>to', '<cmd>Oil<CR>', { desc = 'Toggle [O]il' })
-- Don't put the character into the clipboard/register
keymap.set('n', 'x', '"_x')

-- vim.keymap.set('n', '<C-j>', function()
--   vim.diagnostic.goto_next()
-- end)
