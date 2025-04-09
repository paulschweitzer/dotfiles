return {
	{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },

	{ "kvrohit/rasmus.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "pineapplegiant/spaceduck" },
	{ "karoliskoncevicius/sacredforest-vim" },
	{ "voidekh/kyotonight.vim" },
	{ "AlexvZyl/nordic.nvim" },
	{ "Tsuzat/NeoSolarized.nvim" },
	{ "hachy/eva01.vim" },
	{ "rafamadriz/neon" },
	{ "marko-cerovac/material.nvim" },
	{ "kyazdani42/blue-moon" },
	{ "glepnir/zephyr-nvim" },
	{ "shaunsingh/moonlight.nvim" },
	{ "Everblush/nvim", name = "everblush" },
	{ "titanzero/zephyrium" },
	{ "kvrohit/mellow.nvim" },
	{ "pineapplegiant/spaceduck" },

	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can  `:Telescope colorscheme`.
		"folke/tokyonight.nvim",
		-- priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({
				styles = {
					comments = { italic = false }, -- Disable italics in comments
				},
			})

			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
		end,
	},
}
