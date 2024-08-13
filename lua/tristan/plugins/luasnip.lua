return {
    'L3MON4D3/LuaSnip',
    dependencies = { "rafamadriz/friendly-snippets" },

    config = function () 
        local ls = require("luasnip")
        vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true, desc="Expand snippet"})
        vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true, desc="Jump to next param"})
        vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true, desc="Jump to prev param"})

        vim.keymap.set({"i", "s"}, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, {silent = true})
    end


}
