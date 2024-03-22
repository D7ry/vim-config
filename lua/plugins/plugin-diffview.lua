local viewing_diff = false
local viewing_file_history = false
local viewing_commit_history = false
return {
	"sindrets/diffview.nvim",
	keys = {

		{
			"<Leader>gd",
			function()
				if viewing_file_history then
					vim.cmd("tabclose")
					viewing_file_history = false
				end
				if viewing_commit_history then
					vim.cmd("tabclose")
					viewing_commit_history = false
				end
				if not viewing_diff then
					vim.cmd("DiffviewOpen")
					viewing_diff = true
				end
			end,
			"Toggle diff view",
		},
		{
			"<Leader>gf",
			function()
				if viewing_diff then
					vim.cmd("tabclose")
					viewing_diff = false
				end
				if viewing_commit_history then
					vim.cmd("tabclose")
					viewing_commit_history = false
				end
				if not viewing_file_history then
					vim.cmd("DiffviewFileHistory %")
					viewing_file_history = true
				end
			end,
			"Toggle file history view for current file",
		},
		{
			"<Leader>gc",

			function()
				if viewing_diff then
					vim.cmd("tabclose")
					viewing_diff = false
				end
				if viewing_file_history then
					vim.cmd("tabclose")
					viewing_file_history = false
				end
				if not viewing_commit_history then
					vim.cmd("DiffviewFileHistory")
					viewing_commit_history = true
				end
			end,
			"Toggle commit history view for all files",
		},
		{
			"q",
			function()
				-- local fallback = not viewing_diff and not viewing_file_history
				-- if fallback then
				--     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("q", true, true, true), '')
				-- end
				if viewing_diff then
					vim.cmd("tabclose")
					viewing_diff = false
				end
				if viewing_file_history then
					vim.cmd("tabclose")
					viewing_file_history = false
				end
				if viewing_commit_history then
					vim.cmd("tabclose")
					viewing_commit_history = false
				end
			end,
			"quit diff view",
		},
	},
}
