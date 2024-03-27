
local StringUtils = require('plugins.utils.string_utils')

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

		-- dashboard.section.header.opts.hl = "Identifier"
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
		dashboard.section.header.val = get_time_widget
		-- dashboard.section.header.opts.hl = "Constant"
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
