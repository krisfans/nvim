"--deoplete设置--"
" let g:deoplete#enable_at_startup = 1 " 自启动
set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set shortmess+=c " Avoid showing message extra message when using completion
"" 补全结束或离开插入模式时，关闭预览窗口
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
call deoplete#custom#option({
            \ 'auto_complete_delay': 10,
            \ 'auto_refresh_delay': 20,
            \ 'smart_case': v:true,
            \ 'sources': {'_':[]},
            \ })
            " 用户输入至少两个字符时再开始提示补全
call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)
call deoplete#custom#source('file',{
            \ 'enable_slash_completion': v:true,
            \ })
"highlight Pmenu ctermbg=8 guibg=#606060
"highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
"highlight PmenuSbar ctermbg=0 guibg=#d6d6d6
autocmd InsertEnter * call deoplete#enable()
