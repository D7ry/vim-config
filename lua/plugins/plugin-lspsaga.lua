return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
          finder = {
            max_height = 0.6,
            keys = {
              vsplit = 'C-v',
              toggle_or_open = "<CR>",
              quit = "<Esc>",

            },
          },
        code_action = {
            keys = {
              quit = "<Esc>",
            }
        },
        definition = {

            keys = {
              vsplit = 'C-v',
              edit = "<CR>",
              quit = "<Esc>",
            }
        }
        })
	end,
    lazy=false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		-- {
		-- 	"<Leader>ca",
		-- 	"<cmd>Lspsaga code_action<CR>",
		-- 	{ noremap = true, silent = true },
		-- },
		-- {
		-- 	"<Leader>r",
		-- 	"<cmd>Lspsaga finder<CR>",
		-- 	{ noremap = true, silent = true },
		-- },
		-- {
		-- 	"<Leader>t",
		-- 	"<cmd>Lspsaga peek_type_definition<CR>",
		-- 	{ noremap = true, silent = true },
		-- },
		-- {
		-- 	"<Leader>rn",
		-- 	"<cmd>Lspsaga rename<CR>",
		-- 	{ noremap = true, silent = true },
		-- },
	},
}
