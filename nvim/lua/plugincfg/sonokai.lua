local M = {}

M.config = function()
  vim.g.sonokai_better_performance = 1
  vim.g.sonokai_diagnostic_text_highlight = 1
  vim.g.sonokai_diagnostic_virtual_text = "colored"
  vim.g.sonokai_disable_terminal_colors = 1
  vim.g.sonokai_enable_italic = 1
  vim.g.sonokai_show_eob = 0

  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("Sonokai", { clear = true }),
    pattern = "sonokai",
    callback = function()
      vim.api.nvim_set_hl(0, "TSParameter", { link = "OrangeItalic", default = false })
      vim.api.nvim_set_hl(0, "TSParameterReference", { link = "OrangeItalic", default = false })
      vim.api.nvim_set_hl(0, "NoicePopupmenuMatch", { link = "CmpItemAbbrMatch", default = false })
      vim.cmd([[
        hi! link @lsp.type.class         TSClass
        hi! link @lsp.type.comment       TSComment
        hi! link @lsp.type.decorator     TSFunction
        hi! link @lsp.type.enum          TSType
        hi! link @lsp.type.enumMember    TSConstMacro
        hi! link @lsp.type.events        TSLabel
        hi! link @lsp.type.function      TSFunction
        hi! link @lsp.type.interface     TSType
        hi! link @lsp.type.keyword       TSKeyword
        hi! link @lsp.type.macro         TSConstMacro
        hi! link @lsp.type.method        TSMethod
        hi! link @lsp.type.modifier      TSTypeQualifier
        hi! link @lsp.type.namespace     TSNamespace
        hi! link @lsp.type.number        TSNumber
        hi! link @lsp.type.operator      TSOperator
        hi! link @lsp.type.parameter     TSParameter
        hi! link @lsp.type.property      TSProperty
        hi! link @lsp.type.regexp        TSStringRegex
        hi! link @lsp.type.string        TSString
        hi! link @lsp.type.struct        TSType
        hi! link @lsp.type.type          TSType
        hi! link @lsp.type.typeParameter TSTypeDefinition
        hi! link @lsp.type.variable      TSVariable
      ]])
    end,
  })
  vim.cmd.colors("sonokai")
end

return M
