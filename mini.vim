if &compatible
  set nocompatible               " Be iMproved
endif

" Disable Vim's native pack feature
set packpath=

let $CACHE = expand('~/.cache/nvim')
if !isdirectory(expand($CACHE))
    call mkdir(expand($CACHE), 'p')
endif
let s:dein_dir = expand('$CACHE/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

let g:dein#auto_recache = 1
if dein#load_state(s:dein_dir, expand('<sfile>'))
  call dein#begin(s:dein_dir, expand('<sfile>'))
  " Required:
  call dein#add('neovim/nvim-lspconfig')
  call dein#add('hrsh7th/nvim-cmp')
  call dein#add('hrsh7th/cmp-buffer')
  call dein#add('hrsh7th/cmp-nvim-lsp')
  " Required:
  call dein#end()
  call dein#save_state()
endif

call dein#call_hook('source')
call dein#call_hook('post_source')
if has('vim_starting') && dein#check_install()
    call dein#install()
endif
filetype plugin indent on
syntax enable
set termguicolors

lua << EOF
require'lspconfig'.clangd.setup{}
local cmp = require("cmp")
    cmp.setup({
        snippet = {
            expand = function(args)
               vim.fn["vsnip#anonymous"](args.body)
             -- require 'snippy'.expand_snippet(args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        -- { name = "vsnip" },
       -- { name = 'snippy' }
    },
    mapping = {
        ["<S-TAB>"] = cmp.mapping.select_prev_item(),
        ["<TAB>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm()
    },
})
EOF

