return {
  bashls = {},
  clangd = {
    cmd = { 'clangd', '--offset-encoding=utf-16' },
  },
  pyright = {},
  lua_ls = {
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
