

nmap <space>ns :NeoSnippetEdit<cr>
"let g:neosnippet#enable_conceal_markers=0
" let g:neosnippet#snippets_directory=['$HOME/.cache/vim/plugins/neosnippet-snippets/neosnippets']
let g:neosnippet#snippets_directory=['$HOME/AppData/Local/nvim/myneosnippet']
" let g:neosnippet#snippets_directory= '$HOME/AppData/Local/nvim/neosnippets,$HOME/.cache/vim/plugins/neosnippet-snippets'

let g:neosnippet#enable_completed_snippet=1
let g:neosnippet#enable_complete_done = 1

imap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<c-j>" : "\<tab>"
smap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"