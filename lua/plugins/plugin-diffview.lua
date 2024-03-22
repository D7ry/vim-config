local viewing_diff = false
local viewing_file_history = false
return {
	"sindrets/diffview.nvim",
	keys = {
		{
			"<Leader>gd",
			function()
				if viewing_diff then
					vim.cmd("tabclose")
					viewing_diff = false
				else
					vim.cmd("DiffviewOpen")
					viewing_diff = true
				end
			end,
			"Toggle diff view",
		},
		{
			"<Leader>gf",
			function()
				if viewing_file_history then
					vim.cmd("tabclose")
					viewing_file_history = false
				else
					vim.cmd("DiffviewFileHistory %")
					viewing_file_history = true
				end
			end,
			"Toggle file history view for current file",
		},
		{
			"<Leader>gF",
			function()
				if viewing_file_history then
					vim.cmd("tabclose")
					viewing_file_history = false
				else
					vim.cmd("DiffviewFileHistory")
					viewing_file_history = true
				end
			end,
			"Toggle file history view for all files",
		},
        {}
	},
}
