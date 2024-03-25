return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
        })
	end,
    lazy=false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<Leader>ca",
			"<cmd>Lspsaga code_action<CR>",
			{ noremap = true, silent = true },
		},

		-- {
		-- 	"<Leader>rn",
		-- 	"<cmd>Lspsaga rename<CR>",
		-- 	{ noremap = true, silent = true },
		-- },
	},
}
