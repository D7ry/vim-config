-- configuration specific to neovide. only activated if is through neovide


if vim.g.neovide then
	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	vim.g.neovide_transparency = 1
	vim.g.transparency = 1
	vim.g.neovide_fullscreen = true
	vim.g.neovide_cursor_vfx_mode = "railgun"

    local font = "CaskaydiaCove Nerd Font"
    local font_size = 12

    -- returns the font string that can be used to set the font in neovide
    local function get_font_str()
        return font .. ":h" .. font_size
    end

    local set_neovide_font = function()
        vim.o.guifont = get_font_str()
    end

    adjust_neovide_font_size = function(delta)
        font_size = font_size + delta
        set_neovide_font()
        vim.notify("Font size set to " .. font_size)
    end
    
	-- set keymaps
	local opts = {
		noremap = true, -- non-recursive
		silent = true, -- do not show message
	}

    -- adjust font size with ctrl + =/-
	vim.api.nvim_set_keymap("n", "<C-=>", ":lua adjust_neovide_font_size(1)<CR>", opts)
	vim.api.nvim_set_keymap("n", "<C-->", ":lua adjust_neovide_font_size(-1)<CR>", opts)
    vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
	--	vim.g.neovide_background_color = "#0f1117" .. alpha()
	--
	-- Put anything you want to happen only in Neovide here
end
