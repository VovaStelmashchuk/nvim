return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
	config = function()
    	    require("catppuccin").setup()
    	    vim.cmd.colorscheme "catppuccin"
  	end,
    },
  {
	{
	"nvim-telescope/telescope-file-browser.nvim",
   	 dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    
	    config = function()
    	      require("telescope").setup()
  	  end,
	}
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
}
