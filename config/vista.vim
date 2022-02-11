let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_disable_statusline = 1
" if g:registered_lsp ==# "coc"
"     let g:vista_default_executive = 'coc'
" elseif g:registered_lsp ==# "nvim_lsp"
"     let g:vista_default_executive = 'nvim_lsp'
" else
"     let g:vista_default_executive = 'ctags'
" endif
" let g:vista_echo_cursor_strategy = 'echo'
" let g:vista_echo_cursor = 0
let g:vista_vimwiki_executive = 'markdown'
" let g:vista_executive_for = {
"    \ 'c': 'coc',
"    \ 'cpp': 'coc',
"    \ 'vimwiki': 'markdown',
"    \ 'pandoc': 'markdown',
"    \ 'markdown': 'coc',
"    \ 'yaml': 'coc',
"    \ 'typescript': 'coc',
"    \ 'typescriptreact': 'coc',
"    \ }
let g:vista#renderer#icons = {}
let g:vista#renderer#icons = {
    \ 'func': "",
    \ 'function': "",
    \ 'functions': "",
    \ 'var': "𝒙",
    \ 'variable': "𝒙",
    \ 'variables': "𝒙",
    \ 'const': "",
    \ 'constant': "",
    \ 'constructor': "略",
    \ 'method': "",
    \ 'package': "",
    \ 'packages': "",
    \ 'enum': "",
    \ 'enummember': "",
    \ 'enumerator': "",
    \ 'module': "",
    \ 'modules': "",
    \ 'type': "",
    \ 'typedef': "",
    \ 'types': "",
    \ 'field': "",
    \ 'fields': "",
    \ 'macro': "",
    \ 'macros': "",
    \ 'map': "פּ",
    \ 'class': "",
    \ 'augroup': "פּ",
    \ 'struct': "",
    \ 'union': "鬒",
    \ 'member': "",
    \ 'target': "",
    \ 'property': "襁",
    \ 'prototype': "襁",
    \ 'interface': "",
    \ 'namespace': "",
    \ 'subroutine': "羚",
    \ 'implementation': "",
    \ 'typeParameter': "",
    \ 'default': "",
    \ 'label': '笠',
    \ 'chapter': '',
    \ 'section': '',
    \ 'subsection': '',
    \ 'subsubsection': '',
    \ }
