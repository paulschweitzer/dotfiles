
-- GHCI shortcut
--The following if else block configures the "ü" to run code in nvim depending on which file type is used
if vim.fn.expand("%:e") == "py" then
    -- Map this to a key combination of your choice, for example, <leader>r
    vim.keymap.set('n', 'ü', ':!python %<CR>', { noremap = true, silent = true})
elseif vim.fn.expand("%:e") == "hs" then
  vim.keymap.set('n', 'ü', ':!ghc -o %:r % && ./%:r<CR>', {noremap = true, silent = true})
elseif vim.fn.expand("%:e") == "java" then
  vim.keymap.set('n', 'ü', '!javac % && java %:r<CR>', {noremap = true, silent = true})
elseif vim.fn.expand("%:e") == "c" then
	vim.keymap.set('n', 'ü', '', {noremap = true, silent = true})
end
