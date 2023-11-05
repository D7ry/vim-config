local M = {}

function M.setup()
    ts = require("telescope")
    ts.setup{
        defaults = {
            layout_strategy = "horizontal",
            layout_config = {
                height = 0.8,
                width = 0.9
            },
            mappings = {
                i = {
                    ["<esc>"] = require("telescope.actions").close
                }
            }
        },
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


