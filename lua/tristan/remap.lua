vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in spot when J
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor in middle of screen when moving down/up half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keep cursor in middle of screen when searching down/up
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- places item replaced by register into void register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- find and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- source file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- opern terminal
vim.api.nvim_create_autocmd("TermOpen", {
	command = "setlocal nonumber norelativenumber nospell",
})
vim.keymap.set('n', '<leader>t', ':botright split | resize 10 | terminal<CR>')











































