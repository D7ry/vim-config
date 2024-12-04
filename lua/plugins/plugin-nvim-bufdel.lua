return(
{
    "ojroques/nvim-bufdel",
    config = function ()
        vim.api.nvim_set_keymap("n", "<C-q>", ":BufDel<cr>", { noremap = true, silent = true, desc = "Buffer delete"})
        require("bufdel").setup {
            quit = false,
        }
    end
}
)
