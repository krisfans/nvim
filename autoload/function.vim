" ---编译、运行----
function! function#RunResult() abort " 先保存，再格式化，最后运行可执行文件
    exec "w"
    " exec "Neoformat"
    if has("win32")
        if  &filetype == "c"
            exec "!clang % -Wall -std=c99 -O2 -o %<.exe"
            exec "!start cmd /c  \"\"%<.exe\" & pause && del %:r.exe\""
        elseif &filetype == "cpp"
            exec "!clang++ % -Wall -std=c++11 -O2 -o %<.exe"
            exec "!start cmd /c  \"\"%<.exe\" & pause && del %:r.exe\""
        elseif &filetype == "tex"
            exec ":VimtexCompile"
        elseif &filetype == "fortran"
            exec "!gfortran % -Wall  -O2 -o %<.exe"
            exec "!start cmd /c  \"\"%<.exe\" & pause && del %r:.exe\""
        elseif &filetype == "lua"
            exec "!start cmd /c lua %<.lua & pause"
        elseif &filetype == "perl"
            exec "!start cmd /c perl %<.pl & pause"
        elseif &filetype == "python"
            exec "!start cmd /c \"python  %<.py & pause\""
        elseif &filetype == "markdown"
            exec "MarkdownPreview"
		elseif &filetype == "gnuplot"
			exec "!start cmd /c  \"gnuplot % & pause \""
			exec "!pause"
        endif
    else
    " echo expand('%:p:r')
        if &filetype == 'c'
            exec "!clang % -std=c99 -lm -O2 -o %<"
            exec "new +resize10 term:// time %:p:r && rm %:p:r"
            " exec "!rm %:p:r"
        elseif &filetype == 'cpp'
            exec "!clang++ -std=c++11 % -O2  -o %<"
            exec "new +resize10 term:// time %:p:r && rm %:p:r"
            " exec "!rm %:p:r"
        elseif &filetype == "fortran"
            exec "!gfortran % -Wall  -O2 -o %<"
            exec "new +resize10 term:// time %:p:r"
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
endfunction
