
set encoding=utf-8
"for f in split(glob('~/AppData/Local/nvim/container/plugin/*.vim'), '\n')
    "exe 'source' f
"endfor

" 基本配置
if &compatible
    " 不要兼容vi
    set nocompatible
endif

syntax enable
syntax on
"--------------------设置编码----------------" {{{
set encoding=utf-8             " Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)
set fileencodings=utf-8,cp936,gb2123,latin1
source $VIMRUNTIME/delmenu.vim " 解决菜单乱码
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8  " 解决consle输出乱码}}}

                               " --vim自身设置--"
set novb                       " 取消响铃
set vb t_vb="<Esc>|0f"
au GuiEnter * set t_vb=
set backspace=2                " 启用退格
set nobackup                   " 备份与缓存
set nowritebackup
set noundofile
set noswapfile
set autoread                   " 文件在外部被修改过，重新读入
set autowrite                  " 自动写回
set confirm                    " 显示确认对话框
set noshowmode                 " 模式
set shortmess+=c
set sessionoptions+=globals
                               " set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽,space:· " 设置空白字符的视觉提示
set list
" 只有set list下面的才会起作用
if &list
    set listchars=tab:\|\→·,nbsp:⣿,extends:»,precedes:«
    set listchars+=eol:¬
    set listchars+=trail:·
    " set listchars+=space:␣
endif

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
set lazyredraw     " 延迟绘制，提升性能
"set colorcolumn=81
"set textwidth=80
"set fo+=mB

if has("autocmd")         " 跳转到上次打开的位置
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" |
endif
set wrap                  " 自动折行
set wildmenu              " 智能补全命令行
                          " autocmd FileType json syntax match Comment +\/\/.\+$+
filetype on
filetype indent on        " 针对不同的文件类型采用不同的缩进格式
filetype plugin on        " 针对不同的文件类型加载对应的插件
filetype plugin indent on
" if has('win32') || has('win64')
" let g:clipboard = {
" \ 'name': 'win32yank',
" \ 'copy': {
" \ '+': 'win32yank.exe -i --crlf',
" \ '*': 'win32yank.exe -i --crlf',
" \ },
" \ 'paste': {
" \ '+': 'win32yank.exe -o --lf',
" \ '*': 'win32yank.exe -o --lf',
" \ },
" \ 'cache_enabled': 0,
" \ }
" endif
if has('clipboard')
    if has('unnamedplus') " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else                  " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif
set showcmd   " 状态栏显示目前所执行的指令
set laststatus=2 " 开启状态栏信息
set showtabline=2 " 开启tabline/bufferline
set cmdheight=1    " 命令行的高度
" set guifont=Consolas\ NF:h12 "gui字体"

"不显示工具/菜单栏
set guioptions-=T "工具栏
"set guioptions-=m "菜单栏
set guioptions-=L "左边滚动条
set guioptions-=r "右边滚动条
set guioptions-=b " 底部滚动条
set guioptions-=e " 使用内置 tab 样式而不是 gui


"set infercase                             " Adjust case in insert completion mode
set history=500                           " 历史命令
set splitbelow                            " 在下方分割


if (empty($TMUX))
	if (has("nvim"))
		"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	if (has("termguicolors"))
		set termguicolors
	endif
endif
"set clipboard=unnamedplus " 与系统共用剪切板在某些系统上可能会出现vim打开时间长的问题

if has('nvim') == 0 && has('patch-8.1.2020')
    set cursorlineopt=number cursorline
endif
if has('patch-8.1.1564')
    set signcolumn=yes
    " set signcolumn=number
else
    set signcolumn=yes
endif

" 定位到退出位置并移动到屏幕中央
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif | normal! zvzz
endif


" python3的可执行文件的位置"
if has('nvim')
    let g:python3_host_prog = "D:/Software/Python38-32/python.exe"
    else
    let g:python3_host_prog = expand('D:\Software\Python38-32\python.exe')
endif


