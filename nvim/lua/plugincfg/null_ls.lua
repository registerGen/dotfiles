local M = {}

M.config = function()
  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.code_actions.gitsigns.with({
        condition = function(_)
          local bufname = vim.api.nvim_buf_get_name(0)
          local exclude_dirs = {}
          if vim.fn.isdirectory(bufname .. "/.git") == 1 then
            return not vim.tbl_contains(exclude_dirs, bufname)
          end
          for dir in vim.fs.parents(bufname) do
            if vim.fn.isdirectory(dir .. "/.git") == 1 then
              return not vim.tbl_contains(exclude_dirs, dir)
            end
          end
          return false
        end,
      }),
      null_ls.builtins.diagnostics.zsh,
    },
  })
end

return M
