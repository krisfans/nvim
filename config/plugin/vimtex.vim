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

let g:tex_flavor  = 'latex'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
			\ 'background': 1,
			\ 'build_dir': '',
			\ 'callback': 1,
			\ 'continuous': 0,
			\ 'executable': 'latexmk',
			\ 'options': [
			\   '-shell-escape',
			\   '-file-line-error',
			\   '-synctex=1',
			\   '-interaction=nonstopmode',
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
let g:vimtex_syntax_conceal_default = 0

"nmap <space>k <plug>(vimtex-doc-package)
"     Esc或q退出目录
"     Space跳转
"     Enter跳转并关闭目录

" \li查看latex项目信息，按Esc或q退出
" \lm查看内置的imaps
"
" TOC settings
"let g:vimtex_toc_config = {
			"\ 'name' : 'TOC',
			"\ 'layers' : ['content', 'todo', 'include'],
			"\ 'todo_sorted' : 0,
			"\ 'show_help' : 1,
			"\ 'show_numbers' : 1,
			"\ 'mode' : 2,
			"\ 'split_width' : 50,
			"\ 'split_pos' : 'vert botright',
			"\}


" augroup vime_vimtex_group
    " autocmd!
    " autocmd FileType tex setl tw=80 fo+=tmM fo-=l spell spelllang=nl,en_gb
    " autocmd FileType tex setl fo+=t
    " autocmd FileType tex setl fo-=l
    " autocmd FileType tex setl fo+=mM
    " autocmd FileType tex setl spell
    " autocmd FileType tex setl spelllang=nl,en_gb
    " " autocmd FileType tex setl conceallevel=0
" augroup END
augroup vimtex_group
	autocmd FileType tex setl nospell
	autocmd Filetype tex let g:AutoPairs['$']='$'
augroup END

