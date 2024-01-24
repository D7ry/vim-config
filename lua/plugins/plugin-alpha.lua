return {
    'goolord/alpha-nvim',
    config = function ()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        -- Set header
        dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }
    
        dashboard.section.footer.val = {
            "工欲善其事，必先利其器"
        }

        -- Set menu
        dashboard.section.buttons.val = {
            --dashboard.button( "a", "󱙺  > Jarvis" , ":enew | :ChatGPT<CR>"),
            dashboard.button( "t", "󰙅  > File tree" , ":NvimTreeToggle<cr>"),
            dashboard.button( "f", "󰛔  > Find file", ":Telescope find_files<CR>"),
            dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
            dashboard.button( "s", "  > Configuration" , ":cd ~/.config/nvim/ | :e .<CR>"),
            dashboard.button( "c", "󰔎  > Color scheme", ":Telescope colorscheme<CR>"),
            dashboard.button( "p", "  > Plugins"  , ":Lazy<CR>"),
            dashboard.button( "q", "󰗼  > Exit", ":qa<CR>"),
        }
        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
        --require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
};
