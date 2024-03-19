if vim.g.neovide then
	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	vim.g.neovide_transparency = 0.9
	vim.g.transparency = 1
	vim.o.guifont = "DroidSansM Nerd Font Mono:h12"
	--	vim.g.neovide_background_color = "#0f1117" .. alpha()
	-- Put anything you want to happen only in Neovide here
end
