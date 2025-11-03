return {
   {
      'arzg/vim-colors-xcode',
      name = 'xcode',
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
         vim.cmd('colorscheme xcodedarkhc')
      end,
   },
   {
      'projekt0n/github-nvim-theme',
      name = 'github-theme',
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
         require('github-theme').setup({
            -- ...
         })

         -- vim.cmd('colorscheme github_dark_default')
      end,
   },
   {
      "catppuccin/nvim",
      lazy = false,
      name = "catppuccin",
      priority = 1000,
      opts = {
         flavour = "mocha",
         color_overrides = {
            mocha = {
               base = "#000000",
               mantle = "#000000",
               crust = "#000000",
               bg = "#000000",       -- Add this
               surface0 = "#000000", -- Add this
            },
         },
         integrations = {
            aerial = true,
            alpha = true,
            cmp = true,
            dashboard = true,
            flash = true,
            grug_far = true,
            gitsigns = true,
            headlines = true,
            illuminate = true,
            indent_blankline = { enabled = true },
            leap = true,
            lsp_trouble = true,
            mason = true,
            markdown = true,
            mini = true,
            native_lsp = {
               enabled = true,
               underlines = {
                  errors = { "undercurl" },
                  hints = { "undercurl" },
                  warnings = { "undercurl" },
                  information = { "undercurl" },
               },
            },
            navic = { enabled = true, custom_bg = "lualine" },
            neotest = true,
            neotree = true,
            noice = true,
            notify = true,
            semantic_tokens = true,
            telescope = true,
            treesitter = true,
            treesitter_context = true,
            which_key = true,
         },
      },
      config = function()
         -- vim.cmd("colorscheme catppuccin")
      end,
   }
}
