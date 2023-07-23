local M = {}

M.config = function()
  require("mason").setup({
    github = {
      download_url_template = "https://ghproxy.com/https://github.com/%s/releases/download/%s/%s",
    },
  })
end

return M
