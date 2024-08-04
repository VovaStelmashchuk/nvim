return {
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup({})

      vim.keymap.set("n", "<space>rc", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { expr = true })

      vim.keymap.set("n", "<space>rn", ":IncRename ")
    end,
  }
}
