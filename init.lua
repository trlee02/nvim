-- Set clipboard to use the unnamedplus register
vim.opt.clipboard = "unnamedplus"

-- Key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true }
map('n', '<A-j>', ':m .+1<CR>==', opts)
map('n', '<A-k>', ':m .-2<CR>==', opts)
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
map('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)

map('n', 'k', 'gk', {noremap=true, silent = true})
map('n', 'j', 'gj', {noremap=true, silent = true})
map('v', 'k', 'gk', {noremap=true, silent = true})
map('v', 'k', 'gk', {noremap=true, silent = true})
map('o', 'j', 'gj', {noremap=true, silent = true})
map('o', 'j', 'gj', {noremap=true, silent = true})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c',
  callback = function()
    vim.keymap.set('n', '<Leader>cc', function() vim.opt.colorcolumn = '80' end, { buffer = true })
    vim.keymap.set('n', '<Leader>ncc', function() vim.opt.colorcolumn:remove('80') end, { buffer = true })
  end
})

-- Indentation settings
vim.opt.shiftwidth = 2
vim.opt.sts = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.rnu = true
vim.opt.nu = true
vim.opt.ai = true
vim.opt.si = true

vim.api.nvim_create_autocmd("FileType", {
  pattern={ "c", "cpp" },
  callback = function ()
    vim.opt.sw = 4
    vim.opt.sts = 4
    vim.opt.tabstop = 4
    vim.opt.et = true
  end
})

-- Load plugins
require('plugins')
require('config')

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.h",
    callback = function()
        local path = vim.fn.getcwd()
        if (vim.fn.findfile('Makefile', '.') ~= '' or #vim.fn.glob('*.c') > 0) then
            vim.bo.filetype = 'c'
        end
    end,
})

-- Set colorscheme
local function link_comment()
  vim.api.nvim_set_hl(0, "@lsp.type.comment.c", { link = "Comment" })
  vim.api.nvim_set_hl(0, "@lsp.type.comment.cpp", { link = "Comment" })
end

-- Add the lsp comment highlights now, and again later if we change colorschemes.
link_comment()
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = link_comment,
})

vim.cmd.colorscheme('fluoromachine')
vim.api.nvim_command('hi LineNr guifg=#B0B0B0')
