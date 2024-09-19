return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
	keys = {
		{ "<Leader>t", "<cmd>Telescope<cr>", desc = "Telescope" },
		-- {
		-- 	"<Leader>fd",
		-- 	function()
		-- 		require("telescope.builtin").lsp_definitions({ jump_type = "never" })
		-- 	end,
		-- 	desc = "Telescope go to definition",
		-- },
		-- {
		-- 	"<Leader>ft",
		-- 	function()
		-- 		require("telescope.builtin").lsp_type_definitions({ jump_type = "never" })
		-- 	end,
		-- 	desc = "Telescope go to type definition",
		-- },
		{
			"<Leader>fw",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find({ jump_type = "never", show_line = false })
			end,
			desc = "Telescope find in current buffer",
		},
		-- {
		-- 	"<Leader>fr",
		-- 	function()
		-- 		require("telescope.builtin").lsp_references({ jump_type = "never", show_line = false })
		-- 	end,
		-- 	desc = "Telescope go to references",
		-- },
		{
			"<Leader>fo",
			function()
				require("telescope.builtin").lsp_outgoing_calls({ jump_type = "never" })
			end,
			desc = "Telescope outgoing calls",
		},
		-- {
		-- 	"<Leader>fi",
		-- 	function()
		-- 		require("telescope.builtin").lsp_incoming_calls({ jump_type = "never" })
		-- 	end,
		-- 	" go to incoming calls",
		-- },
		-- {
		-- "<Leader>fi",
		-- function()
		-- 	require("telescope.builtin").lsp_implementations({ jump_type = "never" })
		-- end,
		-- desc = "go to implementations",
		-- },
		{ "<Leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope ripgrep" },
		{ "<Leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope files" },
		{ "<Leader>fO", 
            function() 
                require("telescope.builtin").oldfiles({ only_cwd = false })
            end, 
        desc = "Telescope global old files" },

		-- { "<Leader>fn", "<cmd>Telescope noice<CR>" },
		{ "<Leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Telescope help" },
		{
			"<Leader>fo",
			function()
				require("telescope.builtin").oldfiles({ only_cwd = true })
			end,
			desc = "Telescope old files",
		},

		{
			"<Leader>fp",
			function()
				require("telescope").extensions.projects.projects({})
			end,
			desc = "Telescope projects",
		},

		{ "<Leader>fb", "<cmd>Telescope buffers<cr>", "Telescope buffers" },
		{
			"<Leader>fs",
			function()
				require("telescope.builtin").lsp_document_symbols({ symbol_width = 50 })
			end,
			desc = "Telescope document symbols",
		},
		{
			"<Leader>fS",
			function()
				require("telescope.builtin").lsp_workspace_symbols({ symbol_width = 50 })
			end,
			desc = "Telescope workspace symbols",
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
                file_ignore_patterns = {"^extern/"}, -- ignore all files in extern directory
                paths_display = "filename_first",
                --wrap_results = true,
				--borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" }, -- monokai pro setup
				-- borderchars = { "", "", "", "", "", "", "", "" }, -- monokai pro setup
                border = true,
				sorting_strategy = "ascending",
				winblend = 0,
				prompt_prefix = "🔭 ",
				-- layout_strategy = "vertical",
				layout_strategy = "vertical",
				layout_config = {
                horizontal = {
                    preview_width = 0.6,
                    mirror = false,
                    prompt_position = "top",
                },
                  vertical = {
                    height = 0.9,
                    preview_cutoff = 30,
                    prompt_position = "bottom",
                    width = 0.5
                  }
				},
				mappings = {
					i = {
						["<esc>"] = require("telescope.actions").close,
						["<C-c>"] = require("telescope.actions").close,
						["<C-l>"] = require("telescope.actions").select_default,
						["<C-v>"] = require("telescope.actions").select_vertical,
						["<C-s>"] = require("telescope.actions").select_horizontal,
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
