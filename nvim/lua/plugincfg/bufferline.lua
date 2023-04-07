local M = {}

local icons = require 'icons'

local function derive_colors()
  local colors = require 'bufferline.colors'
  local hex = colors.get_color
  local shade = colors.shade_color

  local comment_fg = hex {
    name = 'Comment',
    attribute = 'fg',
    fallback = { name = 'Normal', attribute = 'fg' },
  }

  local normal_fg = hex { name = 'Normal', attribute = 'fg' }
  local normal_bg = hex { name = 'Normal', attribute = 'bg' }
  local string_fg = hex { name = 'String', attribute = 'fg' }

  local error_hl = 'Red'
  local warning_hl = 'Yellow'
  local info_hl = 'Blue'
  local hint_hl = 'Green'

  local error_fg = hex {
    name = error_hl,
    attribute = 'fg',
    fallback = { name = 'Error', attribute = 'fg' },
  }

  local warning_fg = hex {
    name = warning_hl,
    attribute = 'fg',
    fallback = { name = 'WarningMsg', attribute = 'fg' },
  }

  local info_fg = hex {
    name = info_hl,
    attribute = 'fg',
    fallback = { name = 'Normal', attribute = 'fg' },
  }

  local hint_fg = hex {
    name = hint_hl,
    attribute = 'fg',
    fallback = { name = 'Directory', attribute = 'fg' },
  }

  local tabline_sel_bg = hex {
    name = 'TabLineSel',
    attribute = 'bg',
    not_match = normal_bg,
    fallback = {
      name = 'TabLineSel',
      attribute = 'fg',
      not_match = normal_bg,
      fallback = { name = 'WildMenu', attribute = 'fg' },
    },
  }

  local win_separator_fg = hex {
    name = 'WinSeparator',
    attribute = 'fg',
    fallback = {
      name = 'VertSplit',
      attribute = 'fg',
    },
  }

  -- If the colorscheme is bright we shouldn't do as much shading
  -- as this makes light color schemes harder to read
  local is_bright_background = colors.color_is_bright(normal_bg)
  local separator_shading = is_bright_background and -20 or -45
  local background_shading = is_bright_background and -12 or -25
  local diagnostic_shading = is_bright_background and -12 or -25

  local visible_bg = shade(normal_bg, -8)
  local duplicate_color = shade(comment_fg, -5)
  local separator_background_color = shade(normal_bg, separator_shading)
  local background_color = shade(normal_bg, background_shading)

  -- diagnostic colors by default are a few shades darker
  local normal_diagnostic_fg = shade(normal_fg, diagnostic_shading)
  local comment_diagnostic_fg = shade(comment_fg, diagnostic_shading)
  local hint_diagnostic_fg = shade(hint_fg, diagnostic_shading)
  local info_diagnostic_fg = shade(info_fg, diagnostic_shading)
  local warning_diagnostic_fg = shade(warning_fg, diagnostic_shading)
  local error_diagnostic_fg = shade(error_fg, diagnostic_shading)

  local config = require('bufferline.config').get()
  local indicator_style = vim.tbl_get(config, 'user', 'options', 'indicator', 'style')
  local has_underline_indicator = indicator_style == 'underline'

  local underline_sp = has_underline_indicator and tabline_sel_bg or nil

  return {
    fill = {
      fg = comment_fg,
      bg = separator_background_color,
    },
    group_separator = {
      fg = comment_fg,
      bg = separator_background_color,
    },
    group_label = {
      bg = comment_fg,
      fg = separator_background_color,
    },
    tab = {
      fg = comment_fg,
      bg = background_color,
    },
    tab_selected = {
      fg = tabline_sel_bg,
      bg = normal_bg,
      sp = underline_sp,
      underline = has_underline_indicator,
    },
    tab_close = {
      fg = comment_fg,
      bg = background_color,
    },
    close_button = {
      fg = comment_fg,
      bg = background_color,
    },
    close_button_visible = {
      fg = comment_fg,
      bg = visible_bg,
    },
    close_button_selected = {
      fg = normal_fg,
      bg = normal_bg,
      sp = underline_sp,
      underline = has_underline_indicator,
    },
    background = {
      fg = comment_fg,
      bg = background_color,
    },
    buffer = {
      fg = comment_fg,
      bg = background_color,
    },
    buffer_visible = {
      fg = comment_fg,
      bg = visible_bg,
    },
    buffer_selected = {
      fg = normal_fg,
      bg = normal_bg,
      bold = true,
      italic = true,
      sp = underline_sp,
      underline = has_underline_indicator,
    },
    numbers = {
      fg = comment_fg,
      bg = background_color,
    },
    numbers_selected = {
      fg = normal_fg,
      bg = normal_bg,
      bold = true,
      italic = true,
      sp = underline_sp,
      underline = has_underline_indicator,
    },
    numbers_visible = {
      fg = comment_fg,
      bg = visible_bg,
    },
    diagnostic = {
      fg = comment_diagnostic_fg,
      bg = background_color,
    },
    diagnostic_visible = {
      fg = comment_diagnostic_fg,
      bg = visible_bg,
    },
    diagnostic_selected = {
      fg = normal_diagnostic_fg,
      bg = normal_bg,
      bold = true,
      italic = true,
      sp = underline_sp,
      underline = has_underline_indicator,
    },
    hint = {
      fg = comment_fg,
      sp = hint_fg,
      bg = background_color,
    },
    hint_visible = {
      fg = comment_fg,
      bg = visible_bg,
    },
    hint_selected = {
      fg = hint_fg,
      bg = normal_bg,
      bold = true,
      italic = true,
      underline = has_underline_indicator,
      sp = underline_sp or hint_fg,
    },
    hint_diagnostic = {
      fg = comment_diagnostic_fg,
      sp = hint_diagnostic_fg,
      bg = background_color,
    },
    hint_diagnostic_visible = {
      fg = comment_diagnostic_fg,
      bg = visible_bg,
    },
    hint_diagnostic_selected = {
      fg = hint_diagnostic_fg,
      bg = normal_bg,
      bold = true,
      italic = true,
      underline = has_underline_indicator,
      sp = underline_sp or hint_diagnostic_fg,
    },
    info = {
      fg = comment_fg,
      sp = info_fg,
      bg = background_color,
    },
    info_visible = {
      fg = comment_fg,
      bg = visible_bg,
    },
    info_selected = {
      fg = info_fg,
      bg = normal_bg,
      bold = true,
      italic = true,
      underline = has_underline_indicator,
      sp = underline_sp or info_fg,
    },
    info_diagnostic = {
      fg = comment_diagnostic_fg,
      sp = info_diagnostic_fg,
      bg = background_color,
    },
    info_diagnostic_visible = {
      fg = comment_diagnostic_fg,
      bg = visible_bg,
    },
    info_diagnostic_selected = {
      fg = info_diagnostic_fg,
      bg = normal_bg,
      bold = true,
      italic = true,
      underline = has_underline_indicator,
      sp = underline_sp or info_diagnostic_fg,
    },
    warning = {
      fg = comment_fg,
      sp = warning_fg,
      bg = background_color,
    },
    warning_visible = {
      fg = comment_fg,
      bg = visible_bg,
    },
    warning_selected = {
      fg = warning_fg,
      bg = normal_bg,
      bold = true,
      italic = true,
      underline = has_underline_indicator,
      sp = underline_sp or warning_fg,
    },
    warning_diagnostic = {
      fg = comment_diagnostic_fg,
      sp = warning_diagnostic_fg,
      bg = background_color,
    },
    warning_diagnostic_visible = {
      fg = comment_diagnostic_fg,
      bg = visible_bg,
    },
    warning_diagnostic_selected = {
      fg = warning_diagnostic_fg,
      bg = normal_bg,
      bold = true,
      italic = true,
      underline = has_underline_indicator,
      sp = underline_sp or warning_diagnostic_fg,
    },
    error = {
      fg = comment_fg,
      bg = background_color,
      sp = error_fg,
    },
    error_visible = {
      fg = comment_fg,
      bg = visible_bg,
    },
    error_selected = {
      fg = error_fg,
      bg = normal_bg,
      bold = true,
      italic = true,
      underline = has_underline_indicator,
      sp = underline_sp or error_fg,
    },
    error_diagnostic = {
      fg = comment_diagnostic_fg,
      bg = background_color,
      sp = error_diagnostic_fg,
    },
    error_diagnostic_visible = {
      fg = comment_diagnostic_fg,
      bg = visible_bg,
    },
    error_diagnostic_selected = {
      fg = error_diagnostic_fg,
      bg = normal_bg,
      bold = true,
      italic = true,
      underline = has_underline_indicator,
      sp = underline_sp or error_diagnostic_fg,
    },
    modified = {
      fg = string_fg,
      bg = background_color,
    },
    modified_visible = {
      fg = string_fg,
      bg = visible_bg,
    },
    modified_selected = {
      fg = string_fg,
      bg = normal_bg,
      sp = underline_sp,
      underline = has_underline_indicator,
    },
    duplicate_selected = {
      fg = duplicate_color,
      italic = true,
      bg = normal_bg,
      sp = underline_sp,
      underline = has_underline_indicator,
    },
    duplicate_visible = {
      fg = duplicate_color,
      italic = true,
      bg = visible_bg,
    },
    duplicate = {
      fg = duplicate_color,
      italic = true,
      bg = background_color,
    },
    separator_selected = {
      fg = separator_background_color,
      bg = normal_bg,
      sp = underline_sp,
      underline = has_underline_indicator,
    },
    separator_visible = {
      fg = separator_background_color,
      bg = visible_bg,
    },
    separator = {
      fg = separator_background_color,
      bg = background_color,
    },
    tab_separator = {
      fg = separator_background_color,
      bg = background_color,
    },
    tab_separator_selected = {
      fg = separator_background_color,
      bg = normal_bg,
      sp = underline_sp,
      underline = has_underline_indicator,
    },
    indicator_selected = {
      fg = tabline_sel_bg,
      bg = normal_bg,
      sp = underline_sp,
      underline = has_underline_indicator,
    },
    indicator_visible = {
      fg = visible_bg,
      bg = visible_bg,
    },
    pick_selected = {
      fg = error_fg,
      bg = normal_bg,
      bold = true,
      italic = true,
      sp = underline_sp,
      underline = has_underline_indicator,
    },
    pick_visible = {
      fg = error_fg,
      bg = visible_bg,
      bold = true,
      italic = true,
    },
    pick = {
      fg = error_fg,
      bg = background_color,
      bold = true,
      italic = true,
    },
    offset_separator = {
      fg = win_separator_fg,
      bg = separator_background_color,
    },
  }
end

M.config = function()
  require('bufferline').setup {
    options = {
      diagnostics = 'nvim_lsp',
      diagnostics_update_in_insert = true,
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local result = ''
        for severity, count in pairs(diagnostics_dict) do
          result = result .. icons.diagnostic[severity] .. count .. ' '
        end
        return result
      end,
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Explorer',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
    highlights = derive_colors(),
  }
end

return M
