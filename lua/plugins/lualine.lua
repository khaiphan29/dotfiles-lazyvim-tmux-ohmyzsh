return {
   "nvim-lualine/lualine.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      require("lualine").setup( {
         options = {
            icons_enabled = true,
            -- theme = 'catppuccin',
            theme = 'catppuccin',
            component_separators = { left = '|', right = '|'},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
               statusline = {},
               winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = true,
            refresh = {
               statusline = 1000,
               tabline = 1000,
               winbar = 1000,
            }
         },
         sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {
               function()
                  -- local filepath = vim.fn.expand('%:p')  -- Get the absolute path of the current file
                  local cwd = vim.fn.getcwd() -- Get the current working directory
                  local home = vim.fn.expand('~') -- Get the home directory path
                  local path = cwd:gsub('^' .. home, '~') -- Replace home directory with '~'
                  return ' ' .. path -- Prepend folder icon
               end,
               -- "filename",
               -- path = 1,
               -- icon = '',  -- Optional: file icon
            },
            lualine_x = {
               {
                  require("noice").api.status.command.get,
                  cond = require("noice").api.status.command.has,
                  -- color = { fg = "#ff9e64" },
               },
               'encoding', 'fileformat',
            },
            lualine_y = {{
               require("noice").api.status.search.get,
               cond = require("noice").api.status.search.has,
               -- color = { fg = "#ff9e64" },
            },
               "filetype"
            },
            lualine_z = {'progress', 'location'}
         },
         inactive_sections = nil,
         tabline = {
            lualine_a = {
               { 'buffers', component_separators = { left = '|', right = '|' }, section_separators = { left = '', right = '' } },
            },
            lualine_b = {'tabs'}
         },
         winbar = {
            lualine_a = {
               {
                  'filename',
                  path = 1,
               }
            }, -- Show filename at the top of each window
         },
         inactive_winbar = {
            lualine_a = {
               {
                  'filename',
                  path = 1,
               }
            }, -- Show filename at the top of each window
         },
         extensions = {}
      })
   end,
}
