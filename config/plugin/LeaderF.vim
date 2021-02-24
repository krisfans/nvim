let g:Lf_HideHelp = 1
" 使用leaderf file path的时候不更改目录到path
let g:Lf_NoChdir = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
"let g:Lf_WindowPosition = 'popup'
"let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'



"Leaderf settings
" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
"let g:Lf_Gtagslabel = 'default'
noremap <space>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <space>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <space>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <space>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <space>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
noremap <space>o :LeaderfFunction!<cr>
"文件搜索
nnoremap  <space>f :Leaderf file<CR>
"历史打开过的文件
nnoremap <space>m :Leaderf mru<CR>
"Buffer
nnoremap <space>b :Leaderf buffer<CR>
"函数搜索（仅当前文件里）
nnoremap  <space>F :Leaderf function<CR>
"模糊搜索，很强大的功能，迅速秒搜
nnoremap <space>rg :Leaderf rg<CR>
