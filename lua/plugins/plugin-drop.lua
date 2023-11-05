return {
    "folke/drop.nvim",
    config = function()
        require("drop").setup({
              theme = "leaves", -- can be one of rhe default themes, or a custom theme
              max = 10, -- maximum number of drops on the screen
              interval = 100, -- every 150ms we update the drops
              screensaver = 1000 * 60 * 5, -- show after 5 minutes. Set to false, to disable
              filetypes = { "dashboard", "alpha", "starter" }, -- will enable/disable automatically for the following filetypes
        })
    end,
    event = "VimEnter"
}
