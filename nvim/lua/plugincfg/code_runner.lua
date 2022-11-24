local M = {}

M.config = function()
  require('code_runner').setup {
    startinsert = true,
    filetype = {
      cpp = 'cd $dir && '
        .. vim.fn.stdpath 'config'
        .. '/scripts/run_cpp.sh $fileName $fileNameWithoutExt',
      python = 'cd $dir && python $fileName',
      tex = 'cd $dir && latexmk $fileName && latexmk -c',
      sh = 'cd $dir && chmod u+x $fileName && ./$fileName',
    },
  }
end

return M
