--[[
MIT License

Copyright (c) 2020 hoob3rt
Copyright (c) 2025 registerGen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]--

-- This is almost a copy-paste from
-- https://github.com/nvim-lualine/lualine.nvim/tree/master/lua/lualine/components/diagnostics

local api = vim.api
local lualine_require = require("lualine_require")
local modules = lualine_require.lazy_require {
  highlight = "lualine.highlight",
  utils = "lualine.utils.utils",
}
local icons = require("icons")

local M = lualine_require.require("lualine.component"):extend()

local diagnostics_colors = {
  error = { fg = modules.utils.extract_highlight_colors("DiagnosticError", "fg") },
  warn = { fg = modules.utils.extract_highlight_colors("DiagnosticWarn", "fg") },
  info = { fg = modules.utils.extract_highlight_colors("DiagnosticInfo", "fg") },
  hint = { fg = modules.utils.extract_highlight_colors("DiagnosticHint", "fg") },
  ok = { fg = modules.utils.extract_highlight_colors("DiagnosticOk", "fg") },
}
local diagnostics_symbols = icons.diagnostic
local highlight_groups

function M:init(options)
  M.super.init(self, options)

  highlight_groups = {
    error = self:create_hl(diagnostics_colors.error, "error"),
    warn = self:create_hl(diagnostics_colors.warn, "warn"),
    info = self:create_hl(diagnostics_colors.info, "info"),
    hint = self:create_hl(diagnostics_colors.hint, "hint"),
    ok = self:create_hl(diagnostics_colors.ok, "ok"),
  }

  self.last_diagnostics_count = {}
end

function M:update_status()
  local bufnr = api.nvim_get_current_buf()
  local diagnostics_count
  local result = {}

  if api.nvim_get_mode().mode:sub(1, 1) ~= "i" then
    local count = vim.diagnostic.count(0)
    diagnostics_count = {
      error = count[vim.diagnostic.severity.ERROR] or 0,
      warn = count[vim.diagnostic.severity.WARN] or 0,
      info = count[vim.diagnostic.severity.INFO] or 0,
      hint = count[vim.diagnostic.severity.HINT] or 0,
    }
    self.last_diagnostics_count[bufnr] = diagnostics_count
  else
    diagnostics_count = self.last_diagnostics_count[bufnr] or { error = 0, warn = 0, info = 0, hint = 0 }
  end

  local colors, bgs = {}, {}
  for name, hl in pairs(highlight_groups) do
    colors[name] = self:format_hl(hl)
    bgs[name] = modules.utils.extract_highlight_colors(colors[name]:match("%%#(.-)#"), "bg")
  end

  if diagnostics_count.error + diagnostics_count.warn + diagnostics_count.info + diagnostics_count.hint == 0 then
    return colors.ok .. diagnostics_symbols.ok
  end

  local previous_section, padding
  for _, section in ipairs({ "error", "warn", "info", "hint" }) do
    if diagnostics_count[section] and diagnostics_count[section] > 0 then
      padding = previous_section and (bgs[previous_section] ~= bgs[section]) and " " or ""
      previous_section = section
      table.insert(result, colors[section] .. padding .. diagnostics_symbols[section] .. diagnostics_count[section])
    end
  end

  return table.concat(result, " ")
end

return M
