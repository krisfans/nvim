set encoding=utf-8
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 550)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)
let g:neomake_c_enabled_makers=['clang']
"let g:neomake_python_enabled_makers=['flake8', 'yapf']
let g:neomake_c_clang_args = '-Wall -O2 -std=c99 '
let g:neomake_error_sign = {
         \ 'text': '✗',
         \ 'texthl': 'NeomakeErrorSign',
         \ }
     let g:neomake_warning_sign = {
         \   'text': '⚡',
         \   'texthl': 'NeomakeWarningSign',
         \ }
"let g:neomake_virtualtext_prefix = ''
hi NeomakeVirtualtextError ctermbg=234 ctermfg=5 guifg=#e06c75
"hi NeomakeVirtualtextWarning ctermbg=234 ctermfg=5 guifg=yellow guibg=Red
