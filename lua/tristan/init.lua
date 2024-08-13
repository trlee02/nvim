require("tristan.set")
require("tristan.remap")
require("tristan.lazy_init")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {desc="Go to definition", buffer=e.buf})
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {desc="Hover"})
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {desc="List all workspace symbols", buffer=e.buf})
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {desc="Show diagnostics in a floating window", buffer=e.buf})
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {desc="Select the code actions available at the cursor", buffer=e.buf})
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, {desc="Show all references of symbol under cursor", buffer=e.buf})
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {desc="Rename all instances of symbol under cursor", buffer=e.buf})
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {desc="Show signature help in a floating window", buffer=e.buf})
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {desc="Go to next diagnostic", buffer=e.buf})
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {desc="Go to previous diagnostic", buffer=e.buf})
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.c_syntax_for_h = true
