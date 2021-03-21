set encoding=utf-8
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let $root = fnamemodify(expand('<sfile>'), ':h')


if has('nvim')
    let $plugpath=$HOME . '/.cache/dein/'
else
    let $plugpath=$HOME . '/.cache/dein_vim/'
endif
" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" Required:
if dein#load_state('$plugpath')
  call dein#begin('$plugpath')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  " Add or remove your plugins here like this:
  call dein#load_toml('$root/config/plugins.toml')
  call dein#load_toml('$root/config/plugins_theme.toml')

  " Required:
  call dein#end()
  call dein#save_state()
endif
" If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif
let g:dein#auto_recache = 1
call dein#call_hook('source')
autocmd VimEnter * call dein#call_hook('post_source')
"End dein Scripts-------------------------


" for file in split(glob("$root/config/*.vim"), '\n')
"     execute 'source' file
" endfor
source $root/config/base.vim
source $root/config/function.vim
source $root/config/mapping.vim
" Required:
filetype plugin indent on
syntax enable
" 颜色主题放在这里

set background=dark
" colorscheme one
" colorscheme gruvbox-material
colorscheme onebuddy
if has('nvim')
    lua require("lsp_config")
    lua require("nvim_treesitter")
    lua require("config")
endif

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

