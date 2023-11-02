return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  event = 'VeryLazy',
  opts = function()
    local null_ls = require('null-ls')
    return {
      sources = {
        -- null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylelint,
        null_ls.builtins.diagnostics.phpcs.with({
          extra_args = {
            "--standard='phpcs.xml'",
          },
        }),
        null_ls.builtins.formatting.phpcbf.with({
          extra_args = {
            "--standard='phpcs.xml'",
          },
        }),
        null_ls.builtins.formatting.shfmt,
      },
    }
  end,
}
