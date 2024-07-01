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
vim.keymap.set('n', '<leader>tb', '<cmd>Barbecue toggle<CR>', { desc = 'Toggle [B]arebecue' })

-- ChatGPT keymaps
vim.keymap.set('n', '<leader>cc', '<cmd>ChatGPT<CR>', { desc = 'ChatGPT' })
vim.keymap.set({ 'n', 'v' }, '<leader>ce', '<cmd>ChatGPTEditWithInstruction<CR>', { desc = 'Edit with instruction' })
vim.keymap.set({ 'n', 'v' }, '<leader>cg', '<cmd>ChatGPTRun grammar_correction<CR>', { desc = 'Grammar Correction' })
vim.keymap.set({ 'n', 'v' }, '<leader>ct', '<cmd>ChatGPTRun translate<CR>', { desc = 'Translate' })
vim.keymap.set({ 'n', 'v' }, '<leader>ck', '<cmd>ChatGPTRun keywords<CR>', { desc = 'Keywords' })
vim.keymap.set({ 'n', 'v' }, '<leader>cd', '<cmd>ChatGPTRun docstring<CR>', { desc = 'Docstring' })
vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>ChatGPTRun add_tests<CR>', { desc = 'Add Tests' })
vim.keymap.set({ 'n', 'v' }, '<leader>co', '<cmd>ChatGPTRun optimize_code<CR>', { desc = 'Optimize Code' })
vim.keymap.set({ 'n', 'v' }, '<leader>cs', '<cmd>ChatGPTRun summarize<CR>', { desc = 'Summarize' })
vim.keymap.set({ 'n', 'v' }, '<leader>cf', '<cmd>ChatGPTRun fix_bugs<CR>', { desc = 'Fix Bugs' })
vim.keymap.set({ 'n', 'v' }, '<leader>cx', '<cmd>ChatGPTRun explain_code<CR>', { desc = 'Explain Code' })
vim.keymap.set({ 'n', 'v' }, '<leader>cr', '<cmd>ChatGPTRun roxygen_edit<CR>', { desc = 'Roxygen Edit' })
vim.keymap.set({ 'n', 'v' }, '<leader>cl', '<cmd>ChatGPTRun code_readability_analysis<CR>', { desc = 'Code Readability Analysis' })

-- Go Specific Keymaps
vim.keymap.set('n', '<leader>gj', '<cmd>GoTagAdd json<CR>', { desc = 'Add [J]son struct tags' })
vim.keymap.set('n', '<leader>gy', '<cmd>GoTagAdd json<CR>', { desc = 'Add [Y]aml struct tags' })
vim.keymap.set('n', '<leader>gt', '<cmd>GoMod tidy<CR>', { desc = 'Go mod [T]idy' })
vim.keymap.set('n', '<leader>gi', '<cmd>GoIfErr<CR>', { desc = 'Generate [I]f error blocks' })
vim.keymap.set('n', '<leader>gg', '<cmd>GoTestAll<CR>', { desc = 'Generate tests' })

-- Don't put the character into the clipboard/register
vim.keymap.set('n', 'x', '"_x')

vim.keymap.set('n', '<C-j>', function()
  vim.diagnostic.goto_next()
end)
