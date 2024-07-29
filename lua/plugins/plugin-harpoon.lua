return {
	"ThePrimeagen/harpoon",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{
			"<Leader>m",
			function()
				require("harpoon.mark").add_file()
			end,
			"Harpoon create mark",
		},
		{
			"<Leader>hu",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			"Harpoon open ui",
		},
		{
			"<Leader>n",
			function()
				require("harpoon.ui").nav_next()
			end,
			"next harpoon",
		},
		{
			"<Leader>p",
			function()
				require("harpoon.ui").nav_prev()
			end,
			"previous harpoon",
		},
	},
	config = function()
		require("telescope").load_extension("harpoon")
	end, -- or `opts = {}`
}
