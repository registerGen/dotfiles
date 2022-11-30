return {
  bashls = {},
  clangd = {
    cmd = { 'clangd', '--offset-encoding=utf-16' },
  },
  pyright = {},
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        completion = {
          showWord = 'Disable',
          workSpaceWord = false,
        },
        workspace = {
          checkThirdParty = false,
        },
      },
    },
  },
  texlab = {},
  vimls = {},
}
