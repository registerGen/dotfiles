local M = {}

local u = require("utils")

M.config = function()
  require("code_runner").setup({
    startinsert = true,
    filetype = {
      cpp = "cd $dir && "
        .. vim.fn.stdpath("config")
        .. "/scripts/run_cpp.sh $fileName $fileNameWithoutExt "
        .. vim.fn.fnamemodify(vim.fn.tempname(), ":h"),
      python = "cd $dir && python $fileName",
      tex = "cd $dir && latexmk $fileName && latexmk -c",
      sh = "cd $dir && chmod u+x $fileName && ./$fileName",
    },
  })

  u.set_map_prefix("")
  u.nmap("<C-M-N>", "<cmd>RunFile<CR>", { desc = "Run code" })
end

return M
