local function get_visual_selection()
	local s_start = vim.fn.getpos("'<")
	local s_end = vim.fn.getpos("'>")
	local n_lines = math.abs(s_end[2] - s_start[2]) + 1
	local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
	lines[1] = string.sub(lines[1], s_start[3], -1)
	if n_lines == 1 then
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
	else
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
	end
	return table.concat(lines, "\n")
end
return {
	{
		-- "CopilotC-Nvim/CopilotChat.nvim",
		"D7ry/CopilotChat.nvim",
        lazy = false,
		config = function()
			require("CopilotChat").setup({

				debug = false, -- Enable debugging

				notify_done = false,
				context = "buffer",
				-- system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use
				--
				question_header = "󱍄", -- Header to use for user questions
				answer_header = "",
				separator = "━━━━━━━━━━━━━━━━━━━━━━━━━━━",
				branch = "canary",
				model = "gpt-4", -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
				temperature = 0.1, -- GPT temperature
				dependencies = {
					{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
					{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
				},

				show_help = false,
				window = {
					layout = "float",
					relative = "editor",
					title = "Copilot",
					footer = "<C-i> to toggle chat | <C-l> to clean chat",
					width = 0.6,
					height = 0.5,
					row = 0,
					border = "rounded", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
				},
				-- See Configuration section for rest
			})
		end,
		opts = {
		},
		-- See Commands section for default commands if you want to lazy load on them
		keys = {
			{
				"<leader>y",
				function()
					local input = vim.fn.input("Ask Buffer: ")
					if input ~= "" then
						require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
					end
				end,
				desc = "CopilotChat - Quick chat",
				mode = "n",
			},

			{
				"<leader>y",
				function()
					local input = vim.fn.input("Ask Selected: ")
					if input ~= "" then
						require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
					end
				end,
				desc = "CopilotChat - Quick chat on selected",
				mode = "v",
			},
			{
				"<C-y>",
				"<cmd>CopilotChatToggle<CR>",
				desc = "CopilotChat - Toggle chat",
			},
		},
	},
}
