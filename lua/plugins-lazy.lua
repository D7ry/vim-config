--lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- define plugins here
local plugins = {

	-- startup screen
	--require("plugins.plugin-startup"),
	--require("plugins.plugin-miniintro"),
	-- UI Plugins
	-- { "morhetz/gruvbox", lazy = false},
	require("plugins.plugin-bufferline"),
	require("plugins.plugin-lualine"),
	--require("plugins.plugin-drop"),
	require("plugins.plugin-alpha"),
	require("plugins.plugin-todo-comments"),
	--require("plugins.plugin-dashboard"),
	require("plugins.plugin-trouble"),
    require("plugins.plugin-scrollbar"),
    -- require("plugins.plugin-dropbar"),

	require("plugins.plugin-noice"),
    require("plugins.plugin-nvim-notify"),
	require("plugins.plugin-hover"),
	--require("plugins.plugin-aerial"),
	require("plugins.plugin-outline"),
    -- require("plugins.plugin-lspsaga"),
    require("plugins.plugin-inc-rename"),
    require("plugins.plugin-glance"),
	{ "neovim/nvim-lspconfig", lazy = false },
	{ "folke/lsp-colors.nvim" },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp", lazy = false },
			{ "hrsh7th/cmp-buffer", lazy = false },
			{ "hrsh7th/cmp-path", lazy = false },
			{ "hrsh7th/cmp-cmdline", lazy = false },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/vim-vsnip" },
			{ "onsails/lspkind.nvim", lazy = false }, --{'hrsh7th/cmp-nvim-lsp-signature-help'}
		},
		lazy = false,
	},
	--require("plugins.plugin-harpoon"),
	--{ "L3MON4D3/LuaSnip" },
	--{ "saadparwaiz1/cmp_luasnip" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		lazy = false,
	},
	require("plugins.plugin-lspkind"),
	require("plugins.plugin-rust-tools"),

	-- auto formatting
	require("plugins.plugin-conform"),
	-- Telescope
	require("plugins.plugin-telescope"),
	require("plugins.plugin-copilot"),
	require("plugins.plugin-copilot-lualine"),
    require("plugins.plugin-copilot-chat"),
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup(require("config.nvim-treesitter-config"))
		end,
	},
	require("plugins.plugin-nvim-treesitter-context"),

	-- File Explorer
	require("plugins.plugin-nvim-tree"),
    require("plugins.plugin-gitsigns"),
    require("plugins.plugin-diffview"),
	-- Terminal Integration
	require("plugins.plugin-toggleterm"),
	-- Other Utilities
	--require("plugins.plugin-cinnamon"), -- for smooth scrolling
	--{'karb94/neoscroll.nvim'},
	{ "andweeb/presence.nvim" },
	{ "williamboman/mason.nvim", lazy = false },
	{ "williamboman/mason-lspconfig.nvim", lazy = false },
	{ "jdhao/better-escape.vim" },
	-- require("plugins.plugin-which-key"),
    require("plugins.plugin-illuminate"),
	{ "folke/which-key.nvim" },
	--{ "ggandor/leap.nvim" },
	{ "simrat39/rust-tools.nvim" },
	require("plugins.plugin-nvim-autopairs"),
	require("plugins.plugin-battery"),
	require("plugins.plugin-indent-blankline"),
	require("plugins.plugin-nvim-bufdel"),
	--require("plugins.plugin-headlines")
	require("plugins.plugin-obsidian"),
	require("plugins.plugin-transparent"),
	require("plugins.plugin-nvim-markdown"),
	require("plugins.plugin-nabla"),
	require("plugins.plugin-comment"),
    require("plugins.plugin-project"),
    -- require("plugins.plugin-lightbulb")
    -- require("plugins.plugin-neoclip") -- hotkey issue
    -- require("plugins.plugin-ufo")
    -- require("plugins.plugin-vim-visual-multi"),
}

-- plugins only enabled when no frontend is enabled
local terminal_mode_plugins = {
    -- require("plugins.plugin-cinnamon")
    -- require("plugins.plugin-neoscroll")
    -- unfortunately scroll plugins leads to segfault
}

local colorschemes = require('colorscheme').colorschemes
-- add colorschemes to plugins
for _, colorscheme in ipairs(colorschemes) do
    table.insert(plugins, colorscheme)
end


if not vim.g.neovide then
    -- merge terminal_mode_plugins with plugins
    for k,v in pairs(terminal_mode_plugins) do
        table.insert(plugins, v)
    end
end

local opts = {}

-- enable cinnamon only if neovide is not enabled
--[[ if not vim.g.neovide then
    table.insert(plugins, require("plugins.plugin-cinnamon"))
end ]]
-- if not vim.g.neovide then
--     print("Neovide is enabled")
-- end

require("lazy").setup(plugins)
