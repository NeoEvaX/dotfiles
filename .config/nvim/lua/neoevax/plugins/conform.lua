local sql_formatter_config = {
  keywordCase = 'upper',
  functionCase = 'upper',
  datatypeCase = 'upper',
}

return {

  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>lf',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = 'LSP: [F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        if vim.g.disable_autoformat or vim.b[bufnr].disabled_autoformat then
          return
        end
        return {
          timeout_ms = 500,
          lsp_fallback = true,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'goimports', 'gofumpt' },
        javascript = { 'biome' },
        typescript = { 'biome' },
        sql = { 'sql_formatter', 'sqlformat', stop_after_first = true },
        cs = { 'csharpier' },
        html = { 'prettier' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
      formatters = {
        sqlformat = {
          -- Change where to find the command
          command = 'sqlformat',
        },
        sql_formatter = {
          args = {
            '-l',
            'postgresql',
            '--config',
            vim.fn.json_encode(sql_formatter_config),
          },
        },
      },
    },
  },
}
