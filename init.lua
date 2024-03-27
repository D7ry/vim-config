-- load vimrc
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("options")
require("keymaps")
--require("plugins")
require("plugins-lazy")
vim.cmd.colorscheme(require("colorscheme").current_scheme)
require("setup_markdown")
require("lsp")
require("config.nvim-cmp")
require("lazygit")
require("neovide")

-- open up telescope if no file has been opened
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	pattern = "*",
-- 	callback = function()
-- 		if #vim.fn.argv() == 0 then
-- 			vim.cmd("Telescope find_files")
-- 		end
-- 	end,
-- })
--open up a neotree if no file has been opened
--vim.api.nvim_create_autocmd("VimEnter", {
--    pattern = "*",
--    callback = function()
--        if #vim.fn.argv() == 0 then
--            vim.cmd('Neotree toggle')
--        end
--    end
--})
--

--TODO: put this into a separate file
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.vert", "*.frag"},
    command = "set filetype=glsl",
})



-- # lock cursor for certain filetypes
-- vim.g.locked_filetypes = {'cpp', 'python', 'other_filetype'}
--
-- function _G.LockCursorForFileTypes()
--   if vim.fn.index(vim.g.locked_filetypes, vim.bo.filetype) >= 0 then
--     vim.api.nvim_buf_set_keymap(0, 'n', '<C-W>h', '', {noremap = true, silent = true})
--     vim.api.nvim_buf_set_keymap(0, 'n', '<C-W>j', '', {noremap = true, silent = true})
--     vim.api.nvim_buf_set_keymap(0, 'n', '<C-W>k', '', {noremap = true, silent = true})
--     vim.api.nvim_buf_set_keymap(0, 'n', '<C-W>l', '', {noremap = true, silent = true})
--   end
-- end
--
-- vim.cmd('autocmd FileType * lua LockCursorForFileTypes()')
