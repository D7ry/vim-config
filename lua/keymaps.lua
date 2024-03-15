-- define common options
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}

-- Unmap all keybindings starting with a given character in Neovim using Lua
local function unmap_keys_starting_with_char(mode, char)
	-- Validate the input character
	if not char or #char ~= 1 then
		--    print("Please provide a single character.")
		return
	end

	-- Retrieve current key mappings for the given mode
	local keymaps = vim.api.nvim_get_keymap(mode)

	-- Iterate over the key mappings and unmap those starting with the given character
	for _, map in ipairs(keymaps) do
		if map.lhs:sub(1, 1) == char then
			-- Unmap the key using the command-line mode to handle complex mappings
			vim.api.nvim_command(mode .. "unmap " .. map.lhs)
			--      print("Unmapped: " .. map.lhs)
		end
	end
end

unmap_keys_starting_with_char("n", "[")
unmap_keys_starting_with_char("n", "]")
-- delete some useless keymaps
-- delete []
vim.api.nvim_set_keymap("n", "]", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "[", "<Nop>", { noremap = true })
--vim.api.nvim_set_keymap("n", "t", "<Nop>", { noremap = true })
--vim.api.nvim_set_keymap("n", "f", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<Nop>", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<Nop>", opts)
vim.api.nvim_set_keymap("n", "ge", "<Nop>", opts)

local function unmap_key(mode, key)
	vim.api.nvim_set_keymap(mode, key, "<Nop>", { noremap = true })
end

unmap_key("n", "(")
unmap_key("n", ")")

-- set () to go to line start/end
vim.api.nvim_set_keymap("n", "(", "^", opts)
vim.api.nvim_set_keymap("n", ")", "$", opts)

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
-- Example usage, this creates a command that you can use from the Neovim command line
-- Usage in Neovim command line
-----------------
-- Normal mode --
-----------------
--
-- Resize with arrows
-- delta: 2 lines
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- move left/right by a word
vim.api.nvim_set_keymap("n", "<C-l>", "w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "b", { noremap = true, silent = true })

-- Automatic center after searching
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true, silent = true })

-- quick save
--vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-----------------
-- Visual mode --
-----------------

--k Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-----------------
-- Insertion   --
-----------------

-- Remove the original keybinding for Ctrl-j
-- vim.api.nvim_del_keymap('i', '<C-j>')
--vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true, silent = true, expr = false })
--vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true, silent = true, expr = false })
--vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true, silent = true, expr = false })
--vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true, silent = true, expr = false })

-- Define a keybinding in Insert mode to delete a word with Ctrl+Backspace
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })
-- delete a word in command mode
vim.api.nvim_set_keymap("t", "<C-BS>", "<C-w>", { noremap = true, silent = true })
-- invoke noh when pressing esc in normal mode
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })

-- Leader keybinding

-- Set space as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Map keys to navigate through buffers
vim.api.nvim_set_keymap("n", "<Leader>]", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>[", ":bprevious<CR>", { noremap = true, silent = true })
-- toggleterm
--vim.keymap.set("n", "<leader>`", "<cmd>ToggleTerm direction=horizontal<cr>", opts)

-- telescope

-- switch windows
-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set("n", "<Leader>h", "<C-w>h", opts)
vim.keymap.set("n", "<Leader>j", "<C-w>j", opts)
vim.keymap.set("n", "<Leader>k", "<C-w>k", opts)
vim.keymap.set("n", "<Leader>l", "<C-w>l", opts)

-- toggle symbols
--vim.keymap.set('n', '<Leader>s', '<cmd>SymbolsOutline<cr>', opts)

-- Quit terminal shortcut
vim.keymap.set("t", "<C-\\>q", "<C-\\><C-n>", opts)

vim.keymap.set("n", "<C-i>", "K", opts)
