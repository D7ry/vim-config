return {
	"ThePrimeagen/harpoon",
	dependencies = "nvim-lua/plenary.nvim",
    -- branch = "harpoon2",
	keys = {
		{
			"<leader>m",
			function()
				require("harpoon.mark").add_file()
			end,
			"Harpoon create mark",
		},
		{
			"<leader>M",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			"Harpoon open ui",
		},
		{
			")",
			function()
				require("harpoon.ui").nav_next()
			end,
			"next harpoon",
		},
		{
			"(",
			function()
				require("harpoon.ui").nav_prev()
			end,
			"previous harpoon",
		},
	},
	-- config = function()
 --        local harpoon = require("harpoon")
 --        harpoon:setup()
	--
 --        vim.keymap.set("n", "<C-m>", function() harpoon:list():add() end)
 --        vim.keymap.set("n", "<C-s>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
	--
 --        -- vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
 --        -- vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
 --        -- vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
 --        -- vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
 --        --
 --        -- Toggle previous & next buffers stored within Harpoon list
 --        vim.keymap.set("n", "<C-q>", function() harpoon:list():prev() end)
 --        vim.keymap.set("n", "<C-e>", function() harpoon:list():next() end)
 --    end,
    lazy = false,
}
