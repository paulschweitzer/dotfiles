-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
return {
	{
		{
			"m4xshen/autoclose.nvim", -- for brackets
			opts = {
				lazy = false,
			},
		},
		-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
		"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
		"eandrju/cellular-automaton.nvim", -- cellular-automaton

		-- NOTE: Plugins can also be added by using a table,
		-- with the first argument being the link and the following
		-- keys can be used to configure plugin behavior/loading/etc.
		--
		-- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
		--

		-- Alternatively, use `config = function() ... end` for full control over the configuration.
		-- If you prefer to call `setup` explicitly, use:
		--    {
		--        'lewis6991/gitsigns.nvim',
		--        config = function()
		--            require('gitsigns').setup({
		--                -- Your gitsigns configuration here
		--            })
		--        end,
		--    }
		--
		-- Here is a more advanced example where we pass configuration
		-- options to `gitsigns.nvim`.
		--
		-- See `:help gitsigns` to understand what the configuration keys do
		{ -- Adds git related signs to the gutter, as well as utilities for managing changes
			"lewis6991/gitsigns.nvim",
			opts = {
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			},
		},

		-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
		--
		-- This is often very useful to both group configuration, as well as handle
		-- lazy loading plugins that don't need to be loaded immediately at startup.
		--
		-- For example, in the following configuration, we use:
		--  event = 'VimEnter'
		--
		-- which loads which-key before all the UI elements are loaded. Events can be
		-- normal autocommands events (`:help autocmd-events`).
		--
		-- Then, because we use the `opts` key (recommended), the configuration runs
		-- after the plugin has been loaded as `require(MODULE).setup(opts)`.

		-- NOTE: Plugins can specify dependencies.
		--
		-- The dependencies are proper plugin specifications as well - anything
		-- you do for a plugin at the top level, you can do for a dependency.
		--
		-- Use the `dependencies` key to specify the dependencies of a particular plugin

		{ -- Autoformat
			"stevearc/conform.nvim",
			event = { "BufWritePre" },
			cmd = { "ConformInfo" },
			keys = {
				{
					"<leader>f",
					function()
						require("conform").format({ async = true, lsp_format = "fallback" })
					end,
					mode = "",
					desc = "[F]ormat buffer",
				},
			},
			opts = {
				notify_on_error = false,
				format_on_save = function(bufnr)
					-- Disable "format_on_save lsp_fallback" for languages that don't
					-- have a well standardized coding style. You can add additional
					-- languages here or re-enable it for the disabled ones.
					local disable_filetypes = { c = true, cpp = true }
					if disable_filetypes[vim.bo[bufnr].filetype] then
						return nil
					else
						return {
							timeout_ms = 500,
							lsp_format = "fallback",
						}
					end
				end,
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform can also run multiple formatters sequentially
					-- python = { "isort", "black" },
					--
					-- You can use 'stop_after_first' to run the first available formatter from the list
					-- javascript = { "prettierd", "prettier", stop_after_first = true },
				},
			},
		},

		-- Highlight todo, notes, etc in comments
		{
			"folke/todo-comments.nvim",
			event = "VimEnter",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = { signs = false },
		},

		{ -- Collection of various small independent plugins/modules
			"echasnovski/mini.nvim",
			config = function()
				-- Better Around/Inside textobjects
				--
				-- Examples:
				--  - va)  - [V]isually select [A]round [)]paren
				--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
				--  - ci'  - [C]hange [I]nside [']quote
				require("mini.ai").setup({ n_lines = 500 })

				-- Add/delete/replace surroundings (brackets, quotes, etc.)
				--
				-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
				-- - sd'   - [S]urround [D]elete [']quotes
				-- - sr)'  - [S]urround [R]eplace [)] [']
				require("mini.surround").setup()

				-- Simple and easy statusline.
				--  You could remove this setup call if you don't like it,
				--  and try some other statusline plugin
				local statusline = require("mini.statusline")
				-- set use_icons to true if you have a Nerd Font
				statusline.setup({ use_icons = vim.g.have_nerd_font })

				-- You can configure sections in the statusline by overriding their
				-- default behavior. For example, here we set the section for
				-- cursor location to LINE:COLUMN
				---@diagnostic disable-next-line: duplicate-set-field
				statusline.section_location = function()
					return "%2l:%-2v"
				end

				-- ... and there is more!
				--  Check out: https://github.com/echasnovski/mini.nvim
			end,
		},
	},
	{
		-- ui = {
		-- 	-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- 	-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		-- 	icons = vim.g.have_nerd_font and {} or {
		-- 		cmd = "⌘",
		-- 		config = "🛠",
		-- 		event = "📅",
		-- 		ft = "📂",
		-- 		init = "⚙",
		-- 		keys = "🗝",
		-- 		plugin = "🔌",
		-- 		runtime = "💻",
		-- 		require = "🌙",
		-- 		source = "📄",
		-- 		start = "🚀",
		-- 		task = "📌",
		-- 		lazy = "💤 ",
		-- 	},
		-- },
	},
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
