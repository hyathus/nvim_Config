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
--                Vim Script
------------------------------------------------------------------
    use 'drewtempelmeyer/palenight.vim'
    use'OmniSharp/omnisharp-vim'
-----------------------------------------------------------------
                     --Optimiser
-----------------------------------------------------------------
--
	use 'lewis6991/impatient.nvim'
	-- Startuptime
	use 'dstein64/vim-startuptime'
    use {
        'karb94/neoscroll.nvim',
        event = "WinScrolled",
        config = function() require("neoscroll").setup()
        end
    }
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
	use 'projekt0n/github-nvim-theme'
	-- use 'joshdick/onedark'
	-- safv12/andromeda.vim
------------------------------------------------------------------
----        nvim
------------------------------------------------------------------
    use 'kyazdani42/nvim-tree.lua'
    use {
        'akinsho/bufferline.nvim', tag = "v2.*",  
        config = function() 
            require('bufferline').setup()
        end,
    }
    use {
        'tamton-aquib/staline.nvim',
        event = "BufRead",
        config = function()
            require('staline').setup()
        end
    }
    use 'christoomey/vim-tmux-navigator'
-------------------------------------------------------------------
--         coc.nvim
-------------------------------------------------------------------
-- lsp en windows es una mierda o yo soy una mierda para solucionarlo :)
    use({
        'neoclide/coc.nvim',
        branch = 'master',
        run = 'yarn install --frozen-lockfile',
        config = function() require("user.coc-config")
        end
        })
-------------------------------------------------------------------
---               LSP
--------------------------------------------------------------------
-- Usar cuando descubra el problema o me encuentre en linux.

    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      config = function()
        require("user.lsp.lspconfig").setup()
    end,
     }
  -- use {
   --  'glepnir/lspsaga.nvim',
   --  config = function() require('user.lsp.lspsaga') end 
-- }
   use {
         'hrsh7th/nvim-cmp',
         requires = {
           -- CMP Sources
             -- 'hrsh7th/cmp-nvim-lsp-signature-help',
             'hrsh7th/cmp-buffer',
             -- 'hrsh7th/cmp-nvim-lua',
             'onsails/lspkind-nvim',
             'hrsh7th/cmp-nvim-lsp',
              'hrsh7th/cmp-path',
   --          'hrsh7th/cmp-calc',
             'hrsh7th/cmp-cmdline',
   --          'f3fora/cmp-spell',
             'saadparwaiz1/cmp_luasnip',
   --          -- 'hrsh7th/cmp-emoji',
   --          's1n7ax/nvim-ts-utils',
   --          's1n7ax/nvim-snips',

             -- Other plugins
             {
                 'L3MON4D3/LuaSnip',
                 'rafamadriz/friendly-snippets'
             },
         },
         config = function() require('user.lsp.cmp') end,
     }

   --   use {
   --      'jose-elias-alvarez/null-ls.nvim',
   --      event = { "BufRead", "BufNewFile" },
   --      config = function() require('user.lsp.null-lsp')
   --      end,
   -- }
   -- -- Prettier
   -- use {
   --   'MunifTanjim/prettier.nvim',
   --   config = function() require('user.lsp.prettier')
   --   end
   -- }
--------------------------------------------------------------------------------
	--Commentary
-------------------------------------------------------------------------------
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
    event = "BufRead",
    config = function()
    require('gitsigns').setup()
  end,
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
    use { -- Indent Blankline
	    "lukas-reineke/indent-blankline.nvim",
            config = function() require('user.indent-config')
            end,
   }
    -- Colorizer
    use { 'norcalli/nvim-colorizer.lua',
    event = { "BufRead", "BufNewFile" },
    config = function() require('user.colorizer')
    end
  }
    -- Colortis
    use {
      "max397574/colortils.nvim",
      cmd = "Colortils",
      config = function()
        require("colortils").setup()
      end,
    }
	-- Treesitter
	use {
       'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate',
       config = function() require('user.treesitter-config')
       end,
       requires = {
          'windwp/nvim-ts-autotag',
          'p00f/nvim-ts-rainbow',
       }, 
    }
    -- Bracey
    use 'turbio/bracey.vim'
-------------------------------------------------------------------------
---                       FZF Finder
-------------------------------------------------------------------------
   -- Telescope
   use {
      'nvim-telescope/telescope.nvim',
      requires = {
         'nvim-telescope/telescope-media-files.nvim',
         "nvim-telescope/telescope-project.nvim",
         'nvim-telescope/telescope-file-browser.nvim',
       },
       config = function() 

           require('user.telescope-config')
           require('telescope').load_extension('media_files')

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
----------------------------------------------------------------------------
---            Terminal
----------------------------------------------------------------------------
    use {
        "akinsho/toggleterm.nvim", tag = 'v2.*',
        config = function()
            require("toggleterm").setup( {
                direction = "float",
            })
        end
    }
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
