return {
	"/jbyuki/nabla.nvim",
	lazy = false,
	keys = {
		{
			"<Leader>v",
			function()
				require("nabla").popup()
			end,
			"Nabla latex preview popup",
		},
	},
}
