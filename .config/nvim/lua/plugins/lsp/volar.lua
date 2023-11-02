return function()
  require('lspconfig').volar.setup({
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
    -- settings = {
    --   typescript = {
    --     preferences = {
    --       disableSuggestions = true,
    --     }
    --   }
    -- },
  })
end
