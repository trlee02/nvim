function ColorMyPencils()
    local fm = require 'fluoromachine'

    fm.setup {
        glow = false,
        theme = 'fluoromachine',
        transparent = 'full',
    }

    vim.cmd.colorscheme('fluoromachine')

	vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})

    local normalFg = vim.fn.synIDattr(vim.fn.hlID('Normal'), 'fg#')
    local normalBg = vim.fn.synIDattr(vim.fn.hlID('Visual'), 'bg#')

    vim.api.nvim_set_hl(0, 'Search', { fg = normalFg, bg = normalBg })
    vim.api.nvim_set_hl(0, 'IncSearch', { fg = normalFg, bg = normalBg, underline = true, bold = true })
end

ColorMyPencils()


