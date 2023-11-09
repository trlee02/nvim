local keyset = vim.keymap.set
local opts = { noremap = true, silent = true }
keyset('n', '<C-A-f>', '<cmd>Telescope live_grep<CR>', opts)
