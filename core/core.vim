if &compatible
  set nocompatible
endif

" Set main configuration directory as parent directory
let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

" Set data/cache directory as $XDG_CACHE_HOME/nvim
if has("nvim")
let $DATA_PATH =
  \ expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/nvim')
else
let $DATA_PATH =
  \ expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/vim')
endif
" LSP 客服端 coc nivm_lsp
let g:registered_lsp = "nvim_lsp"
" 补全插件 coc or ddc or cmp
let g:registered_completion = "ddc"
" 代码片段 vnsip ultisnip snippy
let g:registered_snippet = "vsnip"



" Disable vim distribution plugins
let g:loaded_gzip = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1

let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_2html_plugin = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

" Initialize base requirements
if has('vim_starting')
  " Use spacebar as leader and ; as secondary-leader
  " Required before loading plugins!
  let g:mapleader="\<Space>"
  " let g:maplocalleader="\<Space>"

  " Release keymappings prefixes, evict entirely for use of plug-ins.
  nnoremap <Space>  <Nop>
  xnoremap <Space>  <Nop>
  nnoremap ,        <Nop>
  xnoremap ,        <Nop>
  nnoremap ;        <Nop>
  xnoremap ;        <Nop>

endif

call initself#source_file($VIM_PATH,'core/dein.vim')
call initself#source_file($VIM_PATH,'core/general.vim')
call initself#source_file($VIM_PATH,'core/event.vim')
call initself#source_file($VIM_PATH,'core/pmap.vim')
call initself#source_file($VIM_PATH,'core/vmap.vim')
call theme#theme_init()

set secure

" vim: set ts=2 sw=2 tw=80 noet :
