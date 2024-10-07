local vim = vim

vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk = {
    callback = 1,
    continuous = 1,
    executable = "latexmk",
    options = {
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
    },
}

vim.g.vimtex_view_general_viewer = "zathura_simple"
