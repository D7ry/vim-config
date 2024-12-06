return {

	"dnlhc/glance.nvim",
	config = function()
		local glance = require("glance")
		local actions = glance.actions

		glance.setup({
			height = 25, -- Height of the window
			zindex = 90,

			-- By default glance will open preview "embedded" within your active window
			-- when `detached` is enabled, glance will render above all existing windows
			-- and won't be restiricted by the width of your active window
			-- detached = true,

			-- Or use a function to enable `detached` only when the active window is too small
			-- (default behavior)
			detached = function(winid)
				return vim.api.nvim_win_get_width(winid) < 100
			end,

			preview_win_opts = { -- Configure preview window options
				cursorline = true,
				number = true,
				wrap = true,
			},
			border = {
				enable = true, -- Show window borders. Only horizontal borders allowed
				top_char = "─",
				bottom_char = "─",
			},
			list = {
				position = "right", -- Position of the list window 'left'|'right'
				width = 0.33, -- 33% width relative to the active window, min 0.1, max 0.5
			},
			theme = { -- This feature might not work properly in nvim-0.7.2
				enable = true, -- Will generate colors for the plugin based on your current colorscheme
				mode = "auto", -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
			},
			mappings = {
				list = {
					["j"] = actions.next, -- Bring the cursor to the next item in the list
					["k"] = actions.previous, -- Bring the cursor to the previous item in the list
					["<Down>"] = actions.next,
					["<Up>"] = actions.previous,
					["<Tab>"] = actions.next_location, -- Bring the cursor to the next location skipping groups in the list
					["<S-Tab>"] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
					["<C-n>"] = actions.next_location, -- Bring the cursor to the next location skipping groups in the list
					["<C-p>"] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
					["<C-u>"] = actions.preview_scroll_win(5),
					["<C-d>"] = actions.preview_scroll_win(-5),
					["<C-v>"] = actions.jump_vsplit,
					["<C-s>"] = actions.jump_split,
					-- ["t"] = actions.jump_tab,
					["<CR>"] = actions.jump,
					-- ["o"] = actions.jump,
					["l"] = actions.open_fold,
					["h"] = actions.close_fold,
					["<leader>h"] = actions.enter_win("preview"), -- Focus preview window
					["<leader>l"] = actions.enter_win("preview"), -- Focus preview window
					["<leader>j"] = actions.enter_win("preview"), -- Focus preview window
					["<leader>k"] = actions.enter_win("preview"), -- Focus preview window
					["q"] = actions.close,
					["Q"] = actions.close,
					["<Esc>"] = actions.close,
					["<C-q>"] = actions.quickfix,
					-- ['<Esc>'] = false -- disable a mapping
				},
				preview = {
					["q"] = actions.close,
					["Q"] = actions.close,
					["<Tab>"] = actions.next_location,
					["<S-Tab>"] = actions.previous_location,
					["<leader>l"] = actions.enter_win("list"), -- Focus list window
					["<leader>h"] = actions.enter_win("list"), -- Focus list window
					["<leader>j"] = actions.enter_win("list"), -- Focus list window
					["<leader>k"] = actions.enter_win("list"), -- Focus list window
					["<Esc>"] = actions.close,
				},
			},
			hooks = {},
			folds = {
				fold_closed = "",
				fold_open = "",
				folded = true, -- Automatically fold list on startup
			},
			indent_lines = {
				enable = true,
				icon = "│",
			},
			winbar = {
				enable = true, -- Available strating from nvim-0.8+
			},
		})
	end,
    keys = {
		{
			"<Leader>fr",
            "<CMD>Glance references<CR>",
			desc = "Glance references",
        },
		{
			"<Leader>fd",
            "<CMD>Glance definitions<CR>",
			desc = "Glance definitions",
		},
		{
			"<Leader>ft",
            "<CMD>Glance type_definitions<CR>",
			desc ="Glance type definitions",
		},
		{
			"<Leader>fi",
            "<CMD>Glance implementations<CR>",
			desc ="Glance implementations",
		},
    }
}
