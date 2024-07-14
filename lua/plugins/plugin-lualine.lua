-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir

-- Color table for highlights
-- stylua: ignore
local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		--        theme = "tokyonight",
		--theme = {
		-- We are going to use lualine_c an lualine_x as left and
		-- right section. Both are highlighted by c theme .  So we
		-- are just setting default looks o statusline
		--normal = { c = { fg = colors.fg, bg = colors.bg } },
		--inactive = { c = { fg = colors.fg, bg = colors.bg } },
		--},
        -- theme = "monokai-pro",
		globalstatus = true,
		disabled_filetypes = { "Outline", "aerial", "alpha", "neo-tree", "NvimTree", "trouble"}, -- disable startup dashboard
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},

    winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },

    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
	-- statusline = {
	--
	-- 	lualine_c = { "filename" },
	-- },
}

-- Inserts a component in lualine_c at left section
local function push_left(component)
	table.insert(config.sections.lualine_c, component)
end



local function push_mid_left(component)
	table.insert(config.sections.lualine_b, component)
end

local function push_far_left(component)
	table.insert(config.sections.lualine_a, component)
end

local function push_far_left_winbar(component)
	table.insert(config.winbar.lualine_a, component)
end


local function push_mid_left_winbar(component)
	table.insert(config.winbar.lualine_b, component)
end


local function push_left_winbar(component, push_to_all)
	table.insert(config.winbar.lualine_c, component)
    if (push_to_all) then
        table.insert(config.inactive_winbar.lualine_c, component)
    end
end

-- Inserts a component in lualine_x at right section
local function push_right(component)
	table.insert(config.sections.lualine_x, component)
end

local function push_far_right(component)
	table.insert(config.sections.lualine_z, component)
end

--ins_left {
-- function()
--  return '▊'
--end,
-- color = { fg = colors.blue }, -- Sets highlighting of component
-- padding = { left = 0, right = 1 }, -- We don't need space before this
--}


-- push_left({
-- 	"filename",
-- 	cond = conditions.buffer_not_empty,
-- 	--color = { fg = colors.magenta, gui = 'bold' },
-- })

push_far_left({
	function()
		local project_name = require("project_nvim").get_current_project()
		if not project_name then
            project_name = "No Active Project"
        end
        return project_name
	end,
	icon = "",
})



push_mid_left({
	"branch",
	icon = "",
	--    color = { fg = colors.violet, gui = 'bold' },
})

-- push_left({
-- 	"filename",
-- 	cond = conditions.buffer_not_empty,
-- 	--color = { fg = colors.magenta, gui = 'bold' },
-- })

-- push_left({ "location" })

--ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
--ins_left {
--  function()
--    return '%='
--  end,
--}

push_left({
	"diff",
	-- Is it me or the symbol for modified us really weird
	symbols = { added = " ", modified = "󰝤 ", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	-- cond = conditions.hide_in_width,
})

-- show the currently active project
push_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
})
--
push_right({
	-- copilot status
	"copilot",
})

push_right({
	-- filesize component
	"filetype",
	cond = conditions.buffer_not_empty,
})

push_far_right({
	-- Lsp server name .
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = "",
})

-- Add components to right sections
-- push_right({
-- 	"o:encoding", -- option component same as &encoding in viml
-- 	fmt = string.upper, -- I'm not sure why it's upper case either ;)
-- 	cond = conditions.hide_in_width,
-- 	color = { fg = colors.green, gui = "bold" },
-- })

-- push_right({
-- 	"fileformat",
-- 	fmt = string.upper,
-- 	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
-- 	color = { fg = colors.green, gui = "bold" },
-- })

-- -- battery support
-- local nvimbattery = {
-- 	function()
-- 		return require("battery").get_status_line()
-- 	end,
-- 	--color = { fg = colors.violet, bg = colors.bg },
-- }

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function()
        -- trouble suport
        local trouble = require("trouble")
        local symbols = trouble.statusline({
          mode = "lsp_document_symbols",
          groups = {},
          title = false,
          filter = { range = true },
          format = "{kind_icon}{symbol.name:Normal}",
          -- The following line is needed to fix the background color
          -- Set it to the lualine section you want to use
          hl_group = "lualine_c_normal",
        })
        push_left_winbar(
        {
            symbols.get,
            cond = symbols.has
        },
        false
        )
		require("lualine").setup(config)
	end,
}
