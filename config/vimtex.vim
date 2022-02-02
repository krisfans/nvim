function! SetServerName()
    if has('win32')
        let nvim_server_file = $TEMP . "/curnvimserver.txt"
    else
        let nvim_server_file = "/tmp/curnvimserver.txt"
    endif
    let cmd = printf("echo %s > %s", v:servername, nvim_server_file)
    call system(cmd)
endfunction

augroup vimtex_common
    autocmd!
    autocmd FileType tex call SetServerName()
augroup END

if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
endif
if executable('SumatraPDF.exe')
    let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
    let g:vimtex_view_general_options = '-reuse-instance @pdf'
else
    let g:vimtex_view_general_viewer = 'zathura'
    let g:vimtex_view_method = 'zathura'
endif
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'background': 1,
    \ 'build_dir': '',
    \ 'callback': 1,
    \ 'continuous': 0,
    \ 'executable': 'latexmk',
    \ 'options': [
    \     '-shell-escape',
    \     '-file-line-error',
    \     '-synctex=1',
    \     '-interaction=nonstopmode',
    \ ],
    \ }
let g:vimtex_compiler_latexmk_engines = {
    \ '_'        : '-xelatex',
    \ 'xelatex'  : '-xelatex',
    \ 'pdflatex' : '-pdf',
    \ }
" 隐藏模式"
set conceallevel=0
let g:tex_conceal = ''

"nmap <space>k <plug>(vimtex-doc-package)
"     Esc或q退出目录
"     Space跳转
"     Enter跳转并关闭目录

" \li查看latex项目信息，按Esc或q退出
" \lm查看内置的imaps
"
" TOC settings
let g:vimtex_toc_config = {
    \ 'name' : 'TOC',
    \ 'layers' : ['content', 'include'],
    \ 'show_help' : 1,
    \ 'show_numbers' : 1,
    \ 'mode' : 2,
    \ 'split_width' : 30,
    \ 'split_pos' : 'vert botright',
    \ }

augroup my_vimtex_group
    autocmd FileType tex setl nospell
    autocmd FileType tex set syn=tex
augroup END
