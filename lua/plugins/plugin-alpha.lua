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

		local logo = vim_logo
		dashboard.section.header.val = logo
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

			return {
				"It seemed unthinkable for me to leave the world   ",
				"forever before I had produced all that I felt called",
				"upon to produce",
				"                                                   ",
				"                             - Ludwig van Beethoven",
				-- "The computing scientist's main challenge is not to",
				-- "get confused by the complexities of his own making.",
				-- "                                                   ",
				-- "                                   - E. W. Dijkstra",
				date,
				time,
				get_proejct_text(),
			}
			--return newline .. newline.. quote .. date .. newline .. time .. newline ..project_text
		end

		dashboard.section.footer.val = footer()
		dashboard.section.footer.opts.position = "center"
		dashboard.section.footer.opts.hl = "String"
		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
		--require'alpha'.setup(require'alpha.themes.dashboard'.config)
	end,
}
