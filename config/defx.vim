call defx#custom#option('_', {
    \ 'winwidth': 30,
    \ 'split': 'vertical',
    \ 'direction': 'topleft',
    \ 'show_ignored_files': 0,
    \ 'columns': 'git:indent:indent:icons:filename',
    \ 'floating_preview': 1,
    \ 'vertical_preview': 1,
    \ 'preview_height': 50,
    \ })
call defx#custom#column('mark', { 'readonly_icon': '', 'selected_icon': '' })
" Events
" ---
augroup user_plugin_defx
autocmd!
    " Delete defx if it's the only buffer left in the window
    autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif
    " Move focus to the next window if current buffer is defx
    autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif

    " Define defx window mappings
    autocmd FileType defx call <SID>defx_mappings()
    autocmd FileType defx setlocal shiftwidth=2  tabstop=2  softtabstop=2
    autocmd FileType defx setlocal noautochdir nonumber  norelativenumber signcolumn=yes
    autocmd FileType defx let b:indent_blankline_show_first_indent_level = v:false
    autocmd FileType defx let b:indent_blankline_enabled = v:false

augroup END
    " Internal functions
function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction
function! s:defx_mappings() abort
    " Defx window keyboard mappings
    nnoremap <silent><buffer><expr> l     defx#do_action('drop')
    nnoremap <silent><buffer><expr> h     defx#async_action('cd', ['..'])
    nnoremap <silent><buffer><expr> <cr>  <sid>defx_toggle_tree()
    nnoremap <silent><buffer><expr> <BS>  defx#async_action('cd', ['..'])
    nnoremap <silent><buffer><expr> st    defx#do_action('multi', [['drop', 'tabnew'], 'quit'])
    nnoremap <silent><buffer><expr> s     defx#do_action('open', 'botright vsplit')
    nnoremap <silent><buffer><expr> i     defx#do_action('open', 'botright split')
    nnoremap <silent><buffer><expr> N     defx#do_action('new_file')                      " 新建文件/文件夹
    nnoremap <silent><buffer><expr> D     defx#do_action('remove')                        " 删除
    nnoremap <silent><buffer><expr> Y     defx#do_action('copy')                          " 复制
    nnoremap <silent><buffer><expr> P     defx#do_action('paste')                         " 粘贴
    nnoremap <silent><buffer><expr> K     defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> V     defx#do_action('preview')
    nnoremap <silent><buffer><expr> K     defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N     defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> r     defx#do_action('rename')
    nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> yp    defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> ~     defx#async_action('cd')
    nnoremap <silent><buffer><expr> q     defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Tab> winnr('$') != 1 ?
    \ ':<C-u>wincmd w<CR>' :
    \ ':<C-u>Defx -buffer-name=temp -split=vertical<CR>'
    " Defx's buffer management
    nnoremap <silent><buffer><expr> q      defx#do_action('quit')
    nnoremap <silent><buffer><expr> se     defx#do_action('save_session')
    nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')
    " File/dir management
    nnoremap <silent><buffer><expr><nowait> c  defx#do_action('copy')
    nnoremap <silent><buffer><expr><nowait> m  defx#do_action('move')
    nnoremap <silent><buffer><expr><nowait> p  defx#do_action('paste')
    nnoremap <silent><buffer><expr><nowait> r  defx#do_action('rename')
    nnoremap <silent><buffer><expr> N          defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> cd         defx#do_action('change_vim_cwd')                " 将当前目录设置为工作目录
    " Change directory
    nnoremap <silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
    nnoremap <silent><buffer><expr><nowait> &  defx#do_action('cd', getcwd())
    nnoremap <silent><buffer><expr> ~     defx#async_action('cd')
    nnoremap <silent><buffer><expr> u   defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> 2u  defx#do_action('cd', ['../..'])
    " Selection
    nnoremap <silent><buffer><expr> *  defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr><nowait> <Space>
    \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'Time')
    nnoremap <silent><buffer><expr> C
    \ defx#do_action('toggle_columns', 'indent:mark:filename:type:size:time')
endfunction

