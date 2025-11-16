return {
   {
      "nvim-treesitter/nvim-treesitter",
      init = function()
         local group = vim.api.nvim_create_augroup("sql_syntax_adjustments", { clear = true })

         local function add_exec_highlights(bufnr)
            if not vim.api.nvim_buf_is_valid(bufnr) then
               return
            end

            local ok, applied = pcall(vim.api.nvim_buf_get_var, bufnr, "sql_exec_highlights_applied")
            if ok and applied then
               return
            end
            vim.api.nvim_buf_set_var(bufnr, "sql_exec_highlights_applied", true)

            -- Run syntax commands within the buffer context
            vim.api.nvim_buf_call(bufnr, function()
               local cmd = [=[
            " Keywords: EXEC/EXECUTE
            syntax keyword sqlExecKeyword EXEC EXECUTE
            highlight def link sqlExecKeyword Keyword

            " Procedure/object name after EXEC (supports [schema].[proc])
            " Use \< for start-of-word; very-magic (\v) for readability.
            syntax match sqlExecProcedure /\v\<(EXEC|EXECUTE)\s+\zs(\[[^]]+\]|[A-Za-z_]\w*)(\.(\[[^]]+\]|[A-Za-z_]\w*))*/
            highlight def link sqlExecProcedure Function

            " Parameter names like @param
            syntax match sqlExecParamName /@\h\w*/
            highlight def link sqlExecParamName Identifier

            " Parameter values: N'string', numbers, hex, NULL (very-magic)
            syntax match sqlExecParamValue /\v=\s*\zs(N?'([^']|'')*'|[-+]?\d+(\.\d+)?|1x\x+|NULL)/
            highlight def link sqlExecParamValue Constant
            ]=]

               -- Protect against any future typo in the syntax block
               pcall(vim.cmd, cmd)
            end)
         end

         vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
            group = group,
            pattern = { "*.sql", "*.tsql" },
            callback = function(event)
               -- Defer so we run after filetype/syntax detection
               vim.schedule(function()
                  add_exec_highlights(event.buf)
               end)
            end,
         })
      end,
   },
}
