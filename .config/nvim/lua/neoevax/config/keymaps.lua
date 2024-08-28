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

-- ChatGPT keymaps
keymap.set('n', '<leader>cc', '<cmd>ChatGPT<CR>', { desc = 'ChatGPT' })
keymap.set({ 'n', 'v' }, '<leader>ce', '<cmd>ChatGPTEditWithInstruction<CR>', { desc = 'Edit with instruction' })
keymap.set({ 'n', 'v' }, '<leader>cg', '<cmd>ChatGPTRun grammar_correction<CR>', { desc = 'Grammar Correction' })
keymap.set({ 'n', 'v' }, '<leader>ct', '<cmd>ChatGPTRun translate<CR>', { desc = 'Translate' })
keymap.set({ 'n', 'v' }, '<leader>ck', '<cmd>ChatGPTRun keywords<CR>', { desc = 'Keywords' })
keymap.set({ 'n', 'v' }, '<leader>cd', '<cmd>ChatGPTRun docstring<CR>', { desc = 'Docstring' })
keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>ChatGPTRun add_tests<CR>', { desc = 'Add Tests' })
keymap.set({ 'n', 'v' }, '<leader>co', '<cmd>ChatGPTRun optimize_code<CR>', { desc = 'Optimize Code' })
keymap.set({ 'n', 'v' }, '<leader>cs', '<cmd>ChatGPTRun summarize<CR>', { desc = 'Summarize' })
keymap.set({ 'n', 'v' }, '<leader>cf', '<cmd>ChatGPTRun fix_bugs<CR>', { desc = 'Fix Bugs' })
keymap.set({ 'n', 'v' }, '<leader>cx', '<cmd>ChatGPTRun explain_code<CR>', { desc = 'Explain Code' })
keymap.set({ 'n', 'v' }, '<leader>cr', '<cmd>ChatGPTRun roxygen_edit<CR>', { desc = 'Roxygen Edit' })
keymap.set({ 'n', 'v' }, '<leader>cl', '<cmd>ChatGPTRun code_readability_analysis<CR>', { desc = 'Code Readability Analysis' })

-- Go Specific Keymaps
keymap.set('n', '<leader>gj', '<cmd>GoTagAdd json<CR>', { desc = 'Add [J]son struct tags' })
keymap.set('n', '<leader>gy', '<cmd>GoTagAdd json<CR>', { desc = 'Add [Y]aml struct tags' })
keymap.set('n', '<leader>gt', '<cmd>GoMod tidy<CR>', { desc = 'Go mod [T]idy' })
keymap.set('n', '<leader>gi', '<cmd>GoIfErr<CR>', { desc = 'Generate [I]f error blocks' })
keymap.set('n', '<leader>gg', '<cmd>GoTestAll<CR>', { desc = 'Generate tests' })

-- Obsidian Specific Keymaps
keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = 'Opens note in [O]bsidian app' })
keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = 'Lookup all [B]acklinks for note' })
keymap.set('n', '<leader>oj', '<cmd>ObsidianToday<CR>', { desc = "Generate Today's [J]ournal" })
keymap.set('n', '<leader>ot', '<cmd>ObsidianTemplate<CR>', { desc = 'Insert [T]emplate into note' })
keymap.set('n', '<leader>ol', '<cmd>ObsidianLinks<CR>', { desc = 'Show all [L]inks from note' })

-- Oil

keymap.set('n', '<leader>to', '<cmd>Oil<CR>', { desc = 'Toggle [O]il' })
-- Don't put the character into the clipboard/register
keymap.set('n', 'x', '"_x')

-- vim.keymap.set('n', '<C-j>', function()
--   vim.diagnostic.goto_next()
-- end)
