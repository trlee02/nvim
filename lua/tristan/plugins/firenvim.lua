return {
    'glacambre/firenvim',

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
        vim.fn["firenvim#install"](0)
    end,
    vim.api.nvim_create_autocmd({'UIEnter'}, {
        callback = function(event)
            local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
            if client ~= nil and client.name == "Firenvim" then
                vim.o.laststatus = 0
            end
        end
    })
}

