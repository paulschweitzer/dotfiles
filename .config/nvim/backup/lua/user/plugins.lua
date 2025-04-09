local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
	use({
		"williamboman/mason.nvim",
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	})
	use("williamboman/mason-lspconfig.nvim")

	-- Hrsh7th Code Completion Suite
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/vim-vsnip")

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use 'simrat39/rust-tools.nvim' -- Rust tools
	use("m4xshen/autoclose.nvim") -- Autopairs
	use("sbdchd/neoformat") -- Formatter
	use("RRethy/vim-illuminate") -- Additional highlighter
	use "lukas-reineke/indent-blankline.nvim" -- Indent line
	use 'mfussenegger/nvim-jdtls' --Extension for java lsp
	use("nvim-tree/nvim-web-devicons") -- Icons
	use {
  'lewis6991/gitsigns.nvim',
  -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	} -- Git Signs
	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- Telescope extensions
	-- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	-- File explorer
	use 'nvim-tree/nvim-tree.lua'
	-- Tab manager
	use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
	-- Tab and buffer manager
	-- use 'kdheepak/tabline.nvim'
	-- Treesitter
	use({
		-- recommended packer way of installing it is to run this function, copied from documentation
		"nvim-treesitter/nvim-treesitter",
		-- tag = "0.5.0",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use 'lervag/vimtex'  -- VimTex
	-- install without yarn or npm
	use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
	})

	use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
	}) -- nvim-surround
	use "terrortylor/nvim-comment"   -- nvim-comment
	use 'eandrju/cellular-automaton.nvim' -- cellular-automaton
	-- Themes
	use("kvrohit/rasmus.nvim")
	use("folke/tokyonight.nvim")
	use("pineapplegiant/spaceduck")
	use("karoliskoncevicius/sacredforest-vim")
	use('voidekh/kyotonight.vim')
	use 'AlexvZyl/nordic.nvim'
	use ('Tsuzat/NeoSolarized.nvim')
	use ("hachy/eva01.vim")
	use "rafamadriz/neon"
	use 'marko-cerovac/material.nvim'
	use "kyazdani42/blue-moon"
	use 'glepnir/zephyr-nvim'
	use 'shaunsingh/moonlight.nvim'
	use { 'Everblush/nvim', as = 'everblush' }
	-- use 'rmehri01/onenord.nvim'
	use 'titanzero/zephyrium'
	use 'kvrohit/mellow.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
