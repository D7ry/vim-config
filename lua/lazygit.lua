-- lazygit needse to be installed separately from https://github.com/jesseduffield/lazygit#installation
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true , direction="float"})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gu", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true, desc = "Toggle Lazy Git UI"})
