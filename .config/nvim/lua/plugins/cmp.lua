return {
  'hrsh7th/nvim-cmp',
  version = false,
  event = 'InsertEnter',
  dependencies = {
    'VonHeikemen/lsp-zero.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    {
      'zbirenbaum/copilot-cmp',
      dependencies = {
        'zbirenbaum/copilot.lua',
        opts = { suggestion = { enabled = false }, panel = { enabled = false } },
      },
      opts = {},
    },
    {
      'Saecki/crates.nvim',
      event = { 'BufRead Cargo.toml' },
      opts = {
        src = {
          cmp = { enabled = true },
        },
      },
    },
  },
  opts = function()
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_cmp()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local cmp_action = lsp_zero.cmp_action()
    local cmp_format = require('lsp-zero').cmp_format()

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' },
          },
        },
      }),
    })

    return {
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
      }),
      formatting = cmp_format,
      sources = cmp.config.sources({
        { name = 'luasnip' },
      }, {
        { name = 'nvim_lsp' },
        { name = 'creates' },
        { name = 'vim-dadbod-completion' },
      }, {
        { name = 'copilot' },
        { name = 'path' },
        { name = 'buffer' },
      }),
      experimental = {
        ghost_text = false,
      },
    }
  end,
}
