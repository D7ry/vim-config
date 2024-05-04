return {
	"rcarriga/nvim-notify",
	config = function()
		vim.opt.termguicolors = true
		vim.notify = require("notify")
		require("notify").setup({
			-- background_colour = "NotifyBackground",
			background_colour = "#000000", -- blank
			fps = 60,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2,
			minimum_width = 50,
			render = "wrapped-compact",
			stages = "fade_in_slide_out",
			timeout = 5000,
			top_down = false,
		})
	end,
	lazy = false,
}
