return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require 'lint'

    -- Set up linters by filetype
    lint.linters_by_ft = {
      vue = { 'eslint' }, -- Lint Vue files using ESLint
      javascript = { 'eslint' },
      typescript = { 'eslint' },
      javascriptreact = { 'eslint' },
      typescriptreact = { 'eslint' },
      -- Add more filetypes as needed
    }

    -- Run linting on save for specified file types
    --   vim.api.nvim_create_autocmd({ 'TextChanged' }, {
    --     pattern = { '*.vue', '*.js', '*.ts', '*.jsx', '*.tsx' },
    --     callback = function()
    --       local filepath = vim.fn.expand '%:p'
    --       if vim.fn.filereadable(filepath) == 1 then
    --         lint.try_lint()
    --       else
    --         print('File not found: ' .. filepath)
    --       end
    --     end,
    --   })
  end,
}
