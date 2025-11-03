return {
   {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
         "MunifTanjim/nui.nvim",
         -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
      },
      opts = function(_, opts)
         -- opts.renderer = {
         --    add_trailing = false,
         --    group_empty = false,
         --    highlight_git = false,
         --    full_name = false,
         --    highlight_opened_files = 'none',
         --    root_folder_modifier = ':-',
         --    indent_markers = {
         --       enable = true,
         --       icons = {
         --          corner = '└ ',
         --          edge = '│ ',
         --          item = ' ├ ',
         --          none = ' '
         --       },
         --    },
         -- }
         opts.renderers = {
            directory = {
               { "indent" },
               {
                  "icon",
                  default = "", -- Small right arrow
                  folder_closed = "", -- Right arrow
                  folder_open = "", -- Down arrow
                  highlight = "NeoTreeIndentMarker",
               },
               {
                  "icon",
                  folder_closed = "", -- Default folder icon (closed)
                  folder_open = "",   -- Default folder icon (open)
                  default = "",       -- Fallback
               },

               { "name" },
            },
            file = {
               { "indent" },
               { "icon" },
               { "name" },
            },
         }
         opts.default_component_configs = {
            -- indent = {
            --    with_marker = true,
            --    marker = " ", -- Change this to one of the options above
            -- },
         }
         opts.window = {
            -- Adjust this value to add more space between lines
            line_spacing = 4,  -- Default is 0; Increase to add spacing
            border = { "", "", "", "┃┃" }, -- Only right border
         }
         -- vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#0D1117" }) -- Change to your preferred color
         -- vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#8A8A8A" }) -- Adjust the color as needed

         -- Set the folder icon color to blue
         vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#4A90E2" }) -- Adjust blue shade as needed
      end,
   }
}

