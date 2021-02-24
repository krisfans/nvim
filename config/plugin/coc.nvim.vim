let g:coc_start_at_startup=0
nmap <space>ec :CocStart<cr>

set encoding=utf-8
"--------------coc 设置---------------------"{{{
set updatetime=200
" diagnostics appear/become resolved.
"set signcolumn=yes
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif
" Use `[g` and `]g` to navigate diagnostics
"nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
"nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
" Symbol renaming.
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" TextEdit might fail if hidden is not set.
set hidden
inoremap <silent><expr> <TAB>
			\ pumvisible() ? coc#_select_confirm() :
			\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
nnoremap <leader>s :CocCommand snippets.openSnippetFiles<cr>
"nnoremap <space>o :CocList --normal outline<cr>

" popup  coc-translator
" NOTE: do NOT use `nore` mappings
" popup
nmap tp <Plug>(coc-translator-p)
vmap tp <Plug>(coc-translator-pv)
" echo
nmap te <Plug>(coc-translator-e)
vmap te <Plug>(coc-translator-ev)



