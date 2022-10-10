local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.api.nvim_command("packadd packer.nvim")
end

return require("packer").startup({
    function(use)
        use("wbthomason/packer.nvim")
        -----------------------------------------------------------------
        --Optimiser
        -----------------------------------------------------------------
        use("lewis6991/impatient.nvim")
        -- Startuptime
        use("dstein64/vim-startuptime")
        use({
            "karb94/neoscroll.nvim",
            event = "WinScrolled",
            config = function()
                require("neoscroll").setup()
            end,
        })
        ------------------------------------------------------------------
        --               lua
        ----------------------------------------------------------------
        use({
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "kyazdani42/nvim-web-devicons",
        })
        -----------------------------------------------------------------
        -- Themes
        -----------------------------------------------------------------
        use("folke/tokyonight.nvim")
        use("EdenEast/nightfox.nvim")
        use("marko-cerovac/material.nvim")
        use({ "catppuccin/nvim", as = "catppuccin" })
        use("navarasu/onedark.nvim")
        use("glepnir/zephyr-nvim")
        ------------------------------------------------------------------
        ----        nvim
        ------------------------------------------------------------------
        use({
            "kyazdani42/nvim-tree.lua",
            config = function()
                require("user.nvim-tree")
            end,
        })
        use({
            "akinsho/bufferline.nvim",
            tag = "v2.*",
            config = function()
                require("user.bufferline")
            end,
        })
        use({
            "nvim-lualine/lualine.nvim",
            event = "BufRead",
            config = function()
                require("user.lualine")
            end,
        })
        use("christoomey/vim-tmux-navigator")
        -------------------------------------------------------------------
        ---               LSP
        --------------------------------------------------------------------
        use({
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "neovim/nvim-lspconfig",
            "folke/lua-dev.nvim",
        })
        --use {
        --  'glepnir/lspsaga.nvim',
        --  config = function() require('user.lsp.lspsaga') end
        --  }
        use({
            "hrsh7th/nvim-cmp",
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "ray-x/cmp-treesitter",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-calc",
            "f3fora/cmp-spell",
            {
                "L3MON4D3/LuaSnip",
                requires = { "rafamadriz/friendly-snippets" },
            },
        })
        use("jose-elias-alvarez/null-ls.nvim")
        use("mfussenegger/nvim-dap")
        --------------------------------------------------------------------------------
        --Commentary
        -------------------------------------------------------------------------------
        use("tpope/vim-commentary")
        -- Twilight
        use({
            "folke/twilight.nvim",
            config = function()
                require("user.twilight-config")
            end,
        })
        -----------------------------------------------------------------------------
        --                       Git
        ----------------------------------------------------------------------------
        use({
            "lewis6991/gitsigns.nvim",
            event = "BufRead",
            config = function()
                require("gitsigns").setup()
            end,
        })
        ------------------------------------------------------------------------------
        --                          IDE
        ------------------------------------------------------------------------------
        use({
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup()
            end,
        })
        use({ -- Indent Blankline
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("user.indent-config")
            end,
        })
        -- Colorizer
        use({
            "norcalli/nvim-colorizer.lua",
            event = { "BufRead", "BufNewFile" },
            config = function()
                require("user.colorizer")
            end,
        })
        -- Colortis
        use({
            "max397574/colortils.nvim",
            cmd = "Colortils",
        })
        -- Treesitter
        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("user.treesitter-config")
            end,
            requires = {
                "nvim-treesitter/nvim-treesitter-textobjects",
                "windwp/nvim-ts-autotag",
                "p00f/nvim-ts-rainbow",
            },
        })
        -- Bracey
        use("turbio/bracey.vim")
        use({
            "folke/trouble.nvim",
            config = function()
                require("user.trouble_lsp")
            end,
        })
        -------------------------------------------------------------------------
        ---                       FZF Finder
        -------------------------------------------------------------------------
        -- Telescope
        use({
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-telescope/telescope-media-files.nvim",
                "nvim-telescope/telescope-project.nvim",
                "nvim-telescope/telescope-file-browser.nvim",
            },
            config = function()
                require("user.telescope-config")
                require("telescope").load_extension("media_files")
            end,
        })
        ----------------------------------------------------------------------------
        --                          Buffers
        ----------------------------------------------------------------------------
        use({
            "kwkarlwang/bufresize.nvim",
            config = function()
                require("bufresize").setup()
            end,
        })
        use({
            "mrjones2014/smart-splits.nvim",
            config = function()
                require("user.smart-split-config")
            end,
        })
        ----------------------------------------------------------------------------
        ---            Terminal
        ----------------------------------------------------------------------------
        use({
            "akinsho/toggleterm.nvim",
            tag = "v2.*",
            config = function()
                require("toggleterm").setup({
                    direction = "float",
                })
            end,
        })
        ----------------------------------------------------------------------------
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
