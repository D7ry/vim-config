return {
	"nvim-telescope/telescope-file-browser.nvim",
    lazy = false,
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").load_extension("file_browser")
	end,
    keys = { 
        {"<leader>fb", "<cmd>Telescope file_browser<cr>", {noremap = true, silent = true}},
    }
}
