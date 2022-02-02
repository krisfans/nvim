function! initself#source_file(root_path,path, ...)
    " Source user configuration files with set/global sensitivity
    let use_global = get(a:000, 0, ! has('vim_starting'))
    let abspath = resolve(a:root_path . '/' . a:path)
    if ! use_global
        execute 'source' fnameescape(abspath)
        return
    endif

    let tempfile = tempname()
    let content = map(readfile(abspath),
        \ "substitute(v:val, '^\\W*\\zsset\\ze\\W', 'setglobal', '')")
    try
        call writefile(content, tempfile)
        execute printf('source %s', fnameescape(tempfile))
    finally
        if filereadable(tempfile)
            call delete(tempfile)
        endif
    endtry
endfunction

" Credits: https://github.com/Shougo/shougo-s-github/blob/master/vim/rc/options.rc.vim#L147
" mkdir
function! initself#mkdir_as_necessary(dir, force) abort
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

