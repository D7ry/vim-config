return {
	"declancm/cinnamon.nvim",
	config = function()
		require("cinnamon").setup({
			extra_keymaps = true,
			override_keymaps = true,
			max_length = -1,
			scroll_limit = 100,
			default_delay = 1, -- The default delay (in ms) between each line when scrolling.
		})
	end,
}
