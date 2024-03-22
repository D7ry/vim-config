local viewing_diff = false
return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 50,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			yadm = {
				enable = false,
			},
		})
	end,

	keys = {
		{ "<Leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle current line blame" },
		{ "g]", "<cmd>Gitsigns next_hunk<cr>", "Next git hunk" },
		{ "g[", "<cmd>Gitsigns prev_hunk<cr>", "Prev git hunk" },

		{ "<Leader>gp", "<cmd>Gitsigns preview_hunk_inline<cr>", "Preview git hunk in line" },
		-- {
		-- 	"<leader>gd",
		-- 	function()
  --               if viewing_diff then
  --                   vim.cmd("wincmd p | q")
  --                   viewing_diff = false
  --               else
  --                   vim.cmd(":Gitsigns diffthis")
  --                   viewing_diff = true
  --               end
		-- 	end,
  --           "Toggle git diff view"
		-- },
	},
}
