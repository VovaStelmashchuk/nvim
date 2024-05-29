return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
      })

			-- Setup java script language server
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

      vim.keymap.set('n', '<space>cf', vim.lsp.buf.format, {})
      vim.keymap.set('n', '<space>cd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<space>cu', vim.lsp.buf.references, {})
      --  add auto import action
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { silent = true })
    end
  }
}
