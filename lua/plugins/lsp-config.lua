return {
  {
    "ms-jpq/coq_nvim",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local coq = require("coq")
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({}))
      lspconfig.gopls.setup(coq.lsp_ensure_capabilities({}))

      vim.keymap.set('n', '<space>cf', vim.lsp.buf.format, {})
    end
  }
}
