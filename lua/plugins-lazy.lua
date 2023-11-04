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

    -- UI Plugins
    {'tanvirtin/monokai.nvim'},
    {'morhetz/gruvbox'},
    {'projekt0n/github-nvim-theme'},
    {'nvim-lualine/lualine.nvim', dependencies = {'kyazdani42/nvim-web-devicons'}},
    {'akinsho/bufferline.nvim', dependencies = {'kyazdani42/nvim-web-devicons'}},
    {'goolord/alpha-nvim', dependencies = {'kyazdani42/nvim-web-devicons'}},
    
    {'nvimdev/dashboard-nvim', dependencies = 'nvim-tree/nvim-web-devicons'},
    -- LSP and Autocompletion
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp', requires = {
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-cmdline'},
    }},
    {'L3MON4D3/LuaSnip'},
    {'saadparwaiz1/cmp_luasnip'},

    -- Telescope
    {'nvim-telescope/telescope.nvim', lazy = false, dependencies = {'nvim-lua/plenary.nvim'}, keys = require("config.telescope-keymap") },

    -- AI
    {'zbirenbaum/copilot.lua', cmd = "Copilot"},

    -- Treesitter
    {'nvim-treesitter/nvim-treesitter' 
        --run = ':TSUpdate'
    },

    -- File Explorer
    --{'kyazdani42/nvim-tree.lua', dependencies = {'kyazdani42/nvim-web-devicons'}},
    
    {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
    config = function()
        require("neo-tree").setup(require("config.neo-tree-config"))
    end,
    keys = require("config.neo-tree-keymap")
    },

    -- Git
    {'lewis6991/gitsigns.nvim'},

    -- Terminal Integration
    {'akinsho/toggleterm.nvim', config=true},

    -- Other Utilities
    {'karb94/neoscroll.nvim'},
    {'andweeb/presence.nvim'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'jdhao/better-escape.vim'},
    {'simrat39/symbols-outline.nvim'},
    {'RRethy/vim-illuminate'},
    {'folke/which-key.nvim'},
    {'ggandor/leap.nvim'},
    {'simrat39/rust-tools.nvim'},
}

local opts = {}

require("lazy").setup(plugins)
