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
    --{'marko-cerovac/material.nvim'},
    {"loctvl842/monokai-pro.nvim",
        config = function()
            require('config.monokai-pro-setup')
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('config.tokyonight-setup')
        end
    },
    {'tanvirtin/monokai.nvim'},
    {'morhetz/gruvbox'},
    {'projekt0n/github-nvim-theme'},
    {'nvim-lualine/lualine.nvim', dependencies = {'kyazdani42/nvim-web-devicons'}},
    {'akinsho/bufferline.nvim', dependencies = {'kyazdani42/nvim-web-devicons'}},
    {'goolord/alpha-nvim', dependencies = {'kyazdani42/nvim-web-devicons'}},
    
    {'nvimdev/dashboard-nvim', dependencies = 'nvim-tree/nvim-web-devicons'},
    {'rcarriga/nvim-notify',
        config = function()
            vim.opt.termguicolors = true
            vim.notify = require("notify")
        end,
        lazy = false
    },
    {'folke/trouble.nvim', dependencies = {'nvim-tree/nvim-web-devicons'}, opts = require("config.nvim-notify-config")},
    {'folke/noice.nvim', event = 'VeryLazy', dependencies = {'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify'},
       config = function()
            require('noice').setup(require('config.noice-config'))
        end
    },
    -- LSP and Autocompletion
    {'neovim/nvim-lspconfig', lazy=false},
    {'hrsh7th/nvim-cmp', dependencies = {
        {'hrsh7th/cmp-nvim-lsp',lazy=false },
        {'hrsh7th/cmp-buffer', lazy=false},
        {'hrsh7th/cmp-path', lazy=false},
        {'hrsh7th/cmp-cmdline', lazy=false},
        --{'hrsh7th/cmp-nvim-lsp-signature-help'}
    },
    lazy=false
    },
    {'L3MON4D3/LuaSnip'},
    {'saadparwaiz1/cmp_luasnip'},
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    -- Telescope
    {'nvim-telescope/telescope.nvim', lazy = false, dependencies = {'nvim-lua/plenary.nvim', "nvim-telescope/telescope-fzf-native.nvim"}, 
        keys = require("config.telescope-keymap"),
        lazy = false
    },

    -- AI
    {'zbirenbaum/copilot.lua', cmd = "Copilot", 
        config = function()
        require("copilot").setup(require("config.copilot-config"))
        end,
        event = "InsertEnter"
    },

    -- Treesitter
    {'nvim-treesitter/nvim-treesitter',
        lazy = false,
        run = ':TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup(require("config.nvim-treesitter-config"))
        end
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
    {'simrat39/symbols-outline.nvim', 
        config = function()
            require("symbols-outline").setup(require("config.symbols-outline-config"))
        end
    },
    {'RRethy/vim-illuminate'},
    {'folke/which-key.nvim'},
    {'ggandor/leap.nvim'},
    {'simrat39/rust-tools.nvim'},
}

local opts = {}

require("lazy").setup(plugins)
require("config.telescope-setup").setup()


