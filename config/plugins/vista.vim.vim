
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

let g:vista_default_executive = 'ctags'
if has('nvim')
    let g:vista_executive_for = {
                \ 'cpp': 'nvim_lsp',
                \ 'c': 'nvim_lsp',
                \ 'python': 'nvim_lsp'
                \ }
else
    let g:vista_executive_for = {
                \ 'cpp': 'lcn',
                \ 'c': 'lcn',
                \ 'python': 'lcn'
                \ }
endif

let g:vista#renderer#enable_icon = 1
    " let g:vista#renderer#icons = {
    "     \   "function": "\uf794",
    "     \   "variable": "\uf005",
    "     \   "variables": "\uf005",
    "     \   "maps": "\uf279",
    "     \   "members": "\ufa85",
    "     \   "classes": "\ue61e",
    "     \   "autocommand groups": "\uf7c2",
    "     \  }
let g:vista_sidebar_width = 30

func! MyVistaToggle()
    if &ft == "tex"
        exec "VimtexTocToggle"
    else
        exec "Vista!!"
    endif
endfunc

nnoremap <space>lT :call MyVistaToggle()<cr>
