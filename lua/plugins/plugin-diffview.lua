local viewing_diff = false
local viewing_file_history = false
local viewing_commit_history = false

local function disable_bufferline()
	-- vim.o.showtabline = 0
end

local function enable_bufferline()
	-- vim.o.showtabline = 2
end

return {
	"D7ry/diffview.nvim",
	config = function()
		require("diffview").setup({
			delete_buffer_on_diff_exit = true
		})
	end,
	keys = {
		{
			"<Leader>gs", -- git status
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
				disable_bufferline()
			end,
			"Toggle diff view",
		},
		{
			"<Leader>gf", -- git log but on a current file
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
				disable_bufferline()
			end,
			"Toggle file history view for current file",
		},
		{
			"<Leader>gl", -- git log

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
				disable_bufferline()
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
				enable_bufferline()
			end,
			"quit diff view",
		},
	},
}
