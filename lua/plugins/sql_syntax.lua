return {
   {
      "nvim-treesitter/nvim-treesitter",
      init = function()
         local group = vim.api.nvim_create_augroup("sql_syntax_adjustments", { clear = true })
         
         local function add_exec_highlights(bufnr)
            if not vim.api.nvim_buf_is_valid(bufnr) then
               return
            end
            
            -- Avoid reapplying on the same buffer
            local ok, applied = pcall(vim.api.nvim_buf_get_var, bufnr, "sql_exec_highlights_applied")
            if ok and applied then
               return
            end
            vim.api.nvim_buf_set_var(bufnr, "sql_exec_highlights_applied", true)
            
            -- Run syntax commands within the buffer's context
            vim.api.nvim_buf_call(bufnr, function()
               -- Use a leveled long string so patterns like ]] inside regex don't close the Lua string
               local cmd = [=[
            " -------------------------------
            " T-SQL extras over generic SQL
            " -------------------------------

            " Keywords: EXEC/EXECUTE
            syntax keyword sqlExecKeyword EXEC EXECUTE
            highlight def link sqlExecKeyword Keyword

            " Procedure/object after EXEC (supports [schema].[proc] and dotted chains)
            " Use \< for start-of-word; very-magic (\v) for readability.
            syntax match sqlExecProcedure /\v\<(EXEC|EXECUTE)\s+\zs(\[[^]]+\]|[A-Za-z_]\w*)(\.(\[[^]]+\]|[A-Za-z_]\w*))*/
            highlight def link sqlExecProcedure Function

            " Parameter names like @param
            syntax match sqlExecParamName /@\h\w*/
            highlight def link sqlExecParamName Identifier

            " GENERAL T-SQL STRING LITERALS (global, multi-line)
            " Supports N'...' and escaped single quotes with doubled ''.
            syntax region tsqlString start=/\vN?'/ skip=/''/ end=/'/ keepend
            highlight def link tsqlString String

            " Values after '=' that are not strings (numbers, hex, NULL)
            syntax match tsqlEqualsValue /\v=\s*\zs([-+]?\d+(\.\d+)?|0x\x+|NULL)\b/
            highlight def link tsqlEqualsValue Constant
          ]=]
               
               -- Protect against any future typo in the syntax block so opening files won't error
               pcall(vim.cmd, cmd)
            end)
         end
         
         -- Apply to SQL/T-SQL buffers after filetype/syntax is set
         vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
            group = group,
            pattern = { "*.sql", "*.tsql" },
            callback = function(event)
               vim.schedule(function()
                  add_exec_highlights(event.buf)
               end)
            end,
         })
      end,
   },
}
