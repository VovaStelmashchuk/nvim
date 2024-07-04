return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")

      local vue_language_server_path = "/opt/homebrew/lib/node_modules/@vue/language-server"

      lspconfig.tsserver.setup({
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = vue_language_server_path,
              languages = { 'vue' },
            },
          },
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        capabilities = capabilities,
      })

      lspconfig.volar.setup({
        capabilities = capabilities,
        filetypes = { 'vue' },
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
      })

      vim.keymap.set('n', '<space>cf', vim.lsp.buf.format, {})
      vim.keymap.set('n', '<space>cd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<space>jd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<space>cu', vim.lsp.buf.references, {})
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { silent = true })
    end
  }
}
