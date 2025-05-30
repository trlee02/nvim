return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
        { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
        { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
        debug = true, -- Enable debugging
        -- See Configuration section for rest
    },
    keys = {
        {
            "<leader>cct",
            "<cmd>CopilotChatToggle<CR>",
            desc = "CopilotChat - Chat Toggle",
            mode = {"n", "v"}
        },
        {
            "<leader>ccb",
            function()
                local input = vim.fn.input("Quick Chat: ")
                if input ~= "" then
                    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
                end
            end,
            desc = "CopilotChat - Quick chat",
        },
        {
            "<leader>cce",
            "<cmd>CopilotChatExplain<CR>",
            desc = "CopilotChat - Quick chat",
            mode = {"n", "v"},
        },
    },
    -- See Commands section for default commands if you want to lazy load on them
}
