return {
   {
      'github/copilot.vim',
   },
   -- {
   --    "zbirenbaum/copilot.lua",
   --    cmd = "Copilot",
   --    event = "InsertEnter",
   --    config = function()
   --       require("copilot").setup({})
   --    end,
   -- },
   {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
         -- { "zbirenbaum/copilot.lua" },
         { 'github/copilot.vim' },
         { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
      },
      build = "make tiktoken", -- Only on MacOS or Linux
      opts = {
         -- See Configuration section for options
         require('fzf-lua').register_ui_select()
      },
      -- See Commands section for default commands if you want to lazy load on them
   },
}
