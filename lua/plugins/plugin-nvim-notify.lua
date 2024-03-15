return {
	"rcarriga/nvim-notify",
	config = function()
		vim.opt.termguicolors = true
		vim.notify = require("notify")
		require("notify").setup(require("config.nvim-notify-config"))
	end,
	lazy = false,
}
