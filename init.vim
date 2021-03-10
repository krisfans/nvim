set encoding=utf-8
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let $root = fnamemodify(expand('<sfile>'), ':h')
" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

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
call dein#call_hook('source')
autocmd VimEnter * call dein#call_hook('post_source')
"End dein Scripts-------------------------


for file in split(glob("$root/config/*.vim"), '\n')
    execute 'source' file
endfor
" Required:
filetype plugin indent on
syntax enable
" 颜色主题放在这里

" set background=light
colorscheme one

lua require("lsp_config")


if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

