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
          }
--          shortcut = {
--        
--            {
--              icon = ' ',
--              icon_hl = '@variable',
--              desc = 'Files',
--              group = 'Label',
--              key = 'ff',
--            },
--            {
--              desc = ' Apps',
--              group = 'DiagnosticHint',
--              key = '',
--            },
--            {
--              desc = ' Marks',
--              group = 'Number',
--              key = '',
--            },
--          },
        },
      })
    end
return M
