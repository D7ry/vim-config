-- load vimrc
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("options")
require("keymaps")
vim.opt.clipboard = "unnamedplus"

if vim.g.vscode then
    -- VSCode extension
    require("vscode_neovim")

else -- ordinary vim
    require("plugins-lazy")
    vim.cmd.colorscheme(require("colorscheme").current_scheme)
    require("setup_markdown")
    require("lsp")
    -- require("config.nvim-cmp")
    -- require("lazygit")
    require("neovide")
end

-- extended glsl types
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {
    "*.vert",
    "*.frag",
    -- raytracing shaders
    "*.rgen",
    "*.rint",
    "*.rahit",
    "*.rchit",
    "*.rmiss",
    "*.rcall",
},
    command = "set filetype=glsl",
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.cl"},
    command = "set filetype=cpp",
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
