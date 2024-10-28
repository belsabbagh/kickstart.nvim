return {
  'maxmx03/dracula.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local dracula = require 'dracula'

    dracula.setup {
      styles = {
        types = {},
        functions = {},
        parameters = {},
        comments = {},
        strings = {},
        keywords = {},
        variables = {},
        constants = {},
      },
      transparent = false,
      on_colors = function(colors, color)
        return {
          mycolor = '#ffffff',
        }
      end,
      on_highlights = function(colors, color)
        return {
          Normal = { fg = colors.mycolor },
        }
      end,
      plugins = {
        ['nvim-treesitter'] = true,
        ['rainbow-delimiters'] = true,
        ['nvim-lspconfig'] = true,
        ['nvim-navic'] = true,
        ['nvim-cmp'] = true,
        ['indent-blankline.nvim'] = true,
        ['neo-tree.nvim'] = true,
        ['nvim-tree.lua'] = true,
        ['which-key.nvim'] = true,
        ['dashboard-nvim'] = true,
        ['gitsigns.nvim'] = true,
        ['oil.nvim'] = true,
        ['neogit'] = true,
        ['todo-comments.nvim'] = true,
        ['lazy.nvim'] = true,
        ['telescope.nvim'] = true,
        ['noice.nvim'] = true,
        ['hop.nvim'] = true,
        ['mini.statusline'] = true,
        ['mini.tabline'] = true,
        ['mini.starter'] = true,
        ['mini.diff'] = true,
        ['mini.cursorword'] = true,
        ['bufferline.nvim'] = true,
      },
    }
    vim.cmd.colorscheme 'dracula'
  end,
}
