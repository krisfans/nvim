
"--------------------------
"     vim-buffet Keymap    "

nnoremap  ]b :<C-u>bn<CR>
nnoremap  [b :<C-u>bp<CR>
nnoremap <silent> <Leader>bc :Bonly<CR>
nnoremap <silent> <Leader>bx :Bw<CR>
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

" defx --------------------
" nnoremap <silent> <F10>
"             \ :<C-u>Defx -resume -toggle `expand('%:p:h')` -search=`expand('%:p')`<CR>
nnoremap <silent> <F9> :CocCommand explorer<cr>
nnoremap <silent> <F12>
            \ :<C-u>Fern -drawer -toggle -width=30 %:h<CR>

" "     vim-clap Keymap
" nnoremap <silent> <Leader>fh :<C-u>Clap history<CR>
" nnoremap <silent> <Leader>ff :<C-u>Clap files ++finder=rg --ignore --hidden --files<cr>
" nnoremap <silent> <Leader>fc :<C-u>Clap colors<CR>
" nnoremap <silent> <Leader>fb :<C-u>Clap buffers<CR>
" nnoremap <silent> <Leader>fg :<C-u>Clap grep<CR>
" nnoremap <silent> <Leader>fm :<C-u>Clap marks<CR>
" nnoremap <silent> <Leader>fk :<C-u>Clap keymaps<CR>

" "like emacs counsel-find-file
" nnoremap <silent> <C-x><C-f> :<C-u>Clap filer<CR>
" nnoremap <silent> <Leader>fg :<C-u>Clap gfiles<CR>
" nnoremap <silent> <Leader>fa :<C-u>Clap grep ++query=<cword><cr>
" nnoremap <silent> <Leader>fW :<C-u>Clap windows<CR>
" nnoremap <silent> <Leader>fl :<C-u>Clap loclist<CR>
" nnoremap <silent> <Leader>fu :<C-u>Clap git_diff_files<CR>
"--------------------------"
"     coc-clap Keymap      "
"--------------------------"
" Show all diagnostics
" nnoremap <silent> <Leader>ce  :Clap coc_diagnostics<CR>
" " Manage extensions
" nnoremap <silent> <Leader>;   :Clap coc_extensions<CR>
" " Show commands
" nnoremap <silent> <Leader>,   :Clap coc_commands<CR>
" " Search workspace symbols
" nnoremap <silent> <Leader>cs  :Clap coc_symbols<CR>
" nnoremap <silent> <Leader>cS  :Clap coc_services<CR>
" nnoremap <silent> <leader>ct  :Clap coc_outline<CR>
nnoremap <silent> <leader>fh :<C-u>Telescope mru<CR>
nnoremap <silent> <leader>fc :<C-u>Telescope colorscheme<CR>
nnoremap <silent> <leader>fb :<C-u>Telescope buffers<CR>
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>fk <cmd>Telescope keymaps<cr>
nnoremap <silent> <leader>fl :<C-u>Telescope loclist<CR>
nnoremap <silent> <leader>fm :<C-u>Telescope marks<CR>
nnoremap <silent> <leader>ff <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>
nnoremap <silent> <leader>ft <cmd>Telescope help_tags<cr>
nnoremap <silent>  <leader>; :<C-u>Telescope buildin<CR>


" 注释 ---------------------
function! InitCaw() abort
    if ! (&l:modifiable && &buftype ==# '')
        silent! nunmap <buffer> <leader>/
        silent! xunmap <buffer> <leader>/
    else
        nmap <buffer> <leader>/ <Plug>(caw:hatpos:toggle)
        xmap <buffer> <leader>/ <Plug>(caw:hatpos:toggle)
    endif
endfunction
autocmd FileType * call InitCaw()


nmap dsf <Plug>DsfDelete
nmap csf <Plug>DsfChange

let g:splitjoin_join_mapping = ''
let g:splitjoin_split_mapping = ''
nmap sj :SplitjoinJoin<CR>
nmap sk :SplitjoinSplit<CR>

"--------------------------"
"     Coc Keymap           "
"--------------------------"

" dein ----------------

command! -nargs=0 PluginInstall :call dein#install()
command! -nargs=0 PluginUpdate :call dein#update()
command! -nargs=0 PluginRecache :call dein#recache_runtimepath()
command! -nargs=0 PluginClean :call map(dein#check_clean(), "delete(v:val, 'rf')") | :call dein#recache_runtimepath()

" 其他
nnoremap Q :Bclose<cr>

vmap <Enter> <Plug>(EasyAlign)


function! s:Lsp_my_mapping()
if dein#tap('coc.nvim') && g:registered_lsp ==# 'coc'
    " CocLSP
    " nmap <silent> gd <Plug>(coc-definition)
    nmap gd             :call function#JumpDefinition()<cr>
    nmap gr             <Plug>(coc-references)
    nmap gi             <Plug>(coc-implementation)
    nmap <Leader>lr     <Plug>(coc-rename)
    nmap <Leader>lT     <Plug>(coc-type-definition)
    nmap <leader>lf     :call CocAction('format')<CR>
    nmap <leader>lk     :call CocActionAsync('doHover')<CR>
    nmap  [e            <Plug>(coc-diagnostic-prev)
    nmap  ]e            <Plug>(coc-diagnostic-next)
    nmap <Leader>lt     :<C-u>Vista!!<CR>
    " Applying codeAction to the selected region.
    xmap <leader>la  <Plug>(coc-codeaction-selected)
    nmap <leader>la  <Plug>(coc-codeaction-selected)
    nmap <leader>ca  <Plug>(coc-codeaction-cursor)
    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>lq  <Plug>(coc-fix-current)
    " Do default action for next item.
    nmap <silent> [a  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nmap <silent> ]a  :<C-u>CocPrev<CR>
    " Remap for rename current word
    " Remap for format selected region
    vmap <Leader>cf  <Plug>(coc-format-selected)
    nmap <Leader>cf  <Plug>(coc-format-selected)
    " Fix autofix problem of current line
    nmap <Leader>cF  <Plug>(coc-fix-current)

elseif dein#tap('nvim-lspconfig') && g:registered_lsp ==# 'nvim_lsp'
        " Jump Diagnostic and Show Diagnostics
    nmap <Leader>lt     :<C-u>Vista!!<CR>
    nnoremap <silent>       <space>cd :Lspsaga show_line_diagnostics<CR>
    nnoremap gD             <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap gd             :call function#JumpDefinition()<CR>
    nnoremap gr             <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap gi             <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap gh             :Lspsaga lsp_finder<CR>
    nnoremap gs             :Lspsaga signature_help<CR>
    nnoremap <space>lf     <cmd>lua vim.lsp.buf.formatting()<CR>
    nnoremap <space>lk     <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <space>ls     :Lspsaga signature_help<CR>
    nnoremap <space>wa      <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
    nnoremap <space>wr      <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
    nnoremap <space>wl      <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
    nnoremap <space>D       <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <space>lr      :Lspsaga rename<CR>
    nnoremap <space>ld      :Lspsaga show_line_diagnostics<CR>
    nnoremap [e             <cmd>lua vim.diagnostic.goto_prev()<CR><CR>
    nnoremap ]e             <cmd>lua vim.diagnostic.goto_next()<CR>
    nnoremap <space>lq      <cmd>lua vim.diagnostic.setloclist()<CR><CR>
    nnoremap <space>ca     :Lspsaga code_action<CR>
    vnoremap <space>ca     :<C-U>Lspsaga range_code_action<CR>
endif
endfunction
call s:Lsp_my_mapping()

