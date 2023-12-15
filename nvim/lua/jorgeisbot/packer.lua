vim.cmd.packadd("packer.nvim")

return require('packer').startup(
function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Themes
	-- use ({ "folke/tokyonight.nvim" })
	-- use ({ "sainnhe/everforest" })
	use ({ "AlexvZyl/nordic.nvim" })
	use ({ "catppuccin/nvim", as = "catppuccin" })

	-- Files Manager
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

	-- Syntax
	use ("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate"})

	-- Autocompletion
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- LSP server manager for neovim
			{'williamboman/mason.nvim'},
			--Integration between mason.nvim and nvim-lspconfig
			{'williamboman/mason-lspconfig.nvim'},
			-- Set default configuration for LSP
			{'neovim/nvim-lspconfig'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'}, --yes
			{'hrsh7th/cmp-nvim-lsp'}, --yes
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lua'},
			-- Snippets
			{'L3MON4D3/LuaSnip'},
			-- Snippet Collection (optional)
			{'rafamadriz/friendly-snippets'},
		}
	}

	--table
	use {'ojroques/nvim-hardline'}

  -- css
  use {'ap/vim-css-color'}
end
)
