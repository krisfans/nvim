augroup common "{{{
    autocmd!
    " Reload vim config automatically
    autocmd BufWritePost $VIM_PATH/{*.vim,*.yaml,vimrc} nested
                \ source $MYVIMRC | redraw

    " Reload Vim script automatically if setlocal autoread
    autocmd BufWritePost,FileWritePost *.vim nested
                \ if &l:autoread > 0 | source <afile> |
                \   echo 'source ' . bufname('%') |
                \ endif

    " Update filetype on save if empty
    autocmd BufWritePost * nested
                \ if &l:filetype ==# '' || exists('b:ftdetect')
                \ |   unlet! b:ftdetect
                \ |   filetype detect
                \ | endif

    " Highlight current line only on focused window
    autocmd WinEnter,InsertLeave * if &ft !~# '^\(denite\|clap_\)' |
                \ set cursorline | endif

    autocmd WinLeave,InsertEnter * if &ft !~# '^\(denite\|clap_\)' |
                \ set nocursorline | endif

    " Automatically set read-only for files being edited elsewhere
    autocmd SwapExists * nested let v:swapchoice = 'o'

    " Equalize window dimensions when resizing vim window
    autocmd VimResized * tabdo wincmd =

    " Force write shada on leaving nvim
    autocmd VimLeave * if has('nvim') | wshada! | else | wviminfo! | endif

    " Check if file changed when its window is focus, more eager than 'autoread'
    autocmd FocusGained * checktime

    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

    autocmd Syntax * if line('$') > 5000 | syntax sync minlines=200 | endif

    " Make directory automatically.
    autocmd BufWritePre * call initself#mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)


    autocmd BufNewFile,BufRead coc-settings.json setlocal filetype=jsonc
    autocmd FileType json,jsonc syntax match Comment +\/\/.\+$+

    autocmd TextYankPost * silent!  lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
    " 替换尾随空格
    autocmd BufWritePre *  silent! :%substitute/\s\+$//e
    " 将文件格式设置为unix
    autocmd BufWritePre *  silent! :%substitute/\r$//
    autocmd BufWritePre *  :set expandtab
    autocmd BufWritePre *  :%retab!
augroup END "}}}
