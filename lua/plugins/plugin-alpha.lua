-- local ascii = require('bhugo.SplashScreen.ascii')
local zero = {
	"███████",
	"██   ██",
	"██   ██",
	"██   ██",
	"███████"
}

local one = {
	"     ██",
	"     ██",
	"     ██",
	"     ██",
	"     ██"
}

local two = {
	"███████",
	"     ██",
	"███████",
	"██     ",
	"███████"
}

local three = {
	"███████",
	"     ██",
	"███████",
	"     ██",
	"███████"
}

local four = {
	"██   ██",
	"██   ██",
	"███████",
	"     ██",
	"     ██"
}

local five = {
	"███████",
	"██     ",
	"███████",
	"     ██",
	"███████"
}

local six = {
	"███████",
	"██     ",
	"███████",
	"██   ██",
	"███████"
}

local seven = {
	"███████",
	"     ██",
	"     ██",
	"     ██",
	"     ██"
}

local eight = {
	"███████",
	"██   ██",
	"███████",
	"██   ██",
	"███████"
}

local nine = {
	"███████",
	"██   ██",
	"███████",
	"     ██",
	"     ██"
}

local colon = {
	"    ",
	" ██ ",
	"    ",
	" ██ ",
	"    "
}

local ascii = {
	zero, one, two, three, four, five, six, seven, eight, nine
}
ascii['0'] = zero
ascii['1'] = one
ascii['2'] = two
ascii['3'] = three
ascii['4'] = four
ascii['5'] = five
ascii['6'] = six
ascii['7'] = seven
ascii['8'] = eight
ascii['9'] = nine
ascii[':'] = colon
--- This module provides utility functions to
--- manipulate strings in a way that's easy to
--- create a UI
local StringUtils = {}

--- @alias Lines string[]

--- Repeat a string n times
--- @param str string
--- @param n number
--- @return string
function StringUtils.repeating(str, n)
	local res = ""
	for i = 1, n, 1 do
		res = res..str
	end
	return res
end

--- Get the total width of a string
--- Doesn't look for new lines
--- @param lines string | Lines
--- @return number
function StringUtils.get_max_width(lines)
	local max = 0
	if type(lines) == 'string' then
		return vim.fn.strdisplaywidth(lines)
	end
	for _, line in ipairs(lines) do
		local width = vim.fn.strdisplaywidth(line)
		if width > max then
			max = width
		end
	end
	return max
end

--- Concatenates two strings vertically
--- @param lines1 Lines
--- @param lines2 Lines
--- @return Lines
function StringUtils.concat_v(lines1, lines2)
	local res = {}
	for _, line in ipairs(lines1) do
		table.insert(res, line)
	end
	for _, line in ipairs(lines2) do
		table.insert(res, line)
	end
	return res
end

--- Concatenates two boxed strings vertically
--- @param lines_1 Lines
--- @param lines_2 Lines
---@return Lines
function StringUtils.box_concat_v(lines_1, lines_2)
	if StringUtils.get_max_width(lines_1) ~= StringUtils.get_max_width(lines_2) then
		error("Cannot merge two boxes with different widths")
	end
	local width = StringUtils.get_max_width(lines_1)
	local res = {}

	local separator = "╠"..StringUtils.repeating('═', width-2).."╣"

	for i = 1, #lines_1 - 1, 1 do
		table.insert(res, lines_1[i])
	end
	table.insert(res, separator)
	for i = 2, #lines_2, 1 do
		table.insert(res, lines_2[i])
	end
	return res
end

--- Concatenates two strings horizontally
--- (ie. concatenates each line)
---@param lines1 Lines
---@param lines2 Lines?
---@param separator string?
---@return Lines
function StringUtils.concat_h(lines1, lines2, separator)
	separator = separator or " "
	local lines = {}
	for _, line in ipairs(lines1) do
		table.insert(lines, line)
	end

	if not lines2 then
		return lines
	end

	if #lines1 < #lines2 then
		for i = 1, #lines2 - #lines1, 1 do
			table.insert(lines, "")
		end
	end

	for i, line in ipairs(lines2) do
		lines[i] = lines[i]..separator..line
	end
	return lines
