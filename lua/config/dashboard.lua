local M = {}

function M.setup() 
    db = require("dashboard")
      db.setup({
        theme = 'hyper',
        config = {
          footer = {'', '"By breaking through the foul and ugly mists', 'Of vapors that did seem to strangle him."'},
          week_header = {
           enable = true,
          },
          shortcut = {
            { desc = '󰊳 Sync', group = '@property', action = 'Lazy sync', key = 'u' },
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
