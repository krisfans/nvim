"--ale--"
" Always show the signcolumn, otherwise it would shift the text each time
let g:ale_completion_enabled = 0
let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 1
"keep the sign gutter open
""打开文件时不进行检查
let g:ale_virtualtext_cursor = 1
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'always'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1   " use quickfix list instead of the loclist 'pyls'
let g:ale_linters = {
            \   'c':['clang'],
            \   'cpp': ['clang'],
            \   'tex': ['texlab'],
            \   'python': ['flake8', 'yapf'],
            \ }
let g:ale_echo_msg_error_str = '✗'
let g:ale_echo_msg_warning_str = '⚡'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_flake8_options = '--ignore=E501,W291,E2'
let g:ale_c_clang_options = '-Wall -O2 -std=c99'
nmap <space>ep <Plug>(ale_previous_wrap)
nmap <space>en <Plug>(ale_next_wrap)
"<space>d查看错误或警告的详细信息
nmap <space>ed :ALEDetail<CR>
"----"
