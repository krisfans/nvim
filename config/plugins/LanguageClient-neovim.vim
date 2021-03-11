set hidden
set signcolumn=yes
set completeopt-=preview
" set completefunc=LanguageClient#complete
let g:LanguageClient_hoverPreview = 'always'
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile =  expand('~/AppData/Local/Temp/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/AppData/Local/Temp/LanguageServer.log')
let g:LanguageClient_useFloatingHover = 1
let g:LanguageClient_usePopupHover = 1
let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
			\ 'c': ['clangd'],
			\ 'cpp': ['clangd'],
			\ 'objc': ['clangd'],
			\ 'python': ['pyls'],
			\ 'tex': ['texlab'],
			\ }
" function SetLSPShortcuts()
"     nnoremap gd :call LanguageClient_textDocument_definition()<CR>
"     nnoremap gr :call LanguageClient_textDocument_references()<CR>
"     nnoremap gi :call LanguageClient_textDocument_implementation()<CR>
"     nnoremap [d :call LanguageClient_diagnosticsPrevious()<CR>
"     nnoremap ]d :call LanguageClient_diagnosticsNext()<CR>
"     nnoremap <space>lr :call LanguageClient_textDocument_rename()<CR>
"     nnoremap <space>lt :call LanguageClient_textDocument_typeDefinition()<CR>
"     nnoremap <space>lh :call LanguageClient_textDocument_documentHighlight()<CR>
"     nnoremap <space>lm :call LanguageClient_contextMenu()<CR>
"     nnoremap <space>le :call LanguageClient_textDocument_explainErrorAtPoint()<CR>
"     nnoremap <space>lk :call LanguageClient_textDocument_hover()<CR>
" endfunction()

function SetLSPShortcuts()
    nmap gd <Plug>(lcn-definition)
    nmap gr <Plug>(lcn-references)
    nmap gi <Plug>(lcn-implementation)
    nmap [d <Plug>(lcn-diagnostics-prev)
    nmap ]d <Plug>(lcn-diagnostics-next)
    nmap <space>lr <Plug>(lcn-rename)
    nmap <space>lt <Plug>(lcn-type-definition)
    nmap <space>lh <Plug>(lcn-highlight)
    nmap <space>lm <Plug>(lcn-menu)
    nmap <space>le <Plug>(lcn-explain-error)
    nmap <space>lk <Plug>(lcn-hover)
endfunction()
augroup LSPShortcuts
	autocmd!
	autocmd FileType cpp,c,python,tex call SetLSPShortcuts()
augroup END

" function! MyTexStopStart()
"     exec "LanguageClientStop"
"     exec "LanguageClientStart"
" endfunction
" augroup LSPMyTex
"     autocmd!
"     autocmd FileType tex call MyTexStopStart()
" augroup END

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" *(lcn-menu)*
" Calls LanguageClient_contextMenu.

" *(lcn-hover)*
" Calls LanguageClient_textDocument_hover.

" *(lcn-rename)*
" Calls LanguageClient_textDocument_rename.

" *(lcn-definition)*
" Calls LanguageClient_textDocument_definition.

" *(lcn-type-definition)*
" Calls LanguageClient_textDocument_typeDefinition.

" *(lcn-references)*
" Calls LanguageClient_textDocument_references.

" *(lcn-implementation)*
" Calls LanguageClient_textDocument_implementation.

" *(lcn-code-action)*
" Calls LanguageClient_textDocument_codeAction if called in normal model or
" LanguageClient_textDocument_visualCodeAction if called in visual mode.

" *(lcn-code-lens-action)*
" Calls LanguageClient_handleCodeLensAction.

" *(lcn-symbols)*
" Calls LanguageClient_textDocument_documentSymbol.

" *(lcn-highlight)*
" Calls LanguageClient_textDocument_documentHighlight.

" *(lcn-explain-error)*
" Calls LanguageClient_textDocument_explainErrorAtPoint.

" *(lcn-format)*
" Calls LanguageClient_textDocument_formatting.

" *(lcn-format-sync)*
" Calls LanguageClient_textDocument_formatting_sync.

" *(lcn-diagnostics-next)*
" Calls LanguageClient_diagnosticsNext.

" *(lcn-diagnostics-prev)*
" Calls LanguageClient_diagnosticsPrevious.


" This will ensure that LSP shortcuts are enabled only for source files in C++ or C.
" If you use other language servers for LanguageClient-neovim, just add more filetypes to the autocmd.





