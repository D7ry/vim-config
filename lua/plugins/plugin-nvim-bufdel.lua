return(
{
    "ojroques/nvim-bufdel",
    config = function ()
        vim.api.nvim_set_keymap("n", "<leader>bd", ":BufDel<cr>", { noremap = true, silent = true})
        require("bufdel").setup {
            quit = false,
        }
    end
    
}
)
