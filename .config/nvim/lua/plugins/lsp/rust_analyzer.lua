return function()
  local ok, mason_registry = pcall(require, 'mason-registry')
  local adapter

  if ok then
    local codelldb = mason_registry.get_package('codelldb')
    local extension_path = codelldb:get_install_path() .. '/extension/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
    adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
  end

  require('rust-tools').setup({
    tools = {
      hover_actions = {
        auto_focus = true,
      },
      on_initialized = function()
        local group = vim.api.nvim_create_augroup('RustLSP', { clear = false })
        local pattern = '*.rs'

        vim.api.nvim_create_autocmd('CursorHold', {
          callback = vim.lsp.buf.document_highlight,
          group = group,
          pattern = pattern,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'InsertEnter' }, {
          callback = vim.lsp.buf.clear_references,
          group = group,
          pattern = pattern,
        })
        vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
          callback = vim.lsp.codelens.refresh,
          group = group,
          pattern = pattern,
        })
      end,
    },
    server = {
      on_attach = function(_, bufnr)
        local rust_tools = require('rust-tools')
        vim.keymap.set(
          'n',
          '<leader>k',
          rust_tools.hover_actions.hover_actions,
          { buffer = bufnr, desc = 'Hover Action' }
        )
        vim.keymap.set(
          'n',
          '<leader>ca',
          rust_tools.code_action_group.code_action_group,
          { buffer = bufnr, desc = 'Code actions' }
        )
      end,
      standalone = false,
      settings = {
        ['rust-analyzer'] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            runBuildScripts = true,
          },
          checkOnSave = {
            allFeatures = true,
            command = 'clippy',
            extraArgs = { '--no-deps' },
          },
          -- procMacro = {
          --   enable = true,
          --   ignored = {
          --     ['async-trait'] = { 'async_trait' },
          --     ['napi-derive'] = { 'napi' },
          --     ['async-recursion'] = { 'async_recursion' },
          --   },
          -- },
        },
      },
    },
    dap = {
      adapter = adapter,
    },
  })
end
