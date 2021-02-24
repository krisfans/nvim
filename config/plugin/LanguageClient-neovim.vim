set hidden
set signcolumn=yes
set completeopt-=preview
" set completefunc=LanguageClient#complete
let g:LanguageClient_hoverPreview = 'always'
let g:LanguageClient_loggingFile =  expand('~/AppData/Local/Temp/LanguageClient.log')
let g:LanguageClient_useFloatingHover = 1
let g:LanguageClient_usePopupHover = 1
let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsEnable = 0
let g:neosnippet#enable_complete_done = 1 " use neosnippet


let g:LanguageClient_serverCommands = {
			\ 'c': ['clangd'],
			\ 'cpp': ['clangd'],
			\ 'objc': ['clangd'],
			\ 'python': ['pyls'],
			\ 'tex':['texlab'],
			\ }

nnoremap gd <Plug>(lcn-definition)
nnoremap gr <Plug>(lcn-references)
nnoremap gi <Plug>(lcn-implementation)
nnoremap <space>lr <Plug>(lcn-rename)
nnoremap <space>lt <Plug>(lcn-type-definition)
nnoremap <space>lh <Plug>(lcn-highlight)
nnoremap <space>lm <Plug>(lcn-menu)
nnoremap <space>le <Plug>(lcn-explain-error)
nnoremap [d <Plug>(lcn-diagnostics-prev)
nnoremap ]d <Plug>(lcn-diagnostics-next)
nnoremap <silent>K <Plug>(lcn-hover)

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorHold * silent call LanguageClient#textDocument_documentHighlight()<cr>

" function SetLSPShortcuts()
" 	nnoremap  gd :call LanguageClient#textDocument_definition()<CR>
" 	nnoremap  rn :call LanguageClient#textDocument_rename()<CR>
" 	nnoremap  lf :call LanguageClient#textDocument_formatting()<CR>
" 	nnoremap  lt :call LanguageClient#textDocument_typeDefinition()<CR>
" 	nnoremap  gr :call LanguageClient#textDocument_references()<CR>
" 	nnoremap  la :call LanguageClient_workspace_applyEdit()<CR>
" 	nnoremap  lc :call LanguageClient#textDocument_completion()<CR>
" 	nnoremap  lh :call LanguageClient#textDocument_hover()<CR>
" 	nnoremap  ls :call LanguageClient_textDocument_documentSymbol()<CR>
" 	nnoremap  lm :call LanguageClient_contextMenu()<CR>
" endfunction()

" augroup LSP
" 	autocmd!
" 	autocmd FileType cpp,c,python,tex call SetLSPShortcuts()
" augroup END
" This will ensure that LSP shortcuts are enabled only for source files in C++ or C.
" If you use other language servers for LanguageClient-neovim, just add more filetypes to the autocmd.





