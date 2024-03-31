return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
	keys = {
		{ "<Leader>t", "<cmd>Telescope<cr>", "open telescope" },
		-- {
		-- 	"<Leader>fd",
		-- 	function()
		-- 		require("telescope.builtin").lsp_definitions({ jump_type = "never" })
		-- 	end,
		-- 	"go to definition",
		-- },
		-- {
		-- 	"<Leader>ft",
		-- 	function()
		-- 		require("telescope.builtin").lsp_type_definitions({ jump_type = "never" })
		-- 	end,
		-- 	"go to type definition",
		-- },
		{
			"<Leader>fw",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find({ jump_type = "never", show_line = false })
			end,
			"fuzzy find in buffer",
		},
		-- {
		-- 	"<Leader>fr",
		-- 	function()
		-- 		require("telescope.builtin").lsp_references({ jump_type = "never", show_line = false })
		-- 	end,
		-- 	"go to references",
		-- },
		{
			"<Leader>fo",
			function()
				require("telescope.builtin").lsp_outgoing_calls({ jump_type = "never" })
			end,
			" go to outgoing calls",
		},
		-- {
		-- 	"<Leader>fi",
		-- 	function()
		-- 		require("telescope.builtin").lsp_incoming_calls({ jump_type = "never" })
		-- 	end,
		-- 	" go to incoming calls",
		-- },
		--{
		--	"<Leader>fi",
		--	function()
		--		require("telescope.builtin").lsp_implementations({ jump_type = "never" })
		--	end,
		--	"go to implementations",
		--},
		{ "<Leader>fg", "<cmd>Telescope live_grep<cr>", "global search" },
		{ "<Leader>ff", "<cmd>Telescope find_files<CR>" },
		{ "<Leader>fn", "<cmd>Telescope noice<CR>" },
		{ "<Leader>fh", "<cmd>Telescope help_tags<CR>" },
		{
			"<Leader>fo",
			function()
				require("telescope.builtin").oldfiles({ only_cwd = true })
			end,
			"open old files",
		},

		{
			"<Leader>fp",
			function()
				require("telescope").extensions.projects.projects({})
			end,
			"browse projects",
		},

		{ "<Leader>fb", "<cmd>Telescope buffers<cr>", "Telescope buffers" },
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
		-- {
		-- 	"<Leader>fh",
		-- 	"<cmd>Telescope harpoon marks<cr>",
		-- 	"telescope harpoon marks",
		-- },
	},
	config = function()
		local ts = require("telescope")
		--local fb_actions = ts.extensions.file_browser.actions
		ts.setup({
			defaults = {
				borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
				sorting_strategy = "ascending",
				winblend = 0,
				prompt_prefix = "🔭 ",
				layout_strategy = "flex",
				layout_config = {
					height = 0.8,
					width = 0.8,
					horizontal = {
						preview_width = 0.7,
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
						["<C-c>"] = require("telescope.actions").close,
						["<C-l>"] = require("telescope.actions").select_default,
					},
					n = {
						["l"] = require("telescope.actions").select_default,
						["<C-c>"] = require("telescope.actions").close,
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
				file_browser = {
					hijack_netrw = true,
					mappings = {
						["n"] = {
							--["a"] = fb_actions.create,
							--["."] = fb_actions.change_cwd,
							--["H"] = fb_actions.toggle_hidden,
							--["h"] = fb_actions.goto_parent_dir,
						},
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
		--ts.load_extension("notify")
	end,
}
