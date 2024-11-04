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
    notify_on_error = true,
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
    },
    formatters_by_ft = {
      lua = { 'stylua' },

      python = { 'isort', 'black' },
      javascript = { 'biome', 'prettier', stop_after_first = true },
      typescript = { 'biome', 'prettier', stop_after_first = true },

      vue = { 'biome', 'prettier' },
      php = { 'intelephense', stop_after_first = true },
    },
    formatters = {
      biome = {
        meta = {
          url = 'https://github.com/biomejs/biome',
          description = 'A toolchain for web projects, aimed to provide functionalities to maintain them.',
        },
        command = 'biome',
        stdin = true,
        args = { 'format', '--stdin-file-path', '$FILENAME' },
      },
      intelephense = {
        command = 'intelephense',
        args = {},
      },
    },
  },
}
