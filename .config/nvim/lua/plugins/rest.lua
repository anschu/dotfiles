return {
  "rest-nvim/rest.nvim",
  ft = 'http',
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    local group = vim.api.nvim_create_augroup('NvimRest', { clear = true })

    vim.api.nvim_create_autocmd({ 'FileType' }, {
      callback = function() vim.keymap.set('n', 'q', '<CMD>q<CR>', { buffer = true }) end,
      group = group,
      pattern = 'httpResult',
    })

    vim.api.nvim_create_autocmd({ 'FileType' }, {
      callback = function()
        vim.keymap.set('n', '<CR>', require("rest-nvim").run,
          { desc = 'Run Request', buffer = true })
      end,
      group = group,
      pattern = 'http',
    })
  end
}
