local M = {}

local icons = require 'icons'

M.config = function()
  local cmp = require 'cmp'

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
      end,
    },
    sources = cmp.config.sources {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-j>'] = cmp.mapping.scroll_docs(3),
      ['<C-k>'] = cmp.mapping.scroll_docs(-3),
      ['<Tab>'] = cmp.mapping.confirm { select = true },
    },
    formatting = {
      format = function(_, item)
        if item.abbr:len() >= 50 then
          item.abbr = item.abbr:sub(1, 50) .. icons.misc.ellipsis
        end

        if icons.kinds[item.kind] then
          item.kind = icons.kinds[item.kind] .. ' ' .. item.kind
        end

        return item
      end,
    },
    window = {
      documentation = {
        border = 'rounded',
      },
    },
    experimental = {
      ghost_text = true,
    },
  }
end

return M
