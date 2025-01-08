return {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    -- cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim && make && cd -
    -- run the above if there are issues with the the telescope-fzf-native
    {
        'nvim-telescope/telescope.nvim',

        dependencies = {
            'nvim-lua/plenary.nvim'
        },

        config = function()
            local telescope = require('telescope')
            telescope.setup({})
            telescope.load_extension('fzf')

            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})

            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ")})
            end)
            vim.keymap.set('n', '<leader>pws', function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set('n', '<leader>pWs', function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        end
    },

}
