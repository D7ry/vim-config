return {
	"ThePrimeagen/harpoon",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{
			"<leader>m",
			function()
				require("harpoon.mark").add_file()
			end,
			"Harpoon create mark",
		},
		{
			"<leader>M",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			"Harpoon open ui",
		},
		{
			")",
			function()
				require("harpoon.ui").nav_next()
			end,
			"next harpoon",
		},
		{
			"(",
			function()
				require("harpoon.ui").nav_prev()
			end,
			"previous harpoon",
		},
	},
	config = function()
		require("telescope").load_extension("harpoon")
	end, -- or `opts = {}`
    lazy = false,
}
