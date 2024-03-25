CURRENT_SCHEME = "kanagawa-wave"
colorschemes = {
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("config.monokai-pro-setup")
		end,
	},
	{ "rebelot/kanagawa.nvim", lazy = false },
	{ "sainnhe/edge", lazy = false },
	{ "sainnhe/sonokai", lazy = false },
	{ "marko-cerovac/material.nvim", lazy = true },
	{ "navarasu/onedark.nvim", lazy = true },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("config.tokyonight-setup")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
		end,
	},
	{ "mhartington/oceanic-next", lazy = false },
	{ "tanvirtin/monokai.nvim", lazy = true },
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	{ "projekt0n/github-nvim-theme", lazy = false },
	{ "catppuccin/nvim", lazy = false, priority = 1000 },
	{ "shaunsingh/nord.nvim", lazy = false },
	{ "luisiacc/gruvbox-baby" },
}

return {colorschemes = colorschemes, current_scheme = CURRENT_SCHEME }
