return {
  {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true,
        },
        incremental_selection = {
         enable = true,
          keymaps = {
            init_selection = "vb",
          },
        },
        indent = {
          enable = true
        },
      }
    end
  }
}
