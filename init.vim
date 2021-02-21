"--插件--"
call plug#begin('$HOME/vimfiles/plugins') 
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs' " 自动补全
Plug 'Yggdroot/indentLine'

if has('nvim')
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'kristijanhusak/defx-icons'
else
    Plug 'Shougo/defx.nvim', {'on':':Defx `expand('%:p:h')` -search=`expand('%:p')`'}
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'https://gitee.com/krisfan_zhang/msgpack-python.git'
Plug 'yianwillis/vimcdoc'

Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
"Plug 'dense-analysis/ale'
Plug 'Shougo/neco-vim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'deoplete-plugins/deoplete-lsp'
Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
"Plug 'steelsojka/completion-buffers'
"Plug 'https://gitee.com/krisfan_zhang/ultisnips.git'

"Plug 'vim-airline/vim-airline' "状态栏
"Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'norcalli/nvim-colorizer.lua'
"Plug 'glepnir/spaceline.vim'
Plug 'ryanoasis/vim-devicons' 
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'lifepillar/vim-solarized8'

Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'octol/vim-cpp-enhanced-highlight',{ 'for':['c','cpp'] }
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-surround'
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/gnuplot-syntax-highlighting'
Plug 'elzr/vim-json'
call plug#end()
let g:plugged#enable_at_startup = 1 
"----"

"--vim自身设置--"
set novb         " 取消响铃
set vb t_vb="<Esc>|0f"
au GuiEnter * set t_vb=
set backspace=2  " 启用退格
set nocompatible " 设置不兼容VI
set nobackup     " 备份与缓存
set nowritebackup
set noundofile
set noswapfile

"set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽,space:· " 设置空白字符的视觉提示
set smartindent
set smarttab
set copyindent
set tabstop=4  softtabstop=4 shiftwidth=4 expandtab
set cindent        " 按照C语言的形式缩进
set smarttab
set copyindent
set hidden
set hlsearch       " 开启高亮显示结果
set incsearch      " 显示查找匹配过程
set cursorline     " 高亮显示当前
set ignorecase     " 设置默认进行大小写不敏感查找
set smartcase      " 如果有一个大写字母，则切换到大小写敏感查找
set showmatch      " 高亮显示匹配的括号
set number         " 显示行号
set relativenumber " 相对行号
set mouse=a        " 启用鼠标
"set list          " show the special character
"set colorcolumn=81
"set textwidth=80
"set fo+=mB

if has("autocmd") "跳转到上次打开的位置
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | 
endif
set wrap  "自动折行
set wildmenu " 智能补全命令行
set noshowmode 
"autocmd FileType json syntax match Comment +\/\/.\+$+
filetype on                 
filetype indent on        " 针对不同的文件类型采用不同的缩进格式
filetype plugin on        " 针对不同的文件类型加载对应的插件
filetype plugin indent on
set autoread              " 当文件在外部被修改，自动更新该文件
if has('clipboard')
    if has('unnamedplus') " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else                  " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif
                          " set clipboard+=unnamed  " Vim 的默认寄存器和系统剪贴板共享
let mapleader=" "         " leader 快捷键
nmap R :source $MYVIMRC<cr>
nmap s<nop>
nmap ;p o<ESC>p
nnoremap ;a ggVG
nmap <space>v :tabe $MYVIMRC<CR>
nmap fp :let @+=expand('%')<cr>
nmap fe :set fileencoding=utf8<cr>
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>a
vmap <C-s> <ESC>:w<CR>
nmap <space>w :w<cr>
nmap <C-c> :close<cr>
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
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
" 快速添加空行
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-n> <down>
cnoremap <C-p> <up>
" 使用 C-h/j/k/l 来切换窗口
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
set foldmethod=marker     "折叠方式为缩进，自动保存折叠
au BufWinLeave *.vim mkview
au BufWinEnter *.vim silent loadview
"set undofile                      " enable undo after close the file
"set undodir=$HOME/.vim/undo
"set undolevels=100
"set undoreload=1000
" python3的可执行文件的位置"
if has('nvim')
    let g:python3_host_prog = "D:/Software/Python38-32/python.exe"
