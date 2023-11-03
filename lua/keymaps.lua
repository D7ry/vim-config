-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- move left/right by a word
vim.api.nvim_set_keymap('n', '<D-l>', 'w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<D-h>', 'b', { noremap = true, silent = true })

-- quick save
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)


-----------------
-- Insertion   --
-----------------

-- Remove the original keybinding for Ctrl-j
-- vim.api.nvim_del_keymap('i', '<C-j>')
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true, silent = true, expr = false })
--vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true, silent = true, expr = false })
--vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true, silent = true, expr = false })

-- Define a keybinding in Insert mode to delete a word with Ctrl+Backspace
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-w>', { noremap = true, silent = true })


-- Leader keybinding

-- Set space as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Map keys to navigate through buffers
vim.api.nvim_set_keymap('n', '<leader>]', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>[', ':bprevious<CR>', { noremap = true, silent = true })
-- Open NERDTree-like file explorer
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- toggleterm
vim.keymap.set('n', '<leader>`', '<cmd>ToggleTerm direction=horizontal<cr>', opts)

-- telescope 
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')

-- switch windows
-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<Leader>h', '<C-w>h', opts)
vim.keymap.set('n', '<Leader>j', '<C-w>j', opts)
vim.keymap.set('n', '<Leader>k', '<C-w>k', opts)
vim.keymap.set('n', '<Leader>l', '<C-w>l', opts)

-- toggle symbols
vim.keymap.set('n', '<Leader>s', '<cmd>SymbolsOutline<cr>', opts)

-- esc key mapping
vim.keymap.set('n', '<C-Space>', '<Esc>', opts)
vim.keymap.set('i', '<C-Space>', '<Esc>', opts)
-- Quit terminal shortcut
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)


