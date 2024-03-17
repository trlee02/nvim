vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use ({
		'maxmx03/fluoromachine.nvim',
		as = 'fluoromachine',
		config = function()
			vim.cmd('colorscheme fluoromachine')
		end
	})
	ouse('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('ThePrimeagen/harpoon')
end)
