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
           use_default_mappings = false;
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
           }
       )
       end,
      },
}
