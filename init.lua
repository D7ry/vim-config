-- load vimrc
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("options")
require("keymaps")
vim.opt.clipboard = "unnamedplus"

local is_nv = os.getenv("IS_NV")
_G.IS_NV = (is_nv == "true")
if _G.IS_NV then
    local nv_lua_path = os.getenv("P_NVIM_GLV")
    print("P_NVIM_GLV environment variable: " .. tostring(nv_lua_path))  -- Debug print
    vim.opt.runtimepath:append(nv_lua_path)
end

if vim.g.vscode then
    -- VSCode extension
    require("vscode_neovim")

else -- ordinary vim
    require("plugins-lazy")
    vim.cmd.colorscheme(require("colorscheme").current_scheme)
    --require("setup_markdown")
    require("lsp")
    --require("config.nvim-cmp")
    -- require("lazygit")
    require("neovide")
    require("p4")
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

vim.diagnostic.config({ virtual_text = true })




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
