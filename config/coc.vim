let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
let g:coc_status_error_sign = '✗'
let g:coc_status_warning_sign = '⚡'
let g:coc_global_extensions =[
    \ 'coc-snippets',
    \ 'coc-json',
    \ 'coc-highlight',
    \ 'coc-clangd',
    \ 'coc-texlab',
    \ 'coc-emoji',
    \ 'coc-lists',
    \ 'coc-vimlsp',
    \ 'coc-pyright',
    \ 'coc-toml',
    \ 'coc-explorer'
    \ ]
let g:coc_default_semantic_highlight_groups = 1
augroup coc_event
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight symbol under cursor on CursorHold
if dein#tap('coc.nvim')
    autocmd CursorHold * silent call CocActionAsync('highlight')

" 刷新补全列表
    " autocmd TextChangedI * silent call coc#refresh()
    " autocmd CursorMovedI * silent call coc#refresh()
    " autocmd TextChangedP * silent call coc#refresh()
endif
"Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" float window scroll
nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
" coc-snippet
nmap <leader>s :CocCommand snippets.editSnippets<cr>
" Use :Format for format current buffer
command! -nargs=0 Format :call CocAction('format')
