return {
  {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "vb",
            node_incremental = "si",
            node_decremental = "sd"
          },
        },
        indent = {
          enable = true
        },
      }
    end
  }
}
