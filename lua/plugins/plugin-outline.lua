return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{
			"<leader>a",
			function()
				require("outline").toggle({ focus_outline = true, location = "left" })
			end,
			desc = "Toggle outline",
		},
		{
			"<C-k>a",
			function()
				require("outline").toggle({ focus_outline = false, location = "left" })
			end,
			desc = "Toggle outline",
		},
		--
	},
	opts = {

		outline_window = {
			position = "left",
			split_command = nil,
			width = 20,
			relative_width = true,
			wrap = false,
			focus_on_open = true,
			auto_close = false,
			auto_jump = false,
			show_numbers = false,
			show_relative_numbers = false,
			---@type boolean|string?
			show_cursorline = true,
			hide_cursor = false,
			winhl = "",
			jump_highlight_duration = 400,
			center_on_jump = true,
		},

		keymaps = {
			show_help = "?",
			--close = { "<Esc>", "q" },
			goto_location = "<Cr>",
			peek_location = "<tab>",
			goto_and_close = "<S-Cr>",
			restore_location = "<C-g>",
			hover_symbol = "<C-space>",
			toggle_preview = "K",
			rename_symbol = "r",
			code_actions = "a",
			fold = "h",
			fold_toggle = "l",
			fold_toggle_all = "L",
			--unfold = "l",
			fold_all = "W",
			unfold_all = "E",
			fold_reset = "R",
			-- down_and_jump = "<C-j>",
			-- up_and_jump = "<C-k>",
		},
		-- Your setup opts here
	},
}
