" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set shortmess+=c " Avoid showing message extra message when using completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Or you want to use <Tab> as trigger keys
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
let g:completion_matching_strategy_list = ['exact', 'substring']
" ['exact', 'substring', 'fuzzy', 'all']
let g:completion_matching_smart_case = 1
" let g:completion_trigger_keyword_length = 1
let g:completion_enable_snippet = 'Neosnippet'
let g:completion_chain_complete_list = [
            \{'complete_items': ['path'], 'triggered_only': ['/']},
            \{'complete_items': ['lsp', 'buffers', 'snippet']},
            \{'mode': '<c-p>'},
            \{'mode': '<c-n>'}
            \]
let g:completion_auto_change_source = 1
