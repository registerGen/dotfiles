-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/registergen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/registergen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/registergen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/registergen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/registergen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\0025\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    keys = { { "", "gc" }, { "", "gcc" }, { "", "gbc" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://ghproxy.com/https://github.com/numToStr/Comment.nvim"
  },
  ["aerial.nvim"] = {
    after = { "telescope.nvim" },
    config = { "\27LJ\2\2?\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\21plugincfg.aerial\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/aerial.nvim",
    url = "https://ghproxy.com/https://github.com/stevearc/aerial.nvim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\2>\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\20plugincfg.alpha\frequire\0" },
    loaded = true,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://ghproxy.com/https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\2C\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\25plugincfg.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://ghproxy.com/https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-nvim-lsp"] = {
    after = { "nvim-lspconfig" },
    after_files = { "/home/registergen/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://ghproxy.com/https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-vsnip"] = {
    after_files = { "/home/registergen/.local/share/nvim/site/pack/packer/opt/cmp-vsnip/after/plugin/cmp_vsnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/cmp-vsnip",
    url = "https://ghproxy.com/https://github.com/hrsh7th/cmp-vsnip"
  },
  ["code_runner.nvim"] = {
    config = { "\27LJ\2\2D\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\26plugincfg.code_runner\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/code_runner.nvim",
    url = "https://ghproxy.com/https://github.com/CRAG666/code_runner.nvim"
  },
  ["codewindow.nvim"] = {
    config = { "\27LJ\2\2C\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\25plugincfg.codewindow\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/codewindow.nvim",
    url = "https://ghproxy.com/https://github.com/gorbit99/codewindow.nvim"
  },
  ["dressing.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/dressing.nvim",
    url = "https://ghproxy.com/https://github.com/stevearc/dressing.nvim"
  },
  ["flit.nvim"] = {
    config = { "\27LJ\2\2=\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\19plugincfg.flit\frequire\0" },
    keys = { { "", "f" }, { "", "F" }, { "", "t" }, { "", "T" } },
    load_after = {
      ["leap.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/flit.nvim",
    url = "https://ghproxy.com/https://github.com/ggandor/flit.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\2A\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\23plugincfg.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://ghproxy.com/https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glance.nvim"] = {
    config = { "\27LJ\2\0024\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vglance\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/glance.nvim",
    url = "https://ghproxy.com/https://github.com/DNLHC/glance.nvim"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\2?\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\21plugincfg.hlargs\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/hlargs.nvim",
    url = "https://ghproxy.com/https://github.com/m-demare/hlargs.nvim"
  },
  ["inc-rename.nvim"] = {
    commands = { "IncRename" },
    config = { "\27LJ\2\0028\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15inc_rename\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/inc-rename.nvim",
    url = "https://ghproxy.com/https://github.com/smjonas/inc-rename.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2I\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\31plugincfg.indent_blankline\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://ghproxy.com/https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["iswap.nvim"] = {
    commands = { "ISwap" },
    config = { "\27LJ\2\2>\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\20plugincfg.iswap\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/iswap.nvim",
    url = "https://ghproxy.com/https://github.com/mizlan/iswap.nvim"
  },
  ["leap.nvim"] = {
    after = { "flit.nvim" },
    config = { "\27LJ\2\2@\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\24set_default_keymaps\tleap\frequire\0" },
    keys = { { "", "s" }, { "", "S" }, { "", "f" }, { "", "F" }, { "", "t" }, { "", "T" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/leap.nvim",
    url = "https://ghproxy.com/https://github.com/ggandor/leap.nvim"
  },
  ["lsp-inlayhints.nvim"] = {
    config = { "\27LJ\2\2<\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19lsp-inlayhints\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/lsp-inlayhints.nvim",
    url = "https://ghproxy.com/https://github.com/lvimuser/lsp-inlayhints.nvim"
  },
  ["lspkind-nvim"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/lspkind-nvim",
    url = "https://ghproxy.com/https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\2@\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22plugincfg.lualine\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://ghproxy.com/https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\2H\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\30plugincfg.mason_lspconfig\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/mason-lspconfig.nvim",
    url = "https://ghproxy.com/https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    after = { "nvim-lspconfig" },
    commands = { "Mason" },
    config = { "\27LJ\2\2>\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\20plugincfg.mason\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/mason.nvim",
    url = "https://ghproxy.com/https://github.com/williamboman/mason.nvim"
  },
  ["neodev.nvim"] = {
    after = { "nvim-lspconfig" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/neodev.nvim",
    url = "https://ghproxy.com/https://github.com/folke/neodev.nvim"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\2>\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\20plugincfg.noice\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/noice.nvim",
    url = "https://ghproxy.com/https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://ghproxy.com/https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\2@\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22plugincfg.null_ls\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://ghproxy.com/https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2<\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://ghproxy.com/https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-vsnip", "lspkind-nvim" },
    config = { "\27LJ\2\2<\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\18plugincfg.cmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://ghproxy.com/https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-gomove"] = {
    config = { "\27LJ\2\0024\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vgomove\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/nvim-gomove",
    url = "https://ghproxy.com/https://github.com/booperlv/nvim-gomove"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\2B\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\24plugincfg.lightbulb\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb",
    url = "https://ghproxy.com/https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\2<\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\18plugincfg.lsp\frequire\0" },
    load_after = {
      ["cmp-nvim-lsp"] = true,
      ["mason.nvim"] = true,
      ["neodev.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://ghproxy.com/https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    after = { "telescope.nvim" },
    config = { "\27LJ\2\2?\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\21plugincfg.notify\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://ghproxy.com/https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\2=\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\19plugincfg.tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://ghproxy.com/https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "indent-blankline.nvim", "hlargs.nvim", "iswap.nvim", "nvim-treesitter-context", "nvim-treesitter-textobjects", "nvim-ts-autotag", "nvim-ts-rainbow", "playground", "nvim-treesitter-endwise" },
    config = { "\27LJ\2\2C\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\25plugincfg.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://ghproxy.com/https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\2@\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23treesitter-context\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context",
    url = "https://ghproxy.com/https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-endwise"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-endwise",
    url = "https://ghproxy.com/https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://ghproxy.com/https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\2=\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://ghproxy.com/https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://ghproxy.com/https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-ufo"] = {
    config = { "\27LJ\2\2<\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\18plugincfg.ufo\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/nvim-ufo",
    url = "https://ghproxy.com/https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://ghproxy.com/https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://ghproxy.com/https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://ghproxy.com/https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://ghproxy.com/https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/promise-async",
    url = "https://ghproxy.com/https://github.com/kevinhwang91/promise-async"
  },
  ["satellite.nvim"] = {
    config = { "\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14satellite\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/satellite.nvim",
    url = "https://ghproxy.com/https://github.com/lewis6991/satellite.nvim"
  },
  sonokai = {
    config = { "\27LJ\2\2@\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22plugincfg.sonokai\frequire\0" },
    loaded = true,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://ghproxy.com/https://github.com/sainnhe/sonokai"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://ghproxy.com/https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\2B\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\24plugincfg.telescope\frequire\0" },
    load_after = {
      ["aerial.nvim"] = true,
      ["nvim-notify"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://ghproxy.com/https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trim.nvim"] = {
    config = { "\27LJ\2\0022\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ttrim\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/trim.nvim",
    url = "https://ghproxy.com/https://github.com/cappyzawa/trim.nvim"
  },
  ["vim-fugitive"] = {
    commands = { "G" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://ghproxy.com/https://github.com/tpope/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://ghproxy.com/https://github.com/tpope/vim-repeat"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    config = { "\27LJ\2\0023\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\20\0=\1\2\0K\0\1\0\22startuptime_tries\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://ghproxy.com/https://github.com/dstein64/vim-startuptime"
  },
  ["vim-visual-multi"] = {
    config = { "\27LJ\2\0025\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\14<leader>v\14VM_leader\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/vim-visual-multi",
    url = "https://ghproxy.com/https://github.com/mg979/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\2>\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\20plugincfg.vsnip\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/vim-vsnip",
    url = "https://ghproxy.com/https://github.com/hrsh7th/vim-vsnip"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/registergen/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://ghproxy.com/https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^promise"] = "promise-async"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\2>\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\20plugincfg.alpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: sonokai
time([[Config for sonokai]], true)
try_loadstring("\27LJ\2\2@\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22plugincfg.sonokai\frequire\0", "config", "sonokai")
time([[Config for sonokai]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'StartupTime', function(cmdargs)
          require('packer.load')({'vim-startuptime'}, { cmd = 'StartupTime', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-startuptime'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('StartupTime ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ISwap', function(cmdargs)
          require('packer.load')({'iswap.nvim'}, { cmd = 'ISwap', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'iswap.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ISwap ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'G', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'G', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('G ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Mason', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'Mason', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Mason ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Telescope', function(cmdargs)
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telescope.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Telescope ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'IncRename', function(cmdargs)
          require('packer.load')({'inc-rename.nvim'}, { cmd = 'IncRename', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'inc-rename.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('IncRename ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> T <cmd>lua require("packer.load")({'flit.nvim'}, { keys = "T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> s <cmd>lua require("packer.load")({'leap.nvim'}, { keys = "s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> F <cmd>lua require("packer.load")({'flit.nvim'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> t <cmd>lua require("packer.load")({'leap.nvim'}, { keys = "t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> f <cmd>lua require("packer.load")({'leap.nvim'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gbc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gbc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> S <cmd>lua require("packer.load")({'leap.nvim'}, { keys = "S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gcc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> t <cmd>lua require("packer.load")({'flit.nvim'}, { keys = "t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> T <cmd>lua require("packer.load")({'leap.nvim'}, { keys = "T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> f <cmd>lua require("packer.load")({'flit.nvim'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> F <cmd>lua require("packer.load")({'leap.nvim'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'nvim-treesitter', 'cmp-nvim-lsp', 'aerial.nvim', 'bufferline.nvim', 'neodev.nvim', 'mason.nvim', 'nvim-lspconfig', 'lualine.nvim', 'mason-lspconfig.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'aerial.nvim', 'nvim-notify', 'nvim-gomove', 'glance.nvim', 'nvim-lightbulb', 'telescope.nvim', 'vim-visual-multi', 'nvim-tree.lua', 'code_runner.nvim'}, { event = "CursorHold *" }, _G.packer_plugins)]]
vim.cmd [[au BufWritePre * ++once lua require("packer.load")({'trim.nvim'}, { event = "BufWritePre *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter', 'indent-blankline.nvim', 'hlargs.nvim', 'lsp-inlayhints.nvim', 'dressing.nvim', 'null-ls.nvim', 'nvim-notify', 'gitsigns.nvim', 'which-key.nvim', 'nvim-treesitter-context', 'nvim-ufo', 'noice.nvim', 'nvim-treesitter-textobjects', 'codewindow.nvim', 'nvim-ts-autotag', 'nvim-ts-rainbow', 'satellite.nvim', 'playground', 'nvim-treesitter-endwise'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'cmp-nvim-lsp', 'aerial.nvim', 'bufferline.nvim', 'neodev.nvim', 'mason.nvim', 'nvim-lspconfig', 'lualine.nvim', 'mason-lspconfig.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au InsertCharPre * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertCharPre *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'lspkind-nvim', 'nvim-cmp', 'vim-vsnip'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'noice.nvim'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
