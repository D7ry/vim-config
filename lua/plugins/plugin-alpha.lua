-- vim.api.nvim_exec(autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Alpha | endif)

local StringUtils = require("plugins.utils.string_utils")

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

function transform_logo(logo, delta_time)
	local max_length = 5

	local transformed_logo = {}
	for i, line in ipairs(logo) do
		local shift = math.floor(max_length * (1 + math.cos(i + delta_time)) / 2)
		local transformed_line = string.rep(" ", shift) .. line
		table.insert(transformed_logo, transformed_line)
	end

	return transformed_logo
end

local function execute(command)
	local output = vim.fn.system(command)
	output = string.sub(output, 1, #output - 1)
	return output
end

local function get_sys_widget(height)
	local hostname = execute("hostname -f")
	local user = execute("whoami")
	local user_host = user .. "@" .. hostname
	local shell = "Shell: " .. execute("$SHELL --version")
	local term = "Terminal: " .. execute("echo $TERM_PROGRAM")
	local nvim_version = vim.version()
	nvim_version = "NVIM: " .. nvim_version.major .. "." .. nvim_version.minor .. "." .. nvim_version.patch
	local os_version = "OS: " .. execute([[sw_vers | head -n 2 | awk '{ print $2 }' | xargs]])

	local lines = {
		user_host,
		shell,
		term,
		nvim_version,
		os_version,
	}

	-- padding needed to match target height
	local bottom_padding = height - #lines - 2

	for i = 1, bottom_padding, 1 do
		table.insert(lines, "")
	end

	local res = StringUtils.surround(lines, { h_padding = 1 })
	return res
end

local function get_os_logo_char()
	local ret = nil
	local os_info = vim.loop.os_uname()
	if os_info.sysname == "Windows_NT" then
		ret = ""
	elseif os_info.sysname == "Darwin" then
		ret = ""
	elseif os_info.sysname == "Linux" then
		ret = ""
		--ret = "🐧"
	end
	return ret
end

local user_host = nil -- no real need to recalculate this every time
local function get_user_host()
	if user_host then
		return user_host
	end
	local hostname = execute("hostname -f")
	local user = execute("whoami")
	local user_host = user .. "@" .. hostname
	local os_logo = get_os_logo_char()
	user_host = os_logo .. " " .. user_host
	return user_host
end

local function get_header()
	-- local logo_transformed = transform_logo(vim_logo, os.clock())
	-- table.insert(logo_transformed, StringUtils.center_str(get_user_host(), StringUtils.get_max_width(logo_transformed)))
	--
	local logo = {}
	for key, value in pairs(llvm_logo) do
		table.insert(logo, value)
	end
	local time = os.date(" %H:%M:%S")
	local logo_width = StringUtils.get_max_width(logo)
	time = StringUtils.center_str(time, logo_width)

	table.insert(logo, StringUtils.center_str(get_user_host(), logo_width))
	table.insert(logo, time)

	return logo
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

		dashboard.section.header.val = get_header
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
			--dashboard.button("p", "  > Projects", function()
			--require("telescope").extensions.workspaces.workspaces({})
			--end),
			dashboard.button("f", "󰛔  > Find File", ":Telescope find_files<CR>"),

			dashboard.button("o", "  > Recent Files (CWD)", function()
				require("telescope.builtin").oldfiles({ only_cwd = true })
			end),
			dashboard.button("O", "  > Recent Files (ALL)", function()
				require("telescope.builtin").oldfiles({ only_cwd = false })
			end),
			dashboard.button("s", "  > Configuration", ":cd ~/.config/nvim/ | :e .<CR> | :Telescope find_files<CR>"),

			dashboard.button("q", "󰈆  > Quit", ":q<CR>"),
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

			-- function get_project_text()
			-- 	local current_project = require("project_nvim").get_current_project()
			-- 	current_project = current_project or "No Active Project"
			-- 	return " " .. current_project
			-- end

			local cwd = " " .. vim.fn.getcwd()

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
			--
			-- 	"                                                   ",
			-- 	time,
			--              cwd,
			-- 	get_project_text(),
			--              get_user_host(),
			-- }

			local box_content = {
				--get_project_text(),
				--cwd,
				nvim_version_info,
			}

			local quote = {
				"It seemed unthinkable for me to leave the world   ",
				"forever before I had produced all that I felt called",
				"upon to produce",
				"                                                   ",
				"                             - Ludwig van Beethoven",
				"                                                   ",
			}

			local quote_width = StringUtils.get_max_width(quote)
			-- merge quote and box_content
			for i = 1, #box_content do
				table.insert(quote, box_content[i])
			end

			return quote
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


