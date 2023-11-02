require("options")
require("keymaps")
require("plugins")
require("colorscheme")
require("lsp")
require("config.nvim-tree")
require("discordrpc")
require("github-copilot")
-- require("neoscroll").setup()
require("lualine").setup() -- https://github.com/nvim-lualine/lualine.nvim
require("gitsigns").setup() -- https://github.com/lewis6991/gitsigns.nvim
require("config.nvim-tree-sitter")
require("bufferline").setup() -- https://github.com/akinsho/bufferline.nvim 
require("leap").add_default_mappings()
require("which-key").setup()
require("config.dashboard").setup()

