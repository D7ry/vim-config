return {
    'akinsho/bufferline.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
        require("bufferline").setup(
            {
                options = {
                    diagnostics = "nvim_lsp",

                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        local icon = level:match("error") and " " or ""
                        return " " .. icon .. count
                    end,


                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "Files",
                            highlight = "Directory",
                            text_align = "left"
                        }
                    }
                },
            }
        )
    end,
    lazy = false
}
