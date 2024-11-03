return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },

      python = { 'isort', 'black' },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'prettier', stop_after_first = true },

      vue = { 'prettier', 'prettierd', stop_after_first = true },
      php = { 'intelephense', stop_after_first = true },
    },
    formatters = {
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', vim.fn.shellescape(vim.api.nvim_buf_get_name(0)) },
        stdin = true,
      },
      intelephense = {
        command = 'intelephense',
        args = {},
      },
    },
  },
}
