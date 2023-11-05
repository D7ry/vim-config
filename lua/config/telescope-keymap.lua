
return {
    { "<Leader>ts", "<cmd>Telescope<cr>", "open telescope" },
    { "fd", "<cmd>Telescope lsp_definitions<cr>", "go to definition" },
    { "fr", "<cmd>Telescope lsp_references<cr>", "go to references" },
    { "fi", "<cmd>Telescope lsp_implementations<cr>", "go to implementations" },
    { "fg", "<cmd>Telescope live_grep<cr>", "global search"},
    { 'ff', '<cmd>Telescope find_files<CR>'},
    { 'fs', '<cmd>Telescope treesitter<cr>', "telescope tree sitter" }
}
