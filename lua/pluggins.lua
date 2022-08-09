return require('packer').startup(function()

	use( 'wbthomason/packer.nvim')
	--Optimiser
	use 'lewis6991/impatient.nvim'
	-- Startuptime
	use 'dstein64/vim-startuptime' 

	-- Themes
	use 'folke/tokyonight.nvim'
	-- use 'joshdick/onedark' Instalarlo por medio de Plug.
	-- safv12/andromeda.vim Igual que el de arriba.


	-- Airline
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true }, 
        config =  "require('setting.lualine')"  

	}
	use { 
		'akinsho/bufferline.nvim', 
		requires = {'kyazdani42/nvim-web-devicons', opt = true },
        config =  "require('setting.bufferline')"  
	}

	-- Nvimtree
	use {	'christoomey/vim-tmux-navigator',
		'kyazdani42/nvim-tree.lua', 
		requires = { 'kyazdani42/nvim-web-devicons', -- optional, for file icons 
        config =  "require('setting.nvim-tree')"  
	},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	--Commentary
	use 'tpope/vim-commentary'
	
	-- Treesitter
	use {
       'nvim-treesitter/nvim-treesitter', run = ":TSUpdate",
        config =  "require('setting.treesitter-config')"  
   }
         
	

	-- Twilight	
	use {
		"folke/twilight.nvim",
        config =  "require('setting.twilight')"  
	}
  
	
	-- IDE
	
	use {
		-- Autopair and AutoTag
		'windwp/nvim-autopairs',
		'windwp/nvim-ts-autotag',
		'p00f/nvim-ts-rainbow',

		--Smooth Escaping and Scrooling
		'max397574/better-escape.nvim',
		'declancm/cinnamon.nvim',
	}

   -- Telescope
   use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = {
         'nvim-lua/plenary.nvim',
         'nvim-lua/popup.nvim',
         'kyazdani42/nvim-web-devicons', opt = true,
         'nvim-telescope/telescope-media-files.nvim',
       },
        config =  "require('setting.telescope')"  
   }



end)
