local M = {}

function M.setup()
    ts = require("telescope")
    ts.setup{ 
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case"
            }
        }
    }
    ts.load_extension('fzf')
    ts.load_extension('notify')
end


return M


