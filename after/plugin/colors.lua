function ColorMyPencils(color)
    local fm = require('fluoromachine')

    fm.setup {
        brightness = 0.1,
        transparent = 'false',
    }

    vim.cmd.colorscheme('fluoromachine')

	vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
end

ColorMyPencils()


