vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- You add plugins here  
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use({ 
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end 
	})
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
    use('ThePrimeagen/vim-be-good')
    use ('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',			
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/vim-vsnip',
        'hrsh7th/cmp-vsnip',
        'onsails/lspkind.nvim',
        'rafamadriz/friendly-snippets'
    } 
end)
