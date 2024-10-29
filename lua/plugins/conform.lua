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
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },

      python = { 'isort', 'black' },

      javascript = { 'prettier', stop_after_first = true },
      typescript = { 'prettier', stop_after_first = true },

      vue = { 'prettier', stop_after_first = true },
      php = { 'intelephense', stop_after_first = true },
    },
    formatters = {
      prettier = {
        command = 'prettier', -- no need for a specific path as it’s in global npm path
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
