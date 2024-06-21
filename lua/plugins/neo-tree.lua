return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true,          -- This makes hidden files visible
            hide_dotfiles = false,   -- This ensures dotfiles are not hidden
            hide_gitignored = false, -- This ensures gitignored files are not hidden
            never_show = {           -- This ensures specific files are never hidden
              ".DS_Store",
              "thumbs.db"
            },
            hide_by_name = { -- Ensure .env file is not hidden
              -- Remove any specific files you want to hide
            }
          }
        },
        use_default_mappings = false,
        window = {
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["o"] = "open",
            ["<cr>"] = "open",
            ["a"] = {
              "add",
              config = {
                show_path = "relative"
              }
            },
            ["d"] = "delete",
            ["r"] = "rename",
          }
        },
      })

      vim.keymap.set("n", "<space>e", ":Neotree left<CR>")
    end,
  },
}
