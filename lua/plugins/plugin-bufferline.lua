return {
	"akinsho/bufferline.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				style_preset = require("bufferline").style_preset.minimal,
				diagnostics = "nvim_lsp",
                separator_style="slant",

				indicator = {
					icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "underline", --'icon' | 'underline' | 'none',
				},
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or ""
					return " " .. icon .. count
				end,

				show_buffer_close_icons = false,
				show_close_icon = false,

				offsets = {
					{
						filetype = "NvimTree",
						text = "Files",
						highlight = "Directory",
						text_align = "left",
					},
					{
						filetype = "Outline",
						text = "Symbols",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})
	end,
	keys = {
		{
			"<leader><leader>",
            function ()
                vim.cmd("BufferLinePick");
            end
		},
		{
			"<leader>-",
            function ()
                vim.cmd("BufferLineMovePrev");
            end
		},
		{
			"<leader>=",
            function ()
                vim.cmd("BufferLineMoveNext");
            end
		},
		{
			"<leader>[",
            function ()
                vim.cmd("BufferLineCyclePrev");
            end
		},
		{
			"<leader>]",
            function ()
                vim.cmd("BufferLineCycleNext");
            end
		},
	},
	lazy = false,
}
