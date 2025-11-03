return {
   -- disable notification
   { 'nvim-notify',                    enabled = false },

   -- from example
   -- change trouble config
   {
      "folke/trouble.nvim",
      -- opts will be merged with the parent spec
      opts = { use_diagnostic_signs = true },
   },

   -- disable trouble
   { "folke/trouble.nvim", enabled = false },

   -- override nvim-cmp and add cmp-emoji
   {
      "hrsh7th/nvim-cmp",
      enabled = false,
      dependencies = { "hrsh7th/cmp-emoji" },
      ---@param opts cmp.ConfigSchema
      opts = function(_, opts)
         table.insert(opts.sources, { name = "emoji" })
      end,
   },
   -- end


   -- auto-save
   {
      "Pocco81/auto-save.nvim",
      config = function()
         require("auto-save").setup {
            execution_message = {
               message = function() return "" end, -- disables the notification
               dim = 0,
               cleaning_interval = 0,
            },
         }
      end,
   },

   -- handle trailing whitespace
   {
      'ntpeters/vim-better-whitespace',
      config = function ()
         vim.g.better_whitespace_enabled = 1
         -- vim.g.strip_whitespace_on_save = 1
         -- vim.g.strip_whitespace_confirm = 0
         -- vim.g.strip_only_modified_lines = 1
      end
   },

   -- research how to use
   { 'mg979/vim-visual-multi' },

   -- use for git,hub
   { 'tpope/vim-fugitive',             enabled = false },
   { 'tpope/vim-rhubarb',              enabled = false },
   { 'f-person/git-blame.nvim' }, -- display the commit author

   -- handle surround like XML tags, parentheses, brackets, quotes,...
   { 'tpope/vim-surround' },

   -- learn to use!
   { 'tpope/vim-dispatch', },

}
