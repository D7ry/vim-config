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
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("config.monokai-pro-setup")
		end,
	},
	{ "rebelot/kanagawa.nvim", lazy = false },
	{ "sainnhe/edge", lazy = false },
	{ "sainnhe/sonokai", lazy = false },
	{ "marko-cerovac/material.nvim", lazy = true },
	{ "navarasu/onedark.nvim", lazy = true },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("config.tokyonight-setup")
		end,
	},
	{ "mhartington/oceanic-next", lazy = false },
	{ "tanvirtin/monokai.nvim", lazy = true },
	-- { "morhetz/gruvbox", lazy = false},
    require("plugins.colorscheme.gruvbox"),
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	{ "projekt0n/github-nvim-theme", lazy = false },
	{ "catppuccin/nvim", lazy = false, priority = 1000 },
	{ "shaunsingh/nord.nvim", lazy = false },
	require("plugins.plugin-bufferline"),
	require("plugins.plugin-lualine"),
	require("plugins.plugin-copilot-lualine"),
	--require("plugins.plugin-drop"),
	--require("plugins.plugin-alpha"),
	require("plugins.plugin-todo-comments"),
	--require("plugins.plugin-dashboard"),
	require("plugins.plugin-trouble"),

	require("plugins.plugin-noice"),
    require("plugins.plugin-nvim-notify"),
	--{
	--	"folke/noice.nvim",
	--	event = "VeryLazy",
	--dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	--	config = function()
	--		require("noice").setup(require("config.noice-config"))
	--	end,
	--},
	-- LSP and Autocompletion
	--require("noice").setup(require("config.noice-config")),
	require("plugins.plugin-hover"),
	--require("plugins.plugin-aerial"),
	require("plugins.plugin-symbols-outline"),
    require("plugins.plugin-lspsaga"),
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
	--require("plugins.plugin-neotree"),
	--require("plugins.plugin-telescope-file-browser"),
	--{'kyazdani42/nvim-tree.lua', dependencies = {'kyazdani42/nvim-web-devicons'}},

	--{
	--	"nvim-neo-tree/neo-tree.nvim",
	--	branch = "v3.x",
	--	dependencies = {
	--		"nvim-lua/plenary.nvim",
	--		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	--		"MunifTanjim/nui.nvim",
	--		"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	--	},
	--	config = function()
	--		require("neo-tree").setup(require("config.neo-tree-config"))
	--	end,
	--	keys = require("config.neo-tree-keymap"),
	--	lazy = false,
	--},
	{ "lewis6991/gitsigns.nvim" },
	-- Terminal Integration
	require("plugins.plugin-toggleterm"),
	-- Other Utilities
	--require("plugins.plugin-cinnamon"), -- for smooth scrolling
	--{'karb94/neoscroll.nvim'},
	{ "andweeb/presence.nvim" },
	{ "williamboman/mason.nvim", lazy = false },
	{ "williamboman/mason-lspconfig.nvim", lazy = false },
	{ "jdhao/better-escape.vim" },
	require("plugins.plugin-which-key"),
	{ "RRethy/vim-illuminate" },
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
}

local opts = {}

-- enable cinnamon only if neovide is not enabled
--[[ if not vim.g.neovide then
    table.insert(plugins, require("plugins.plugin-cinnamon"))
end ]]
if not vim.g.neovide then
    print("Neovide is enabled")
end

require("lazy").setup(plugins)