endif
"----"

"--Gui--"{{{
let g:python_highlight_all=1
let g:vim_json_syntax_conceal = 0
syntax enable 
syntax on " 语法高亮
set background=dark       " for the light version
let g:one_allow_italics = 1 " I love italic for comments
"colorscheme solarized8_flat
colorscheme one
" 标签页
set showtabline=2            " 总是显示标签栏
set laststatus=2             " 开启状态栏信息
set showcmd                  " 状态栏显示目前所执行的指令
set cmdheight=1              " 命令行的高度
set guifont=Consolas\ NF:h12 " gui字体"
                             " 不显示工具/菜单栏
set guioptions-=T            " 工具栏
                             " set guioptions-=m " 菜单栏
set guioptions-=L            " 左边滚动条
set guioptions-=r            " 右边滚动条
set guioptions-=b            " 底部滚动条
set guioptions=e             " 使用内置 tab 样式而不是 gui "only show guitablabel
" abandoned的Buffer隐藏起来，这是vim的设置。
" 如果没有这个设置，修改过的文件需要保存了才能换buffer
" 这会影响全局重命名，因为Vim提示保存因此打断下一个文件的重命名。
set hidden
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'tabline': {'right':[['buffers']], 'left':[['tabs']] },
            \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            \ 'subseparator': { 'left': '', 'right': '' },
            \ 'component_function': {
            \   'filetype': 'MyFiletype',
            \   'fileformat': 'MyFileformat',
            \ }
            \ }
"let g:lightline= {
            "\ 'statusline': 0,
            "\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            "\ 'subseparator': { 'left': '', 'right': '' },
            "\ 'tabline': {'right':[['buffers']], 'left':[['tabs']] },
            "\ }
function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
"let g:spaceline_seperate_style = 'arrow'
"let g:spaceline_colorscheme = 'one'
"let g:spaceline_lsp_executive = 'nvim_lsp'
"let g:airline_powerline_fonts = 1  "关于状态栏的配置
" 缺省自动匹配主题
"* enable/disable localsearch indicator integration >
"let g:airline#extensions#localsearch#enabled = 1
"let g:airline#extensions#tabline#enabled = 1  " Air-line 显示上面的buffer tab
"let g:airline#extensions#ale#enabled = 1 "ale
"let g:airline#extensions#languageclient#enabled = 1
"let g:airline#extensions#coc#enabled = 1 "coc
" 字数统计"
"let g:airline#extensions#wordcount#filetypes =   
            "\ ['all']
            "\ ['asciidoc', 'help', 'mail', 'markdown', 'org', 'plaintex', 'rst', 'tex', 'text'])
" Use ['all'] to enable for all filetypes.
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif
"}}}
"----"

"--设置编码--" {{{
" 编码设置
set encoding=utf-8
set fileencodings=utf-8,cp936,gb2123
set fileencoding=utf-8
source $VIMRUNTIME/delmenu.vim  "解决菜单乱码
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8  "解决consle输出乱码}}}
"--"
"% 当前完整的文件名
"%:h 文件名的头部，即文件目录.例如../path/test.c就会为../path
"%:t 文件名的尾部.例如../path/test.c就会为test.c
"%:r 无扩展名的文件名.例如../path/test就会成为test
"%:e 扩展名
"%    当前文件名
"%:h    文件名的头部.例如../path/test.c就会为../path
"%:t    文件名的尾部.例如../path/test.c就会为test.c
"%:r    无扩展名的文件名.例如../path/test就会成为test
"%:e    扩展名
"--格式化--"
let g:neoformat_tex_latexindent = {
            \ 'exe': 'latexindent',
            \ 'args': ['-l'],
            \ 'stdin': 1
            \ }
nmap ff :Neoformat<CR>
"----"

""--编译、运行--{{{
func! CompileC()       " 编译C源文件
    exec "w"
    exec "!clang -Wall %"
endfunc
func! CompileCpp()     " 编译C++源文件
    exec "w"
    exec "!clang++ -Wall %"
endfunc
func! Compilefortran() " 编译fortran源文件
    exec "w"
    exec "!gfortran -Wall %"
endfunc 
func! CompileTex()     " 编译fortran源文件
    exec "w"
    exec ":VimtexCompile"
endfunc 
func! RunLua()         " 运行Lua源文件
    exec "w"
    exec "!lua %"
endfunc
func! RunPerl()        " 运行Perl源文件
    exec "w"
    exec "!perl %"
endfunc
func! RunPython()      " 运行Python源文件
    exec "w"
    exec "!python %"
endfunc
func! CompileCode()    " 根据文件类型自动选择相应的编译函数
    exec "w"
    if &filetype == "c"
        exec "call CompileC()"
    elseif &filetype == "cpp"
        exec "call CompileCpp()"
    elseif &filetype == "fortran"
        exec "call Compilefortran()"    
    elseif &filetype == "tex"
        exec "call CompileTex()"
    elseif &filetype == "lua"
        exec "call RunLua()"
    elseif &filetype == "perl"
        exec "call RunPerl()"
    elseif &filetype == "python"
        exec "call RunPython()"
    endif
endfunc
func! RunResult()      " 先保存，再格式化，最后运行可执行文件
    exec "w"
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
        exec "Neoformat"
        exec "!start cmd /c \"python  %<.py & pause\""
    elseif &filetype == "markdown"
        exec "MarkdownPreview"
    elseif &filetype == "gnuplot"
        exec "!start cmd /c  \"gnuplot % & pause \""
        exec "!pause"
    endif
endfunc
" Ctrl + f5 一键保存、编译
map <C-f5> :call CompileCode()<CR>  
imap <C-f5> <ESC>:call CompileCode()<CR>
vmap <C-f5> <ESC>:call CompileCode()<CR>
" Ctrl + b 一键保存、运行
map <C-b> :call RunResult()<CR>    
imap <C-b> <ESC>:call RunResult()<CR>
vmap <C-b> <ESC>:call RunResult()<CR>
"}}}

"--neosnippets----"{{{
imap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<c-j>" : "\<tab>"
smap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

nmap <space>s :NeoSnippetEdit<cr>
"let g:neosnippet#enable_conceal_markers=0
let g:neosnippet#snippets_directory=['$HOME/vimfiles/plugged/neosnippet-snippets/neosnippets']
let g:neosnippet#enable_completed_snippet=1
let g:neosnippet#enable_complete_done = 1"}}}
""----"

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"--vimtex设置--"{{{
let g:tex_flavor  = 'latex'    
let g:vimtex_view_general_viewer = 'SumatraPDF'  "正向搜索 
let g:vimtex_view_general_options
            \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
            \ 'background' : 1,
            \ 'build_dir' : '',
            \ 'callback' : 1,
            \ 'continuous' : 0,
            \ 'executable' : 'latexmk',
            \ 'options' : [
            \   '-shell-escape',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \ }
let g:vimtex_compiler_latexmk_engines = {
            \ '_'                : '-xelatex',
            \ 'xelatex'          : '-xelatex',
            \ 'pdflatex'         : '-pdf',
            \ }
" 隐藏模式"
set conceallevel=0
let g:tex_conceal = ''
let g:vimtex_syntax_conceal_default = 0
nmap <space>k <plug>(vimtex-doc-package)
"----"}}}

"--defx文件树--"{{{
call defx#custom#option('_', {
            \ 'winwidth': 30,
            \ 'split': 'tab',
            \ 'direction': 'topleft',
            \ 'show_ignored_files': 1,
            \ 'buffer_name': '',
            \ 'toggle': 1,
            \ 'resume': 1
            \ })
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
                \ defx#do_action('open') 
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
                \ defx#do_action('open')
    nnoremap <silent><buffer><expr> o
                \ defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
                \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
                \ defx#do_action('toggle_columns',
                \                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
                \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
                \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
                \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> cd
                \ defx#do_action('change_vim_cwd')
endfunction
nmap <space>i :Defx -columns=icons:indent:filename:type<cr>
nmap <silent> <F10> :Defx `expand('%:p:h')` -search=`expand('%:p')`<cr>
nmap <silent> <space>ft :Defx <cr>
"----"}}}

"--ale--"{{{
 "Always show the signcolumn, otherwise it would shift the text each time
"let g:ale_sign_column_always = 1 
"keep the sign gutter open
"let g:ale_sign_column_always = 1
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = '⚡'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_lint_on_text_changed = 'always'
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1    " use quickfix list instead of the loclist 'pyls'
"let g:ale_linters = {
            "\   'c':['clang'],
            "\   'cpp': ['clang'],
            "\   'tex': ['chktex', 'lacheck'],
            "\   'python': ['flake8', 'yapf'],
            "\ }
""let g:ale_echo_msg_error_str = 'E'
""let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_python_flake8_options = '--ignore=E501,W291,E2'
"let g:ale_c_clang_options = '-Wall -O2 -std=c99'
"nmap <space>ep <Plug>(ale_previous_wrap)
"nmap <space>en <Plug>(ale_next_wrap)
""<space>d查看错误或警告的详细信息
"nmap <space>ed :ALEDetail<CR>  
""----"}}}

" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 550)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)
let g:neomake_c_enabled_makers=['clang']
"let g:neomake_python_enabled_makers=['flake8', 'yapf']
let g:neomake_c_clang_args = '-Wall -O2 -std=c99 '
let g:neomake_error_sign = {
         \ 'text': '✗',
         \ 'texthl': 'NeomakeErrorSign',
         \ }
     let g:neomake_warning_sign = {
         \   'text': '⚡',
         \   'texthl': 'NeomakeWarningSign',
         \ }
"let g:neomake_virtualtext_prefix = ''
hi NeomakeVirtualtextError ctermbg=234 ctermfg=5 guifg=#e06c75
"hi NeomakeVirtualtextWarning ctermbg=234 ctermfg=5 guifg=yellow guibg=Red
"--comment--"
nmap <space>/ <plug>NERDCommenterToggle
vmap <space>/ <plug>NERDCommenterToggle
"----"

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
"-----"
lua require'colorizer'.setup()
lua << EOF 
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs =false,
        -- delay update diagnostics
        update_in_insert = false,
      }
)
vim.lsp.handlers["textDocument/publishDiagnostics"] = false
require'lspconfig'.vimls.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.clangd.setup{  diagnostics=false}
 require'lspconfig'.pyls_ms.setup{
    cmd={ "dotnet", "exec", "D:/Software/Python38-32/python-language-server/output/bin/Debug/Microsoft.Python.languageServer.dll" }
 }
-- require'lspconfig'.jedi_language_server.setup{}
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Set autocommands conditional on server_capabilities
if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
    hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
    hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
    augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
end
end

EOF 
"autocmd BufEnter * lua require'completion'.on_attach()
set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set shortmess+=c " Avoid showing message extra message when using completion

"let g:completion_enable_snippet = 'Neosnippet'
"let g:completion_chain_complete_list = [
            "\{'complete_items': ['lsp', 'snippet', 'buffers']},
            "\]


nnoremap gD        <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gd        <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <C-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <space>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <space>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <space>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <space>D  <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <space>e  <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap [d        <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]d        <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <space>q  <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

"--deoplete设置--"
let g:deoplete#enable_at_startup = 1 " 自启动
call deoplete#custom#option({
            \ 'auto_complete_delay': 80,
            \ 'smart_case': v:true,
            \ 'sources': {'_':[]},
            \ })
let g:deoplete#lsp#handler_enabled=1

     "help vim.lsp.diagnostic.on_publish_diagnostics
