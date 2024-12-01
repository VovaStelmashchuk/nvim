return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      local cmp = require('cmp')

      cmp.setup({
        formatting = lsp_zero.cmp_format({ details = true }),
        mapping = cmp.mapping.preset.insert({
          ['<C-t>'] = cmp.mapping.scroll_docs(-4),
          ['<C-h>'] = cmp.mapping.scroll_docs(4),
          ['<C-y>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end
  },
  -- LSP and Mason integration
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason-lspconfig.nvim', -- Mason integration with nvim-lspconfig
      'neovim/nvim-lspconfig',             -- LSP support
      'hrsh7th/cmp-nvim-lsp',              -- Autocompletion
    },
    config = function()
      -- Setup mason.nvim
      require('mason').setup()

      -- Ensure LSP servers are installed automatically via mason-lspconfig
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'ts_ls', 'jsonls', 'html', 'cssls', 'tailwindcss' },
        automatic_installation = true,
      })

      -- LSP Configuration
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      -- Default on_attach handler
      lsp_zero.on_attach(function(client, bufnr)
        -- Keybindings for LSP functions
        lsp_zero.default_keymaps({ buffer = bufnr })
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
          { noremap = true, silent = true })
      end)

      -- Setup individual language servers
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        }
      })

      require('lspconfig').ts_ls.setup({})
      require('lspconfig').jsonls.setup({})

      -- Capabilities for snippet support in LSP
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- HTML LSP
      require('lspconfig').html.setup({
        capabilities = capabilities,
        cmd = { 'vscode-html-language-server', '--stdio' },
        filetypes = { 'html' },
        init_options = {
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = { css = true, javascript = true },
          provideFormatter = true
        },
        root_dir = function()
          return vim.loop.cwd()
        end,
        settings = {},
        single_file_support = true
      })

      -- CSS LSP
      require('lspconfig').cssls.setup({
        capabilities = capabilities,
      })
    end
  },
}
