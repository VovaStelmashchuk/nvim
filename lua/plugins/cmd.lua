return {
  {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require('fine-cmdline').setup({
        cmdline = {
          enabled = true,
          prompt = ' : ',
        },
        popup = {
          position = {
            row = "20%",
            col = "50%",
          },
          size = {
            width = "40%",
          },
          border = {
            style = "rounded",
            text = {
              top = ' Command ',
            },
          },
        },
      })
    end,
  },
}
