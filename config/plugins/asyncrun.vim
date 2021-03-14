" automatically open quickfix window when AsyncRun command is executed
" set the quickfix window 6 lines height.
let g:asyncrun_open = 6

" ring the bell to notify you job finished
" let g:asyncrun_bell = 1
nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" F10 to toggle quickfix window
"
nnoremap <silent> <F5> :AsyncRun -mode=term -pos=bottom -rows=10 -cwd=$(VIM_FILEDIR) "time $(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

