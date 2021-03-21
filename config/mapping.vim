
set encoding=utf-8
let mapleader=" "  "leader 快捷键


nmap << <<_
nmap >> >>_

nnoremap ! :!
augroup vime_keymap_group
    autocmd!
    " 使用esc退出终端
    if has('nvim')
        au TermOpen term://* tnoremap <buffer> <Esc> <c-\><c-n> " | startinsert
        " au BufEnter term://* startinsert
    else
        au TerminalOpen term://* tnoremap <buffer> <Esc> <C-\><C-n> " | startinsert
        " au BufEnter term://* startinsert
    endif
augroup END

" 新建终端
nnoremap <leader>tt :terminal<cr>

function! s:writeCurrent() abort
    if !&readonly && &buftype =~# '^\%(acwrite\)\=$' && expand('%') !=# ''
        silent write
    endif
endfunction

tnoremap kj <C-\><C-n>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 复制到末尾
nnoremap Y y$
nnoremap vv ^vg_

"if !common#functions#HasPlug('vim-airline') && !common#functions#HasPlug('vim-crystalline')
    "nnoremap  <M-l> :call common#functions#MoveTabOrBuf(1)<cr>
    "nnoremap  <M-h> :call common#functions#MoveTabOrBuf(0)<CR>
    "tnoremap  <M-l> <c-\><c-n>:call common#functions#MoveTabOrBuf(1)<cr>
    "tnoremap  <M-h> <c-\><c-n>:call common#functions#MoveTabOrBuf(0)<CR>
"endif
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <M-L> :tabmove +1<cr>
nnoremap <silent> <M-H> :tabmove -1<cr>
tnoremap <silent> <M-L> <c-\><c-n>:tabmove +1<cr>
tnoremap <silent> <M-H> <c-\><c-n>:tabmove -1<cr>

" 使用系统应用打开当前buffer文件
noremap  <M-x> :call common#functions#OpenFileUsingSystemApp(expand('%:p'))<cr>

nmap m :messages<cr>
nmap R :source $MYVIMRC<cr>
nmap s <nop>
nmap <space>p a<space><ESC>p
nnoremap ;a ggVG
nmap <space>v :tabe $MYVIMRC<CR>
nmap fp :let @+=expand('%')<cr>
nmap fe :set fileencoding=utf8<cr>
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>a
vmap <C-s> <ESC>:w<CR>
nmap <space>th :noh<cr>
nnoremap q :close<cr>
nnoremap Q :qa<cr>
"切换buff"
nmap <space>te :tabnew<cr>
nmap <space>tc :tabclose<cr>
nmap <space>bn :bn<cr>
" 删除当前缓冲区
nmap <space>bd :bdelete %<cr>
nnoremap wd :pwd<cr>
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X
command! -nargs=1 Rename let tpname = expand('%:t') | saveas <args> | edit <args> | call delete(expand(tpname))
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>
" 快速移动当前行
nnoremap [m  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]m  :<c-u>execute 'move +'. v:count1<cr>
" 快速添加空行
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
" 命令行移动
cnoremap <C-h> <Home>
cnoremap <C-l> <End>
" cnoremap <C-l> <Right>
" cnoremap <C-j> <Left>
" 使用 C-h/j/k/l 来切换窗口
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" 插入模式下的一些快捷键
inoremap <M-o> <esc>o
inoremap <M-O> <esc>O
" inoremap <M-h> <HOME>
inoremap <M-h> <esc>^i
inoremap <M-l> <END>
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

map <C-f5> :call CompileCode()<CR>
imap <C-f5> <ESC>:call CompileCode()<CR>
vmap <C-f5> <ESC>:call CompileCode()<CR>
" Ctrl + b 一键保存、运行
map <C-b> :call RunResult()<CR>
imap <C-b> <ESC>:call RunResult()<CR>
vmap <C-b> <ESC>:call RunResult()<CR>








