local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
   fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
})
vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup({
   function(use)

	use 'wbthomason/packer.nvim'




-----------------------------------------------------------------
                     --Optimiser
-----------------------------------------------------------------
--
	use 'lewis6991/impatient.nvim'
	-- Startuptime
	use 'dstein64/vim-startuptime' 
   --use {
   --   'declancm/cinnamon.nvim',
   --   config = function() require('cinnamon').setup()
--end
   --}
   --use {
  --"max397574/better-escape.nvim",
  --config = function() require("better_escape").setup()
   -- end
--}
------------------------------------------------------------------
--               lua
----------------------------------------------------------------

	use {
		'nvim-lua/plenary.nvim',
		'nvim-lua/popup.nvim',
		'kyazdani42/nvim-web-devicons'
	}
-----------------------------------------------------------------
	-- Themes
-----------------------------------------------------------------

	use 'folke/tokyonight.nvim'
	use'projekt0n/github-nvim-theme'
 
	-- use 'joshdick/onedark' Instalarlo por medio de Plug.
	-- safv12/andromeda.vim Igual que el de arriba.

------------------------------------------------------------------
----        nvim
------------------------------------------------------------------

	use {
		'nvim-lualine/lualine.nvim',
        event = "BufWinEnter",
        config = function() require('user.lualine-config') 
        end,
	}
	use { 
		'akinsho/bufferline.nvim', 
        event = "BufWinEnter",
        config = function() require('user.bufferline-config')
        end,
	}

	-- Nvimtree
    use 'christoomey/vim-tmux-navigator'
	use {	
		'kyazdani42/nvim-tree.lua',
        config = function() require('user.nvim-tree-config') 
        end,
	}

-------------------------------------------------------------------
---               LSP
--------------------------------------------------------------------
   use {
     "williamboman/mason.nvim",
     "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    'onsails/lspkind-nvim',
    config = function()
          require('user.lsp.lspconfig')
          require('user.lsp.mason')

    end,
}


use {
        'hrsh7th/nvim-cmp',
        config = function() require('user.lsp.cmp') end,
        requires = {
            -- CMP Sources
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-cmdline',
            'f3fora/cmp-spell',
            'saadparwaiz1/cmp_luasnip',
            -- 'hrsh7th/cmp-emoji',
            's1n7ax/nvim-ts-utils',
            's1n7ax/nvim-snips',

            -- Other plugins
            {
                'L3MON4D3/LuaSnip'
            },
        },
    }

     use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function() require('user.lsp.null-lsp')
        end,
   }

   -- COC Server  
   use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile' }


--------------------------------------------------------------------
	--Commentary
	use 'tpope/vim-commentary'

	-- Twilight	
	use {
		"folke/twilight.nvim",
        config = function() require('user.twilight-config')
        end,
	}
 -----------------------------------------------------------------------------
 --                       Git
 ----------------------------------------------------------------------------
   use {	
	"lewis6991/gitsigns.nvim",
    config = function()
    require('gitsigns').setup() 
  end
   } 
------------------------------------------------------------------------------
--                          IDE
------------------------------------------------------------------------------
      use{
	'windwp/nvim-autopairs',
      config = function()
           require('nvim-autopairs').setup({
 fast_wrap = {
        map = '<c-t>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey = 'Comment',
    },
           })
        end,
   }
    use { 
	    "lukas-reineke/indent-blankline.nvim",
            config = function() require('user.indent-config')
            end,
   }

	-- Treesitter
	use { 
       'nvim-treesitter/nvim-treesitter',
       run = ":TSUpdate",
       config = function() require('user.treesitter-config') 
       end,
       requires = {
          'windwp/nvim-ts-autotag',
          'p00f/nvim-ts-rainbow',
       },
    }

-------------------------------------------------------------------------
---      FZF Finder
-------------------------------------------------------------------------


   -- Telescope
   use {
      'nvim-telescope/telescope.nvim',
      requires = { 
         'nvim-telescope/telescope-media-files.nvim',
         "nvim-telescope/telescope-project.nvim",
         { 
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make"
         },
       },
       config = function() require('user.telescope-config')
       end,
   }

----------------------------------------------------------------------------
--                          Buffers
----------------------------------------------------------------------------

use {
    "kwkarlwang/bufresize.nvim",
    config = function()
        require("bufresize").setup()
   end,
}

   use {
     'mrjones2014/smart-splits.nvim',
     config = function() require('user.smart-split-config')
     end,
   }
   --
----------------------------------------------------------------------------

end,
config = {
   display = {
      open_fn = function()
         return require('packer.util').float({ border = 'single' })
      end
   }
}
})
