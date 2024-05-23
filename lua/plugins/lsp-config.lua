return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
      })

      lspconfig.gopls.setup({
        settings = {
          gopls = {
            completeUnimported = true,
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })

      vim.keymap.set('n', '<space>cf', vim.lsp.buf.format, {})
      vim.keymap.set('n', '<space>cd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<space>cu', vim.lsp.buf.references, {})
      --  add auto import action
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { silent = true })
    end
  }
}
