
"--------------------------"
"     vim-buffet Keymap    "
"--------------------------"
nnoremap  ]b :<C-u>bp<CR>
nnoremap  [b :<C-u>bn<CR>
nnoremap <silent> <Leader>bc :Bonly<CR>
nnoremap <silent> <Leader>bx :Bw<CR>
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

" defx --------------------
nnoremap <silent> <f9>
            \ :<C-u>Defx -resume -toggle `expand('%:p:h')` -search=`expand('%:p')`<CR>

"--------------------------"
"     vim-clap Keymap      "
"--------------------------"
nnoremap <silent> <Leader>cc :<C-u>Clap colors<CR>
nnoremap <silent> <Leader>fb :<C-u>Clap buffers<CR>
nnoremap <silent> <Leader>fw :<C-u>Clap grep<CR>
nnoremap <silent> <Leader>fm :<C-u>Clap marks<CR>
"like emacs counsel-find-file
nnoremap <silent> <C-x><C-f> :<C-u>Clap filer<CR>
nnoremap <silent> <Leader>ff :<C-u>Clap files ++finder=rg --ignore --hidden --files<cr>
nnoremap <silent> <Leader>fg :<C-u>Clap gfiles<CR>
nnoremap <silent> <Leader>fa :<C-u>Clap grep ++query=<cword><cr>
nnoremap <silent> <Leader>fh :<C-u>Clap history<CR>
nnoremap <silent> <Leader>fW :<C-u>Clap windows<CR>
nnoremap <silent> <Leader>fl :<C-u>Clap loclist<CR>
nnoremap <silent> <Leader>fu :<C-u>Clap git_diff_files<CR>
nnoremap <silent> <Leader>fv :<C-u>Clap grep ++query=@visual<CR>
nnoremap <silent> <Leader>oc :<C-u>Clap personalconf<CR>

"--------------------------"
"     coc-clap Keymap      "
"--------------------------"
" Show all diagnostics
nnoremap <silent> <Leader>ce  :Clap coc_diagnostics<CR>
" Manage extensions
nnoremap <silent> <Leader>;   :Clap coc_extensions<CR>
" Show commands
nnoremap <silent> <Leader>,   :Clap coc_commands<CR>
" Search workspace symbols
nnoremap <silent> <Leader>cs  :Clap coc_symbols<CR>
nnoremap <silent> <Leader>cS  :Clap coc_services<CR>
nnoremap <silent> <leader>ct  :Clap coc_outline<CR>


" 注释 ---------------------
function! InitCaw() abort
    if ! (&l:modifiable && &buftype ==# '')
        " silent! nunmap <buffer> gc
        " silent! xunmap <buffer> gc
        silent! nunmap <buffer> <leader>/
        silent! xunmap <buffer> <leader>/
    else
        " nmap <buffer> gc <Plug>(caw:prefix)
        " xmap <buffer> gc <Plug>(caw:prefix)
        nmap <buffer> <leader>/ <Plug>(caw:hatpos:toggle)
        xmap <buffer> <leader>/ <Plug>(caw:hatpos:toggle)
    endif
endfunction
autocmd FileType * call InitCaw()
call InitCaw()



nmap <silent> sa <Plug>(operator-sandwich-add)
xmap <silent> sa <Plug>(operator-sandwich-add)
omap <silent> sa <Plug>(operator-sandwich-g@)
nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap <silent> sd <Plug>(operator-sandwich-delete)
nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)  xmap <silent> sr <Plug>(operator-sandwich-replace)
nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
omap ib <Plug>(textobj-sandwich-auto-i)
xmap ib <Plug>(textobj-sandwich-auto-i)
omap ab <Plug>(textobj-sandwich-auto-a)
xmap ab <Plug>(textobj-sandwich-auto-a)
omap is <Plug>(textobj-sandwich-query-i)
xmap is <Plug>(textobj-sandwich-query-i)
omap as <Plug>(textobj-sandwich-query-a)
xmap as <Plug>(textobj-sandwich-query-a)

silent! xmap I  <Plug>(niceblock-I)
silent! xmap gI <Plug>(niceblock-gI)
silent! xmap A  <Plug>(niceblock-A)

xmap v <Plug>(expand_region_expand)
xmap V <Plug>(expand_region_shrink)

nmap dsf <Plug>DsfDelete
nmap csf <Plug>DsfChange

let g:splitjoin_join_mapping = ''
let g:splitjoin_split_mapping = ''
nmap sj :SplitjoinJoin<CR>
nmap sk :SplitjoinSplit<CR>

xmap p <Plug>(operator-replace)

omap <silent> ab <Plug>(textobj-multiblock-a)
omap <silent> ib <Plug>(textobj-multiblock-i)
xmap <silent> ab <Plug>(textobj-multiblock-a)
xmap <silent> ib <Plug>(textobj-multiblock-i)

omap <silent> af <Plug>(textobj-function-a)
omap <silent> if <Plug>(textobj-function-i)
xmap <silent> af <Plug>(textobj-function-a)
xmap <silent> if <Plug>(textobj-function-i)

"--------------------------"
"     Coc Keymap           "
"--------------------------"
" CocLSP
" nmap <silent> gd <Plug>(coc-definition)
nmap gd             :call function#CocJumpDefinition()<cr>
nmap gr             <Plug>(coc-references)
nmap gi             <Plug>(coc-implementation)
nmap <Leader>lr     <Plug>(coc-rename)
nmap <Leader>lT     <Plug>(coc-type-definition)
nmap <leader>lf     :call CocAction('format')<CR>
nmap <leader>lk     :call CocActionAsync('doHover')<CR>
nmap  [e            <Plug>(coc-diagnostic-prev)
nmap  ]e            <Plug>(coc-diagnostic-next)
nmap <Leader>lt     :<C-u>Vista!!<CR>
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>la  <Plug>(coc-codeaction-selected)
nmap <leader>la  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-cursor)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>lq  <Plug>(coc-fix-current)
" Do default action for next item.
nmap <silent> [a  :<C-u>CocNext<CR>
" Do default action for previous item.
nmap <silent> ]a  :<C-u>CocPrev<CR>
" Remap for rename current word
" Remap for format selected region
vmap <Leader>cf  <Plug>(coc-format-selected)
nmap <Leader>cf  <Plug>(coc-format-selected)
" Fix autofix problem of current line
nmap <Leader>cF  <Plug>(coc-fix-current)
" Remap keys for gotos



" use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nmap ]g <Plug>(coc-git-prevchunk)
nmap [g <Plug>(coc-git-nextchunk)

" float window scroll
nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
" Add :OR command for organize imports of the current buffer.
command! -nargs=0 OR  :call CocAction('runCommand', 'editor.action.organizeImport')
nnoremap <silent> <Leader>co :<C-u>OR<CR>

" multiple cursors
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
    if !get(b:, 'coc_cursors_activated', 0)
        return "\<Plug>(coc-cursors-word)"
    endif
    return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

" coc-snippet
nmap <leader>s :CocCommand snippets.editSnippets<cr>
" Use :Format for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
nmap gcj :execute 'CocCommand docthis.documentThis'<CR>

" dein ----------------

command! -nargs=0 PluginInstall :call dein#install()
command! -nargs=0 PluginUpdate :call dein#update()
command! -nargs=0 PluginClean :call map(dein#check_clean(), "delete(v:val, 'rf')") | :call dein#recache_runtimepath()

" 其他
nnoremap Q :Bclose<cr>

vmap <Enter> <Plug>(EasyAlign)
