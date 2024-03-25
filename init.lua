-- load vimrc
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("options")
require("keymaps")
--require("plugins")
require("plugins-lazy")
require("setup_markdown")
require("colorscheme")
require("lsp")
require("discordrpc")
--require("lualine").setup() -- https://github.com/nvim-lualine/lualine.nvim
require("gitsigns").setup() -- https://github.com/lewis6991/gitsigns.nvim
--require("bufferline").setup() -- https://github.com/akinsho/bufferline.nvim
--require("leap").add_default_mappings()
--require("copilot").setup({})
--require("config.rust-tools")
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
