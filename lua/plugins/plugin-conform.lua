return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "autoflake" },
				-- Use a sub-list to run only the first available formatter
				javascript = { { "prettierd", "prettier" } },
				rust = { "rustfmt" },
				cpp = { "clang_format" },
			},
			formatters = {
				clang_format = {
					args = {},
					-- indentation is a tab
				},
			},
		})
	end,
	lazy = false,
	keys = {
		{
			"<Leader>fm",
			function()
				-- Define any options required for formatting
				local opts = {}

				-- Define the callback function
				local function formatCallback(err)
					if err then
						-- If err is not nil, an error occurred during formatting.
						vim.notify("Formatting failed: " .. err, vim.log.levels.ERROR, { title = "Conform" })
					else
						-- If err is nil, formatting was successful.
						vim.notify("Formatting successful", vim.log.levels.INFO, { title = "Conform" })
					end
				end

				-- Call the format function with options and the callback
				require("conform").format(opts, formatCallback)
			end,
            desc = "Format whole file",
            mode = "n"
		},
		{
			"<Leader>fm",
			function()
				-- Define any options required for formatting
				local opts = {}

				-- Define the callback function
				local function formatCallback(err)
					if err then
						-- If err is not nil, an error occurred during formatting.
						vim.notify("Formatting failed: " .. err, vim.log.levels.ERROR, { title = "Conform" })
					else
						-- If err is nil, formatting was successful.
						vim.notify("Formatting successful", vim.log.levels.INFO, { title = "Conform" })
					end
				end

				-- Call the format function with options and the callback
				require("conform").format(opts, formatCallback)
			end,
            desc = "Format selected text",
            mode = "v"
		},
	},
}
