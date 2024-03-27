return {
	"Bekaboo/dropbar.nvim",
	requires = {
		"nvim-telescope/telescope-fzf-native.nvim",
		config = function()
			require("dropbar").setup({
				enable = function(buf, win, _)
					return vim.fn.win_gettype(win) == ""
						and vim.wo[win].winbar == ""
						and vim.bo[buf].bt == ""
						and (
							vim.bo[buf].ft == "markdown"
							or (
								buf
									and vim.api.nvim_buf_is_valid(buf)
									and (pcall(vim.treesitter.get_parser, buf, vim.bo[buf].ft))
									and true
								or false
							)
						)
				end,
			})
		end,
	},
}
