" ---编译、运行----"
func! RunResult()  " 先保存，再格式化，最后运行可执行文件
    exec "w"
    " exec "Neoformat"
    if has("win32")
        if  &filetype == "c"
            exec "!clang % -Wall -std=c99 -O2 -o %<.exe"
            exec "!start cmd /c  \"\"%<.exe\" & pause & del %:r.exe\""
        elseif &filetype == "cpp"
            exec "!clang++ % -Wall -std=c++11 -O2 -o %<.exe"
            exec "!start cmd /c  \"\"%<.exe\" & pause & del %:r.exe\""
        elseif &filetype == "tex"
            exec ":VimtexCompile"
        elseif &filetype == "fortran"
            exec "!gfortran % -Wall  -O2 -o %<.exe"
            exec "!start cmd /c  \"\"%<.exe\" & pause & del %r:.exe\""
        elseif &filetype == "lua"
            exec "!start cmd /c lua %<.lua & pause"
        elseif &filetype == "perl"
            exec "!start cmd /c perl %<.pl & pause"
        elseif &filetype == "python"
            exec "!start cmd /c \"python  %<.py & pause\""
        elseif &filetype == "markdown"
            exec "MarkdownPreview"
        endif
    else
        if &filetype == 'c'
            exec "!clang % -O2 -o %<"
            exec "new +resize10 term:// time ./%<"
            exec "!rm %<"
        elseif &filetype == 'cpp'
            exec "!clang++ -std=c++11 % -O2  -o %<"
            exec "new +resize10 term:// time ./%<"
            exec "!rm %<"
        elseif &filetype == "fortran"
            exec "!gfortran % -Wall  -O2 -o %<"
            exec "new +resize10 term:// time ./%<"
            exec "!rm %<"
        elseif &filetype == 'python'
            " set splitbelow
            :sp
            :term python3 %

        elseif &filetype == 'markdown'
            exec "InstantMarkdownPreview"
        elseif &filetype == 'tex'
            silent! exec "VimtexStop"
            silent! exec "VimtexCompile"
        endif
    endif
endfunc
" func! CompileRunGcc()
" 	exec "w"
" 	if &filetype == 'c'
" 		exec "!g++ % -o %<"
" 		exec "!time ./%<"
" 	elseif &filetype == 'cpp'
" 		set splitbelow
" 		exec "!g++ -std=c++11 % -Wall -o %<"
" 		:sp
" 		:res -15
" 		:term ./%<
" 	elseif &filetype == 'java'
" 		exec "!javac %"
" 		exec "!time java %<"
" 	elseif &filetype == 'sh'
" 		:!time bash %
" 	elseif &filetype == 'python'
" 		set splitbelow
" 		:sp
" 		:term python3 %
" 	elseif &filetype == 'html'
" 		silent! exec "!".g:mkdp_browser." % &"
" 	elseif &filetype == 'markdown'
" 		exec "InstantMarkdownPreview"
" 	elseif &filetype == 'tex'
" 		silent! exec "VimtexStop"
" 		silent! exec "VimtexCompile"
" 	elseif &filetype == 'dart'
" 		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
" 		silent! exec "CocCommand flutter.dev.openDevLog"
" 	elseif &filetype == 'javascript'
" 		set splitbelow
" 		:sp
" 		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
" 	elseif &filetype == 'go'
" 		set splitbelow
" 		:sp
" 		:term go run .
" 	endif
" endfunc



" Ctrl + b 一键保存、运行
map <C-b> :call RunResult()<CR>
imap <C-b> <ESC>:call RunResult()<CR>
vmap <C-b> <ESC>:call RunResult()<CR>
