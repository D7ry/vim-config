local M = {}

function M.setup()
    ts = require("telescope")
    ts.setup{
        defaults = {
            prompt_prefix = "🔭 ",
            layout_strategy = "flex",
            layout_config = {
                height = 0.8,
                width = 0.75,
                horizontal = {
                    preview_width = 0.6,
                    mirror = false,
                    prompt_position = "top",
                },
                vertical = {
                    mirror = false,
                }
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
        },
        pickers = {
            colorscheme = {
                enable_preview = true
            }
        }
    }
    ts.load_extension('fzf')
    ts.load_extension('notify')
end


return M


