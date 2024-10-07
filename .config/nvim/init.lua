local vim = vim

require("user.plugins")
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").lua_ls.setup{}
require("lspconfig").pyright.setup{}
require("lspconfig").jdtls.setup{}
require("lspconfig").clangd.setup{}
require("lspconfig").hls.setup{}
-- require("user.java")
require("user.completion")
require("user.syntax-highlight")

require("autoclose").setup{}
require("user.telescope")
require("user.tabmanager")
require("user.lualine")
require("user.indent_line")
require("gitsigns").setup()
require("user.nvimtree")
require("user.vimtex")
require('nvim_comment').setup()

require('keybindings')

local key_mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(
		mode,
		key,
		{noremap = true, silent = true}
	)
end

vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.mouse = ""
vim.opt.termguicolors = true
vim.cmd  [[colorscheme catppuccin-mocha]]

-- Rust tools
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