end

--- Concatenates two boxed strings horizontally
--- @param lines1 Lines
--- @param lines2 Lines
--- @return Lines
function StringUtils.box_concat_h(lines_1, lines_2)
	local fst_line = lines_1[1]
	fst_line = vim.fn.substitute(fst_line,'.$', '╦', '')
	lines_1[1] = fst_line

	local lst_line = lines_1[#lines_1]
	lst_line = vim.fn.substitute(lst_line,'.$', '╩', '')
	lines_1[#lines_1] = lst_line

	for i, line in ipairs(lines_2) do
		lines_2[i] = vim.fn.substitute(line, '^.', '', '')
	end

	return StringUtils.concat_h(lines_1, lines_2, '')
end

---Returns the ascii art for a given number
--- if `n` is a string the following chars can be included: 0123456789:
---@param n number | string
---@return Lines
function StringUtils.get_number(n)
	if n == 0 then
		return ascii.zero
	end

	local str = '' .. n
	local lines = nil

	for i = 1, #str, 1 do
		local c = str:sub(i, i)
		if not lines then
			lines = StringUtils.concat_h(ascii[c], nil)
		else
			lines = StringUtils.concat_h(lines, ascii[c])
		end
	end
	return lines
end

---Converts a `Lines` (array of lines) to string
---@param lines Lines
---@return string
function StringUtils.to_string(lines)
	local res = ""
	for _, value in ipairs(lines) do
		res = res..value..'\n'
	end
	return res
end

---Surrounds a `Lines` (array of lines) in a box
---@param lines Lines
---@param opts { h_padding: number?, v_padding: number? }
---@return Lines
function StringUtils.surround(lines, opts)
	opts = opts or { }
	local h_padding = opts.h_padding or 0
	local v_padding = opts.v_padding or 0

	local H = "═"
	local NW = "╔"
	local NE = "╗"
	local V = "║"
	local SW = "╚"
	local SE = "╝"

	local width = StringUtils.get_max_width(lines)

	local h_line = ""
	for i = 1, width, 1 do
		h_line = h_line..H
	end

	local v_padding_str = StringUtils.repeating(" ", width)
	local v_padding_table = {}
	for i = 0, v_padding - 1, 1 do
		table.insert(v_padding_table, v_padding_str)
	end

	local res = {}
	table.insert(res, h_line)
	res = StringUtils.concat_v(res, v_padding_table)
	res = StringUtils.concat_v(res, lines)
	res = StringUtils.concat_v(res, v_padding_table)
	table.insert(res, h_line)

	local h_padding_str = StringUtils.repeating(" ", h_padding)
	local h_padding_str_2 = StringUtils.repeating(H, h_padding)

	for i = 1, #res, 1 do
		local line = res[i]
		if #line < width then
			line = line..StringUtils.repeating(' ', width - #line)
		end
		if i == 1 then
			line = NW..h_padding_str_2..line..h_padding_str_2..NE
		elseif i == #res then
			line = SW..h_padding_str_2..line..h_padding_str_2..SE
		else
			line = V..h_padding_str..line..h_padding_str..V
		end
		res[i] = line
	end

	return res
end

---Creates a new string with the given width and `str` centered
---@param str string
---@param width number
---@return string
function StringUtils.center_str(str, width)
	if width <= #str then
		return str
	end
	local int = width - #str
	local padding = math.floor((int) / 2)
	local ws = StringUtils.repeating(" ", padding)
	if padding % 2 == 1 then
		str = " "..str
	end
	return ws..str..ws
end

---Makes all lines have the same width
---(width of the longest line)
---@param lines Lines
---@return Lines
function StringUtils.normalized(lines)
	local width = StringUtils.get_max_width(lines)
	local res = {}
	for index, line in ipairs(lines) do
		table.insert(res, line)
		local left = width - #line
		if left > 0 then
			line = line..StringUtils.repeating(' ', left)
			res[index] = line
		end
	end
	return res
end

---Split the lines into multiple columns with a max_height
---@param lines Lines
---@param opts { max_height: number?, separator?: string}
---@return Lines
function StringUtils.to_columns(lines, opts)
	opts = opts or {}
	local max_height = opts.max_height or 10
	local separator = opts.separator or " "
	local i = 1
	local row_count = 1
	local res = {}

	while i <= #lines do
		local line = lines[i]
		if i <= max_height then
			table.insert(res, lines[i])
			goto continue
		end
		res[row_count] = res[row_count] .. separator .. line
	    ::continue::
		i = i + 1
		row_count = row_count + 1
		if row_count > max_height then
			row_count = 1
			res = StringUtils.normalized(res)
		end
	end
	res = StringUtils.normalized(res)
	return res
end

---fills a table with empty lines inplace
---@param lines Lines
---@param n number
---@return Lines
function StringUtils.fill(lines, n)
	while #lines < n do
		table.insert(lines, "")
	end
	return lines
end



local function execute(command)
	local output = vim.fn.system(command)
	output = string.sub(output, 1, #output - 1)
	return output
end
local function get_sys_widget(height)
	local hostname = execute('hostname -f')
	local user = execute('whoami')
	local user_host = user..'@'..hostname
	local shell = 'Shell: '..execute('$SHELL --version')
	local term = 'Terminal: '..execute('echo $TERM_PROGRAM')
	local nvim_version = vim.version()
	nvim_version = 'NVIM: '..nvim_version.major..'.'..nvim_version.minor..'.'..nvim_version.patch
	local os_version = 'OS: '..execute([[sw_vers | head -n 2 | awk '{ print $2 }' | xargs]])

	local lines = {
		user_host,
		shell,
		term,
		nvim_version,
		os_version
	}

	-- padding needed to match target height
	local bottom_padding = height - #lines - 2

	for i = 1, bottom_padding, 1 do
		table.insert(lines, "")
	end

	local res = StringUtils.surround(lines, { h_padding = 1 })
	return res
end


local function get_time_widget()
	local h_padding = 1
	local timestr = vim.fn.strftime('%H:%M')
	local time = StringUtils.get_number(timestr)

	local clock_width = StringUtils.get_max_width(time)
	local week = "Mon Tue Wed Thu Fri Sat Sun"
	week = StringUtils.center_str(week, clock_width)

	local upper = StringUtils.concat_v({ week }, time )
	upper = StringUtils.surround(upper, { h_padding = h_padding })

	local weekday = vim.fn.strftime('%d %B %Y')
	weekday = StringUtils.center_str(weekday, clock_width)
	local lower = StringUtils.surround({ weekday }, { h_padding = h_padding })

	local res =StringUtils.box_concat_v(upper, lower)

	return res
end
return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- jank prng
		math.randomseed(os.time())

		local function pick_color()
			local colors = { "String", "Identifier", "Keyword", "Number" }
			return colors[math.random(#colors)]
		end
		-- Set header
		-- dashboard.section.header.val = {
		--
		-- 	"            :h-                                  Nhy`               ",
		-- 	"           -mh.                           h.    `Ndho               ",
		-- 	"           hmh+                          oNm.   oNdhh               ",
		-- 	"          `Nmhd`                        /NNmd  /NNhhd               ",
		-- 	"          -NNhhy                      `hMNmmm`+NNdhhh               ",
		-- 	"          .NNmhhs              ```....`..-:/./mNdhhh+               ",
		-- 	"           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
		-- 	"           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
		-- 	"      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
		-- 	" .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
		-- 	" h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
		-- 	" hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
		-- 	" /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
		-- 	"  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
		-- 	"   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
		-- 	"     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
		-- 	"       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
		-- 	"       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
		-- 	"       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
		-- 	"       //+++//++++++////+++///::--                 .::::-------::   ",
		-- 	"       :/++++///////////++++//////.                -:/:----::../-   ",
		-- 	"       -/++++//++///+//////////////               .::::---:::-.+`   ",
		-- 	"       `////////////////////////////:.            --::-----...-/    ",
		-- 	"        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
		-- 	"         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
		-- 	"           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
		-- 	"            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
		-- 	"           s-`::--:::------:////----:---.-:::...-.....`./:          ",
		-- 	"          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
		-- 	"         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
		-- 	"        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
		-- 	"                        .-:mNdhh:.......--::::-`                    ",
		-- 	"                           yNh/..------..`                          ",
		-- 	"                                                                    ",
		-- }

		dashboard.section.header.opts.hl = "Identifier"
		local neovim_logo = {
			[[ ███       ███ ]],
			[[████      ████]],
			[[██████     █████]],
			[[███████    █████]],
			[[████████   █████]],
			[[█████████  █████]],
			[[█████ ████ █████]],
			[[█████  █████████]],
			[[█████   ████████]],
			[[█████    ███████]],
			[[█████     ██████]],
			[[████      ████]],
			[[ ███       ███ ]],
			[[                  ]],
			[[ N  E  O  V  I  M ]],
		}

		local llvm_logo = {

			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠐⠒⠒⠒⠂⠀⠤⠤⠤⣄⣀⡀⠘⢆⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⡿⠋⣀⣔⣒⣉⣀⠤⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠎⠀⣀⣀⡤⠤⠤⠄⠀⠒⠒⠒⠒⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣉⣽⢾⡇⠀⠀⠀⠀⠀⢰⣿⣟⣵⣿⢿⣿⣛⣿⣿⣻⢿⣦⠤⠀⠀⠀⠀⠀⠀⠀⠠⣾⢾⣍⣁⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⡴⠶⠛⠋⠉⠁⠀⢠⡏⠀⠀⠀⠀⠰⣲⡿⡟⠋⢹⣿⠟⠛⠉⠉⠙⢻⣗⢻⣇⠀⠀⠀⠀⠀⠀⠀⠀⠈⣧⠀⠀⠉⠉⠛⠳⠶⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⢀⣤⠶⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⡾⠀⠀⠀⠀⠀⠀⠀⠁⢀⡴⠋⠀⠀⠀⠀⠀⢀⠿⣿⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡆⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠶⢦⣀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⢀⣠⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣟⣿⡟⣿⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢦⡀⠀⠀⠀",
			"⠀⠀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⣶⣿⣾⣾⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⡄⠀",
			"⠀⣼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠴⠖⠚⠛⣛⠻⢧⣤⣤⣄⣀⡠⣤⣤⣶⣶⣶⣾⣿⣿⣳⣝⣿⡿⣻⣽⢺⣿⣿⣿⣶⣶⣶⡤⣀⣤⣤⣤⠟⢛⡛⠛⠒⠶⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄",
			"⢰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠋⠀⠀⠀⠀⡴⠁⠀⠀⠀⠉⠉⠛⠛⠾⠯⣟⣻⡿⠿⣟⣯⣿⣿⣷⣿⣿⡇⡏⣻⣿⣟⡿⠯⠗⠛⠋⠉⠁⠀⠀⠀⠱⡄⠀⠀⠀⠈⠳⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧",
			"⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣾⣯⣹⣷⣝⢿⣿⣿⣻⣵⣏⣿⣧⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠸⡀⠀⠀⠀⠀⠀⠀⠀⠀⢸",
			"⢸⠀⠀⠀⠀⠀⠀⠀⠀⢀⠁⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠯⣷⣿⣿⣿⣷⣷⣿⣿⣽⣸⡯⠏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⢁⠀⠀⠀⠀⠀⠀⠀⠀⢸",
			"⢸⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡉⠩⡏⡏⣟⢿⡿⣿⣽⣇⡯⠉⡉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⢸",
			"⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⡇⣿⣷⣿⣿⢿⠏⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸",
			"⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⢶⣶⢄⠀⠀⢠⣾⢻⣿⣽⣯⣿⣸⣸⣿⣆⠀⠀⣠⢴⣶⢶⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆",
			"⠀⢁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⣾⣯⣿⢸⣷⣄⣴⣯⡺⣝⡿⡿⣿⣽⡿⣻⣶⢀⣾⣧⢿⡞⣿⣽⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠁",
			"⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠟⠈⠇⠀⠙⢿⣯⠟⠀⢏⣿⣿⣿⡟⣇⠹⢿⣿⠟⠁⠸⠃⠸⠃⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀",
			"⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠘⣼⣽⣿⣦⣿⠀⠈⠀⠀⠀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⣟⣿⣯⡼⡧⣴⣶⣿⠿⠿⠿⠿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡜⡿⡿⣫⣻⡝⠒⠉⠉⠈⠈⠉⠉⠘⠙⢿⣿⣏⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⢿⠟⠘⣿⣿⣗⣻⣦⡀⠀⠀⠀⠀⠀⠀⠀⢸⣿⢧⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠲⣤⣀⣀⣀⣀⣀⣠⣤⣶⣾⡿⠿⠛⠉⠀⠀⠀⠀⠀⢺⣿⣷⣝⢿⣶⣄⣀⡀⠀⠠⢴⣿⣽⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠛⠋⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⢿⣶⣝⡿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠛⠋⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⢿⣶⣝⡿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀        V⠀I⠀M   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		}

		local saturn_logo = {
			[[                                                ]],
			[[                                          _.oo. ]],
			[[                  _.u[[/;:,.         .odMMMMMM' ]],
			[[               .o888UU[[[/;:-.  .o@P^    MMM^   ]],
			[[              oN88888UU[[[/;::-.        dP^     ]],
			[[             dNMMNN888UU[[[/;:--.   .o@P^       ]],
			[[            ,MMMMMMN888UU[[/;::-. o@^           ]],
			[[            NNMMMNN888UU[[[/~.o@P^              ]],
			[[            888888888UU[[[/o@^-..               ]],
			[[           oI8888UU[[[/o@P^:--..                ]],
			[[        .@^  YUU[[[/o@^;::---..                 ]],
			[[      oMP     ^/o@P^;:::---..                   ]],
			[[   .dMMM    .o@^ ^;::---...                     ]],
			[[  dMMMMMMM@^`       `^^^^                       ]],
			[[ YMMMUP^                                        ]],
			[[  ^^                                            ]],
			[[                                                ]],
		}

		local earth_logo = {
			[[                                ]],
			[[             ,,,,,,             ]],
			[[         o#'9MMHb':'-,o,        ]],
			[[      .oH":HH$' "' ' -*R&o,     ]],
			[[     dMMM*""'`'      .oM"HM?.   ]],
			[[   ,MMM'          "HLbd< ?&H\   ]],
			[[  .:MH ."\          ` MM  MM&b  ]],
			[[ . "*H    -        &MMMMMMMMMH: ]],
			[[ .    dboo        MMMMMMMMMMMM. ]],
			[[ .   dMMMMMMb      *MMMMMMMMMP. ]],
			[[ .    MMMMMMMP        *MMMMMP . ]],
			[[      `#MMMMM           MM6P ,  ]],
			[[  '    `MMMP"           HM*`,   ]],
			[[   '    :MM             .- ,    ]],
			[[    '.   `#?..  .       ..'     ]],
			[[       -.   .         .-        ]],
			[[         ''-.oo,oo.-''          ]],
			[[                                ]],
		}

		local vim_logo = {
			[[     ##############..... ##############   ]],
			[[     ##############......##############   ]],
			[[       ##########..........##########     ]],
			[[       ##########........##########       ]],
			[[       ##########.......##########        ]],
			[[       ##########.....##########..        ]],
			[[       ##########....##########.....      ]],
			[[     ..##########..##########.........    ]],
			[[   ....##########.#########.............  ]],
			[[     ..################JJJ............    ]],
			[[       ################.............      ]],
			[[       ##############.JJJ.JJJJJJJJJJ      ]],
			[[       ############...JJ...JJ..JJ  JJ     ]],
			[[       ##########....JJ...JJ..JJ  JJ      ]],
			[[       ########......JJJ..JJJ JJJ JJJ     ]],
			[[       ######    .........                ]],
			[[                   .....                  ]],
			[[                     .                    ]],
		}

		local logo = saturn_logo
		dashboard.section.header.val = logo
		dashboard.section.header.opts.hl = "Constant"
		-- no Idea how it works exaclty, try n error with distinguishable colors lol
		--
		dashboard.section.footer.val = {
			"The computing scientist's main challenge is not to",
			"get confused by the complexities of his own making.",
			"                                                   ",
			"                                   - E. W. Dijkstra",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			--dashboard.button( "a", "󱙺  > Jarvis" , ":enew | :ChatGPT<CR>"),
			-- dashboard.button("t", "󰙅  > File tree", ":Telescope file_browser<CR>"),
			--
			--
			dashboard.button("p", "  > Projects", function()
				require("telescope").extensions.projects.projects({})
			end),
			dashboard.button("f", "󰛔  > Find File", ":Telescope find_files<CR>"),

			dashboard.button("o", "  > Recent Files (CWD)", function()
				require("telescope.builtin").oldfiles({ only_cwd = true })
			end),
			dashboard.button("O", "  > Recent Files (ALL)", function()
				require("telescope.builtin").oldfiles({ only_cwd = false })
			end),
			dashboard.button("s", "  > Configuration", ":cd ~/.config/nvim/ | :e .<CR> | :Telescope find_files<CR>"),
			--			dashboard.button("c", "󰔎  > Color scheme", ":Telescope colorscheme<CR>"),
			-- dashboard.button("l", "  > Plugins", ":Lazy<CR>"),
			--			dashboard.button("q", "󰗼  > Exit", ":qa<CR>"),
		}
		local function footer()
			local newline = "  \n"
			--local total_plugins = #vim.tbl_keys(packer_plugins)
			local date = os.date(" %m-%d-%Y")
			local time = os.date(" %H:%M:%S")
			-- local cwd = " " .. vim.fn.getcwd()

			local version = vim.version()
			local nvim_version_info = " Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch

			function get_proejct_text()
				local current_project = require("project_nvim").get_current_project()
				current_project = current_project or "No Active Project"
				return " " .. current_project
			end
			local current_project = require("project_nvim").get_current_project()
			current_project = current_project or "No Active Project"
			local project_text = " " .. current_project
			local quote = "\n"
				.. "The computing scientist's main challenge is not to \n"
				.. "get confused by the complexities of his own making.\n"
				.. "                                                   \n"
				.. "                                   - E. W. Dijkstra\n"

            local time_widget = get_time_widget()
            -- for i, line in ipairs(time_widget) do
            --     print(line)
            -- end

            return time_widget

			-- return {
			-- 	"It seemed unthinkable for me to leave the world   ",
			-- 	"forever before I had produced all that I felt called",
			-- 	"upon to produce",
			-- 	"                                                   ",
			-- 	"                             - Ludwig van Beethoven",
			-- 	-- "The computing scientist's main challenge is not to",
			-- 	-- "get confused by the complexities of his own making.",
			-- 	-- "                                                   ",
			-- 	-- "                                   - E. W. Dijkstra",
			-- 	-- date,
			-- 	time,
			-- 	"                                                   ",
			-- 	cwd,
			-- 	get_proejct_text(),
			-- }
			--return newline .. newline.. quote .. date .. newline .. time .. newline ..project_text
		end

		dashboard.section.footer.val = footer
		dashboard.section.footer.opts.position = "center"
		dashboard.section.footer.opts.hl = "String"
		-- Send config to alpha
		alpha.setup(dashboard.opts)


		-- Disable folding on alpha buffer
		vim.cmd([[
            
            let g:alpha_timer_id = -1

            augroup alpha_autocmds
              autocmd!
              autocmd FileType alpha setlocal nofoldenable
              autocmd User AlphaReady let g:alpha_timer_id = timer_start(1000, {-> execute('AlphaRedraw')}, {'repeat': -1})
              autocmd User AlphaClosed if g:alpha_timer_id != -1 | call timer_stop(g:alpha_timer_id) | let g:alpha_timer_id = -1 | endif
            augroup END
        ]])

		--require'alpha'.setup(require'alpha.themes.dashboard'.config)
	end,
}
