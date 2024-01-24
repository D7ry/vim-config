return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
	keys = {
		{ "<Leader>t", "<cmd>Telescope<cr>", "open telescope" },
		{ "ft", "<cmd>Telescope lsp_definitions<cr>", "go to definition" },
		{ "fr", "<cmd>Telescope lsp_references<cr>", "go to references" },
		{ "fi", "<cmd>Telescope lsp_implementations<cr>", "go to implementations" },
		{ "fg", "<cmd>Telescope live_grep<cr>", "global search" },
		{ "ff", "<cmd>Telescope find_files<CR>" },
		{ "fs", "<cmd>Telescope lsp_document_symbols<cr>", "telescope tree sitter" },
	},
	config = function()
        local ts = require("telescope")
		ts.setup({
			defaults = {
				winblend = 10,
				prompt_prefix = "🔭 ",
				layout_strategy = "flex",
				layout_config = {
					height = 0.8,
					width = 0.75,
					horizontal = {
						preview_width = 0.6,
						mirror = false,
						prompt_position = "top",
					},
					vertical = {
						mirror = false,
					},
				},
				mappings = {
					i = {
						["<esc>"] = require("telescope.actions").close,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				aerial = {
					-- Display symbols as <root>.<parent>.<symbol>
					show_nesting = {
						["_"] = true,
						json = true, -- You can set the option for specific filetypes
						yaml = true,
					},
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
		})
		ts.load_extension("fzf")
		ts.load_extension("notify")
	end,
}
