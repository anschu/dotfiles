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
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
      }),
      formatting = lsp_zero.cmp_format(),
      sources = cmp.config.sources({
        { name = 'creates' },
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'copilot' },
      }, {
        { name = 'buffer' },
      }),
      experimental = {
        ghost_text = false,
      },
    }
  end,
}
