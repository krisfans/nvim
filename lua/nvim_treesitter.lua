
require 'nvim-treesitter.install'.compilers = { "clang" }
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "cpp", "json", "python"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
    --   disable = { "c", "rust" },  -- list of language that will be disabled
    },
    indent = {
        enable = true
    }
}