vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	callback = function()
        vim.opt_local.syntax = "markdown"
		vim.opt_local.textwidth = 100
		vim.opt_local.wrap = true
		vim.opt_local.spell = false
	end,
})
