return {
   -- add more treesitter parsers
   {
      "nvim-treesitter/nvim-treesitter",
      dependencies = { "RRethy/nvim-treesitter-endwise" },
      opts = {
         endwise = { enable = true },
         indent = { enable = true, disable = { "yaml", "ruby" } },
         ensure_installed = {
            "bash",
            "go",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "ruby",
            "tsx",
            "typescript",
            "vim",
            "yaml",
         },
      },
   },

   -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
   -- would overwrite `ensure_installed` with the new value.
   -- If you'd rather extend the default config, use the code below instead:
   {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
         -- add tsx and treesitter
         vim.list_extend(opts.ensure_installed, {
            "tsx",
            "typescript",
         })
      end,
   },

   -- General
   -- Use for quickly test on multiple language [https://github.com/vim-test/vim-test]
   { 'vim-test/vim-test' },

   -- Rails plugins
   { 'tpope/vim-rails' },

   -- Haml, Sass, SCSS
   { 'tpope/vim-haml' }
}
