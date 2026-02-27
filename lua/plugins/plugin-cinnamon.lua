return {
	"declancm/cinnamon.nvim",
	config = function()
		require("cinnamon").setup({
			extra_keymaps = true,
			override_keymaps = true,
			max_length = -1,
			scroll_limit = 50,
			default_delay = 0.5, -- the default delay (in ms) between each line when scrolling.
            config = function()
                local cinnamon = require("cinnamon")

                cinnamon.setup()

                -- Centered scrolling:
                vim.keymap.set("n", "<C-U>", function() cinnamon.scroll("<C-U>zz") end)
                vim.keymap.set("n", "<C-D>", function() cinnamon.scroll("<C-D>zz") end)

            end,
		})
	end,
}
