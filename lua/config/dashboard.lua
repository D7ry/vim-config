local M = {}

function M.setup() 
    db = require("dashboard")
      db.setup({
        theme = 'hyper',
        config = {
          footer = {'', '"to see the world as it is, and to love it"', '--Romain Rolland'},
          week_header = {
           enable = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'PackerSync', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' Marks',
              group = 'Number',
              action = 'Telescope marks',
              key = 'd',
            },
          },
        },
      })
    end
return M
