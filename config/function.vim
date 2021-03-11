" ---编译、运行----"
func! RunResult()  " 先保存，再格式化，最后运行可执行文件
	exec "w"
	exec "Neoformat"
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
endfunc



    "profiles": {
    "        "defaults": {"
" Ctrl + b 一键保存、运行
map <C-b> :call RunResult()<CR>
imap <C-b> <ESC>:call RunResult()<CR>
vmap <C-b> <ESC>:call RunResult()<CR>
