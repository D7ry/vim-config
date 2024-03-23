-- configuration specific to neovide. only activated if is through neovide




if vim.g.neovide then
	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	vim.g.neovide_transparency = 1
	vim.g.transparency = 1
    if vim.loop.os_uname().sysname == "Linux" then
	    vim.o.guifont = "DroidSansM Nerd Font Mono:h12"
    else -- macos
	    vim.o.guifont = "DroidSansM Nerd Font Mono:h14"
    end
	vim.g.neovide_fullscreen = true
    vim.g.neovide_cursor_vfx_mode = "railgun"
	--	vim.g.neovide_background_color = "#0f1117" .. alpha()
	-- Put anything you want to happen only in Neovide here
end
