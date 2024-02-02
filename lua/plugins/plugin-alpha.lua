return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		-- Set header
		dashboard.section.header.val = {
			"            :h-                                  Nhy`               ",
			"           -mh.                           h.    `Ndho               ",
			"           hmh+                          oNm.   oNdhh               ",
			"          `Nmhd`                        /NNmd  /NNhhd               ",
			"          -NNhhy                      `hMNmmm`+NNdhhh               ",
			"          .NNmhhs              ```....`..-:/./mNdhhh+               ",
			"           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
			"           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
			"      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
			" .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
			" h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
			" hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
			" /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
			"  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
			"   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
			"     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
			"       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
			"       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
			"       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
			"       //+++//++++++////+++///::--                 .::::-------::   ",
			"       :/++++///////////++++//////.                -:/:----::../-   ",
			"       -/++++//++///+//////////////               .::::---:::-.+`   ",
			"       `////////////////////////////:.            --::-----...-/    ",
			"        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
			"         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
			"           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
			"            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
			"           s-`::--:::------:////----:---.-:::...-.....`./:          ",
			"          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
			"         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
			"        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
			"                        .-:mNdhh:.......--::::-`                    ",
			"                           yNh/..------..`                          ",
			"                                                                    ",
		}

		dashboard.section.footer.val = {
			"The computing scientist's main challenge is not to",
            "get confused by the complexities of his own making.",
            "                                                   ",
            "                                   - E. W. Dijkstra",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			--dashboard.button( "a", "󱙺  > Jarvis" , ":enew | :ChatGPT<CR>"),
			dashboard.button("t", "󰙅  > File tree", ":NvimTreeToggle<cr>"),
			dashboard.button("f", "󰛔  > Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("s", "  > Configuration", ":cd ~/.config/nvim/ | :e .<CR>"),
			dashboard.button("c", "󰔎  > Color scheme", ":Telescope colorscheme<CR>"),
			dashboard.button("p", "  > Plugins", ":Lazy<CR>"),
			dashboard.button("q", "󰗼  > Exit", ":qa<CR>"),
		}
		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
		--require'alpha'.setup(require'alpha.themes.dashboard'.config)
	end,
}
