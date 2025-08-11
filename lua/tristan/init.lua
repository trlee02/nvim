require("tristan.set")
require("tristan.remap")
require("tristan.lazy_init")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.c_syntax_for_h = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
  end,
})
