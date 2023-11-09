return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  config = function()
    local ls = require('luasnip')
    ls.setup({
      snip_env = {
        s = ls.snippet,
        i = ls.insert_node,
        t = ls.text_node,
        c = ls.choice_node,
        sn = ls.snippet_node,
        d = ls.dynamic_node,
        fmt = require("luasnip.extras.fmt").fmt
      },
    })

    require('luasnip.loaders.from_lua').lazy_load()

    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end)
    vim.keymap.set({ "i", "s" }, "<C-h>", function()
      if ls.choice_active() then
        ls.change_choice(-1)
      end
    end)
  end,
}
