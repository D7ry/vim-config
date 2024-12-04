-- specific configurations for vscode

local vscode = require("vscode")

vim.notify = vscode.notify

local opts = {
    noremap = true,            -- non-recursive
    silent = true,             -- do not show message
}


--vim.api.nvim_set_keymap("n", "]", "<Nop>", { noremap = true })


---------- Keymaps ----------


---- Telescope-like navigation
vim.keymap.set('n', '<leader>t', function()
    require("vscode").action("workbench.action.showCommands")
end, { desc = 'Telescope', noremap=true })

vim.keymap.set('n', '<leader>ff', function()
    require("vscode").action("workbench.action.quickOpen")
end, { desc = 'Browse Files', noremap=true })

vim.keymap.set('n', '<leader>fd', function()
    require("vscode").action("editor.action.peekDefinition")
end, { desc = 'Peek Definition', noremap=true })

vim.keymap.set('n', '<leader>fs', function()
    require("vscode").action("workbench.action.gotoSymbol")
end, { desc = 'LSP document symbols', noremap=true })

vim.keymap.set('n', '<leader>fS', function()
    require("vscode").action("workbench.action.showAllSymbols")
end, { desc = 'LSP workspace symbols', noremap=true })

vim.keymap.set('n', '<leader>fr', function()
    require("vscode").action("editor.action.referenceSearch.trigger")
end, { desc = 'Peek References', noremap=true })

---- Bookmarks
vim.keymap.set('n', '<leader>m', function()
    require("vscode").action("bookmarks.toggle")
end, { desc = 'Toggle Bookmark', noremap=true })

vim.keymap.set('n', '<leader>n', function()
    require("vscode").action("bookmarks.toggleLabeled")
end, { desc = 'Toggle Labeled bookmark' , noremap=true})

vim.keymap.set('n', '<leader>l', function()
    require("vscode").action("bookmarks.list")
end, { desc = 'Toggle Labeled bookmark' , noremap=true})

vim.keymap.set('n', '<leader>a', function()
    require("vscode").action("bookmarks.listFromAllFiles")
end, { desc = 'Toggle Labeled bookmark' , noremap=true})


vim.keymap.set('n', "<Leader><tab>",
    function()
        require("vscode").action("workbench.action.toggleSidebarVisibility")
    end, { desc = 'Toggle primary sidebar', noremap=true })

---- Window resizing
vim.keymap.set('n', '<C-Right>', function()
    require("vscode").action("workbench.action.increaseViewSize")
end, { desc = 'Size up current view' , noremap=true})

vim.keymap.set('n', '<C-Left>', function()
    require("vscode").action("workbench.action.decreaseViewSize")
end, { desc = 'Size down current view' , noremap=true})

---- Debug hotkey
vim.keymap.set('n', '<leader>b', function()
    require("vscode").action("editor.debug.action.toggleBreakpoint")
end, { desc = 'toggle breakpoint' , noremap=true})
