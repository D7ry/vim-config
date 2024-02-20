return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
	keys = {
		{ "<Leader>t", "<cmd>Telescope<cr>", "open telescope" },
		{
			"<Leader>fd",
			function()
				require("telescope.builtin").lsp_definitions({ jump_type = "never" })
			end,
			"go to definition",
		},
		{
			"<Leader>ft",
			function()
				require("telescope.builtin").lsp_type_definitions({ jump_type = "never" })
			end,
			"go to type definition",
		},
		{
			"<Leader>fr",
			function()
				require("telescope.builtin").lsp_references({ jump_type = "never", show_line = false })
			end,
			"go to references",
		},
		{
			"<Leader>fc",
			function()
				require("telescope.builtin").lsp_outgoing_calls({ jump_type = "never" })
			end,
			" go to outgoing calls",
		},
		{
			"<Leader>fC",
			function()
				require("telescope.builtin").lsp_incoming_calls({ jump_type = "never" })
			end,
			" go to incoming calls",
		},
		{
			"<Leader>fi",
			function()
				require("telescope.builtin").lsp_implementations({ jump_type = "never" })
			end,
			"go to implementations",
		},
		{ "<Leader>fg", "<cmd>Telescope live_grep<cr>", "global search" },
		{ "<Leader>ff", "<cmd>Telescope find_files<CR>" },
		{
			"<Leader>fs",
			function()
				require("telescope.builtin").lsp_document_symbols({ symbol_width = 50 })
			end,
			"telescope tree sitter",
		},
		{
			"<Leader>fS",
			function()
				require("telescope.builtin").lsp_workspace_symbols({ symbol_width = 50 })
			end,
			"telescope tree sitter",
		},
		{
			"<Leader>fh",
			"<cmd>Telescope harpoon marks<cr>",
            "telescope harpoon marks"
		},
	},
	config = function()
		local ts = require("telescope")
		ts.setup({
			defaults = {
				sorting_strategy = "ascending",
				winblend = 0,
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
				--				fzf = {
				--					fuzzy = true,
				--					override_generic_sorter = true,
				--					override_file_sorter = true,
				--					case_mode = "smart_case",
				--				},
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
		--		ts.load_extension("fzf")
		ts.load_extension("notify")
	end,
}
