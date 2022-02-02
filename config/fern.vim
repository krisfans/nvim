let g:fern#renderer = "nerdfont"
let g:fern#renderer#nerdfont#leading = "  "
function! s:fern_local_init() abort
    nmap <buffer>
        \ <Plug>(fern-action-expand)
        \ <Plug>(fern-action-expand:stay)
    " nmap <buffer>
        "\ <Plug>(fern-my-leave-and-tcd)
        "\ <Plug>(fern-action-leave)<Plug>(fern-wait)<Plug>(fern-action-tcd:root)
    nmap <buffer><expr>
        \ <Plug>(fern-my-open-or-expand-or-collapse)
        \ fern#smart#leaf(
        \   "<Plug>(fern-action-open)",
        \   "<Plug>(fern-action-expand)",
        \   "<Plug>(fern-action-collapse)",
        \ )
    nmap <buffer><nowait> <Return>    <Plug>(fern-my-open-or-expand-or-collapse)
    nmap <buffer><nowait> <Backspace> <Plug>(fern-action-leave)
    nmap <buffer><nowait> l <Plug>(fern-action-open-or-enter)
    nmap <buffer><nowait> h <Plug>(fern-action-leave)
    nmap <buffer><nowait> T <Plug>(fern-action-terminal)
    nmap <buffer><nowait> . <Plug>(fern-action-hidden:toggle)
    nmap <buffer><nowait> cd <Plug>(fern-action-cd:cursor)

    nmap <buffer><nowait> n <Plug>(fern-action-new-file)
    nmap <buffer><nowait> N <Plug>(fern-action-new-path)
    nmap <buffer><nowait> m <Plug>(fern-action-clipboard-move)
    nmap <buffer><nowait> c <Plug>(fern-action-clipboard-copy)
    nmap <buffer><nowait> p <Plug>(fern-action-clipboard-paste)
    nmap <buffer><nowait> D <Plug>(fern-action-remove)
    nmap <buffer><nowait> q :q<cr>
    nmap <buffer><nowait> r <Plug>(fern-action-rename:select)
    nmap <buffer><nowait> yp <Plug>(fern-action-yank:path)

endfunction

augroup my-fern
    autocmd! *
    autocmd FileType fern call s:fern_local_init()
    autocmd FileType fern setlocal shiftwidth=2  tabstop=2  softtabstop=2
    autocmd FileType fern setlocal nonumber  norelativenumber signcolumn=yes
augroup END
augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
