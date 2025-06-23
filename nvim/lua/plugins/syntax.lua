return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function(args)
          if vim.api.nvim_buf_get_name(args.buf):find("vim._extui") then return end

          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].ft)
          for _, installed_lang in ipairs(require("nvim-treesitter").get_installed()) do
            if lang == installed_lang then
              vim.treesitter.start()
              return
            end
          end
        end,
      })
    end,
  },
}
