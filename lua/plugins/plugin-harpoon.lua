return {
	"ThePrimeagen/harpoon",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{
			"<Leader>m",
			function()
				require("harpoon.mark").add_file()
			end,
			"mark file to harpoon",
		},
		{
			"<Leader>hu",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			"open harpoon",
		},
		{
			"<Leader>n",
			function()
				require("harpoon.ui").nav_next()
			end,
			"open harpoon",
		},
		{
			"<Leader>p",
			function()
				require("harpoon.ui").nav_prev()
			end,
			"open harpoon",
		},
	},
	config = function() end, -- or `opts = {}`
}
