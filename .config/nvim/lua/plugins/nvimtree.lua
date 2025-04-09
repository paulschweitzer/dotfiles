return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		-- disable netrw at the very start of your init.lua (strongly advised)
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		-- empty setup using defaults
		require("nvim-tree").setup()

		-- OR setup with some options
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})

		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		-- Focus NvimTree
		map("n", "<A-f>", "<Cmd>NvimTreeFocus<CR>", opts)
	end,
}
