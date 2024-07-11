return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        color_overrides = {
          mocha = {
            base = "#000001",
            mantle = "#000001",
            crust = "#000001",
          },
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
