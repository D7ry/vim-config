return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp", lazy = false },
		{ "hrsh7th/cmp-buffer", lazy = false },
		{ "hrsh7th/cmp-path", lazy = false },
		{ "hrsh7th/cmp-cmdline", lazy = false },
		{ "hrsh7th/cmp-vsnip" },
		{ "hrsh7th/vim-vsnip" },
		{ "onsails/lspkind.nvim", lazy = false }, --{'hrsh7th/cmp-nvim-lsp-signature-help'}
	},
	lazy = false,
	config = function()
		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		--local luasnip = require("luasnip")
		local cmp = require("cmp")

		-- unmap vanilla cmp keys
		vim.api.nvim_set_keymap("i", "<C-n>", "<Nop>", { noremap = true })
		vim.api.nvim_set_keymap("i", "<C-p>", "<Nop>", { noremap = true })
		-- vim.api.nvim_set_keymap("i", "<C-x><C-o>", "<Nop>", { noremap = true })

		local lspkind = require("lspkind")
		cmp.setup({
			mapping = {
				["<Enter>"] = cmp.mapping.confirm({ select = true }),
			},
			snippet = {
				expand = function(args)
					    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			--
			window = {
    --             completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				-- Use <C-b/f> to scroll the docs
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				-- Use <C-k/j> to switch in items
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-q>"] = function(fallback)
					if
						not cmp.visible()
						or not cmp.get_selected_entry()
					then
						fallback()
					else
						cmp.abort()
					end
				end,

				["<Enter>"] = function(fallback)
					-- Don't block <CR> if signature help is active
					-- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/issues/13
					if
						not cmp.visible()
						or not cmp.get_selected_entry()
						or cmp.get_selected_entry().source.name == "nvim_lsp_signature_help"
					then
						fallback()
					else
						cmp.confirm({
							-- Replace word if completing in the middle of a word
							-- https://github.com/hrsh7th/nvim-cmp/issues/664
							behavior = cmp.ConfirmBehavior.Replace,
							-- Don't select first item on CR if nothing was selected
							select = false,
						})
					end
				end,

				-- ["<C-g>"] = cmp.mapping(function(fallback)
				-- 	vim.api.nvim_feedkeys(
				-- 		vim.fn["copilot#Accept"](vim.api.nvim_replace_termcodes("<Tab>", true, true, true)),
				-- 		"n",
				-- 		true
				-- 	)
				-- end),
				-- Use <CR>(Enter) to confirm selection
				-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

				-- ['<CR>'] = cmp.mapping.confirm({
				--     behavior = cmp.ConfirmBehavior.Insert,
				--     select = true,
				-- }),

				-- A super tab
				-- sourc: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
				["<Tab>"] = cmp.mapping(function(fallback)
				    -- Hint: if the completion menu is visible select next one
				    if cmp.visible() then
				        cmp.select_next_item()
				    elseif has_words_before() then
				        cmp.complete()
				    else
				        fallback()
				    end
				end, { "i", "s" }), -- i - insert mode; s - select mode
				["<S-Tab>"] = cmp.mapping(function(fallback)
				    if cmp.visible() then
				        cmp.select_prev_item()
				    elseif luasnip.jumpable( -1) then
				        luasnip.jump( -1)
				    else
				        fallback()
				    end
				end, { "i", "s" }),
			}),
			--
			-- -- Let's configure the item's appearance
			-- -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
			formatting = {
				-- Set order from left to right
				-- kind: single letter indicating the type of completion
				-- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
				-- menu: extra text for the popup menu, displayed after "word" or "abbr"
				fields = { "abbr", "menu", "kind" },

				format = lspkind.cmp_format({
					mode = "symbol_text", -- show only symbol annotations
                    maxwidth = function() return math.floor(0.3 * vim.o.columns) end,
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					-- The function below will be called before any actual modifications from lspkind
				}),
				-- customize the appearance of the completion menu
				--      format = function(entry, vim_item)
				--          vim_item.menu = ({
				--              nvim_lsp = '[Lsp]',
				--              luasnip = '[Luasnip]',
				--              buffer = '[File]',
				--              path = '[Path]',
				--          })[entry.source.name]
				--          return vim_item
				--      end,
			},
			--
			--
			-- Set source precedence
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- For nvim-lsp
				--{ name = 'luasnip' },     -- For luasnip user
				{ name = "buffer" }, -- For buffer word completion
				{ name = "path" }, -- For path completion
				{ name = "nvim_lsp_signature_help" }, -- for signature hint
				{ name = "calc" }, -- source for math calculation

				{ name = "nvim_lua", keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
				{ name = "vsnip", keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
			}),
		})
	end,
}
