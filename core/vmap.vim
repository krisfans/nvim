
nnoremap < <<
nnoremap > >>
"Write buffer (save)
nnoremap <C-s> :<C-u>write<CR>
"yank to end
nnoremap y4 y$
nnoremap D4 :.,$d<cr>
nnoremap d4 d$
nnoremap <space>p a <esc>p
" Whitespace jump (see plugin/whitespace.vim)
nnoremap ]w :<C-u>WhitespaceNext<CR>
nnoremap [w :<C-u>WhitespacePrev<CR>
nnoremap <leader>a ggVG
nnoremap <C-s> :w<cr>
inoremap <C-s> <ESC>:w<cr>a
" insert keymap like emacs
inoremap <C-w> <C-[>diwa
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k>  <ESC>d$a
inoremap <C-u> <C-G>u<C-U>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <ESC>^i
inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"
"insert a newline
inoremap <C-O> <Esc>o
imap <C-S> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>
" 快速移动当前行
nnoremap [m  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]m  :<c-u>execute 'move +'. v:count1<cr>
" 快速添加空行
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
" command line alias
cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

tnoremap jk <C-\><C-n>

nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>


"switch window
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" settings for resize splitted window
nmap <C-w>] :vertical resize -3<CR>
nmap <C-w>[ :vertical resize +3<CR>

" Session management shortcuts (see plugin/sessions.vim)
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nmap <leader>v :tabe $MYVIMRC<cr>
nmap m :messages<cr>
nmap <leader>R :source $MYVIMRC<cr>
nmap s <nop>
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X
inoremap  jj <esc>o
inoremap  kk <esc>O

" Ctrl + b 一键保存、运行
map <C-b> :call function#RunResult()<CR>
imap <C-b> <ESC>:call function#RunResult()<CR>
vmap <C-b> <ESC>:call function#RunResult()<CR>

