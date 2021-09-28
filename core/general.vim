if has('vim_starting')
    set encoding=utf-8
    scriptencoding utf-8
endif

"General settins{{{
set mouse=a                  " 命令模式禁用鼠标
set report=0                 " Don't report on line changes
set errorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " 文件格式
set magic                    " 正则查找
set synmaxcol=2500           " 不高亮语法高亮过长的行

" set autochdir " 自动设当前编辑的文件所在目录为当前工作路径,
" 这样defx无法工作

set tags=./.tags;,.tags      "tag
" set tags=./tags,./../tags,./*/tags
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = expand('~/.config/nvim/gtags.conf')

" What to save for views and sessions:
set viewoptions=folds,cursor,curdir,slash,unix
set sessionoptions=curdir,help,tabpages,winsize
" 剪切板
if executable('cmd.exe') && has('unix')
    " https://github.com/neovim/neovim/wiki/FAQ
    set clipboard+=unnamedplus
    let g:clipboard = {
                \   'name': 'win32yank-wsl',
                \   'copy': {
                \      '+': 'win32yank.exe -i --crlf',
                \      '*': 'win32yank.exe -i --crlf',
                \    },
                \   'paste': {
                \      '+': 'win32yank.exe -o --lf',
                \      '*': 'win32yank.exe -o --lf',
                \   },
                \   'cache_enabled': 0,
                \ }
else
    set clipboard=unnamed,unnamedplus
endif

" 命令行补全以增强模式运行 {{{
if has('wildmenu')
    if !has('nvim')
        set wildmode=list:longest
    endif

    if has('nvim')
        set wildoptions=pum
    else
        set nowildmenu
        set wildmode=list:longest,full
        set wildoptions=tagfile
    endif
    set wildignorecase
    set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
    set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
    set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
    set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
    set wildignore+=__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**
    set wildcharm=<C-z>  " substitue for 'wildchar' (<Tab>) in macros
endif


" " Vim Directories
" 备份，撤销
set nobackup
set nowritebackup noswapfile
set undofile
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/
" 历史记录
set history=1000
" 拼写检查
set spellfile=~/.cache/vim/spell/en.utf-8.add


" 缩进
set cc=80               " 高亮80列
set textwidth=80        " Text width maximum chars before wrapping
set smartindent
set smarttab
set copyindent
set tabstop=4  softtabstop=4 shiftwidth=4
set cindent             " 按照C语言的形式缩进
" 时间
set timeout ttimeout    " 按键超时 {{{
set updatetime=100      " Idle time to write swap and trigger CursorHold
set redrawtime=1500     " Time in milliseconds for stopping display redraw


" 查找 {{{
set ignorecase    " 忽略大小写
set smartcase     " Keep case when searching with *
set infercase     " Adjust case in insert completion mode
set incsearch     " Incremental search
set wrapscan      " Searches wrap around the end of the file
set hlsearch      " Highlight search results


if exists('+inccommand')
    set inccommand=nosplit
endif
" 在wsl中很影响启动速度
if executable('rg')
    set grepformat=%f:%l:%m
    let &grepprg = 'rg --vimgrep' . (&smartcase ? ' --smart-case' : '')
elseif executable('ag')
    set grepformat=%f:%l:%m
    let &grepprg = 'ag --vimgrep' . (&smartcase ? ' --smart-case' : '')
endif


" Behavior {{{
set autoread                    " Auto readfile
set wrap                        " 折行显示
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \ ;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,vsplit    " Jump to the first open window
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore whitespace

set completeopt=menu,menuone,noinsert,noselect    " Always show menu, even for one item
set complete=.,w,b,k  " C-n completion: Scan buffers, windows and dictionary
if exists('+completepopup')
    set completeopt+=popup
    set completepopup=height:4,width:60,highlight:InfoPopup
endif

if has('patch-8.1.0360') || has('nvim-0.4')
    set diffopt+=internal,algorithm:patience
endif
" }}}

" Editor UI {{{
set termguicolors      " 启用真色
set number             " 显示行号
set relativenumber     " 显示相对行号
set laststatus=2       " 显示 status line
set showtabline=2      " 显示 tabs line
set showmode           " 不在底部显示模式
set showcmd            " Show command in status line
set cmdheight=1        " Height of the command line
set cmdwinheight=5     " Command-line lines
set noruler            " 禁用默认的ruler
set shortmess=aFc      " 短
set fillchars+=vert:\| " add a bar for vertical splits
set fcs=eob:\          " 隐藏 ~ tila
set list               " 字符
set listchars=tab:\|\→·,nbsp:⣿,extends:»,precedes:«
set listchars+=eol:¬
set listchars+=trail:·
set title


set showmatch           " Jump to matching bracket
set matchpairs+=<:>     " Add HTML brackets to pair matching
set matchtime=1         " Tenths of a second to show the matching paren

" set winwidth=30       " Minimum width for active window
" set winminwidth=10    " Minimum width for inactive windows
set winheight=4         " Minimum height for active window
set winminheight=1  " Minimum height for inactive window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height
set noequalalways       " Don't resize windows on split or close
"set colorcolumn=+0     " Column highlight at textwidth's max character-limit

if has('folding') && has('vim_starting')
    set foldenable
    set foldmethod=indent
    set foldlevelstart=99
endif

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

if has('conceal') && v:version >= 703
    " For snippet_complete marker
    set conceallevel=2 concealcursor=niv
endif

if exists('+previewpopup')
    set previewpopup=height:10,width:60
endif


"  For Vim<8, replace EndOfBuffer by NonText
" " 背景透明
" autocmd vimenter * hi LineNr guibg=NONE ctermbg=NONE
" autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
" autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" " autocmd vimenter * hi VertSplit guibg=NONE ctermbg=NONE
" " autocmd vimenter * hi NonText guibg=NONE ctermbg=NONE
autocmd vimenter * hi SignColumn guibg=NONE ctermbg=NONE
" " }}}

" 定位到退出位置并移动到屏幕中央
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif | normal! zvzz
endif

let g:python3_host_prog = '/usr/bin/python3'


" viminfo 来定义如何保存会话（session）信息，
" 就是保存Vim的操作记录和状态信息，以用于重启Vim后能恢复之前的操作状态。
if has('nvim') && ! has('win32') && ! has('win64')
    set shada=!,'300,<50,@100,s10,h
else
    set viminfo='300,<10,@50,h,n$DATA_PATH/viminfo
endif

augroup user_persistent_undo
    autocmd!
    au BufWritePre /tmp/*          setlocal noundofile
    au BufWritePre COMMIT_EDITMSG  setlocal noundofile
    au BufWritePre MERGE_MSG       setlocal noundofile
    au BufWritePre *.tmp           setlocal noundofile
    au BufWritePre *.bak           setlocal noundofile
augroup END
" suod 设置, disable vim swap/backup/undo/shada/viminfo writing
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
            \ && $HOME !=# expand('~'.$USER)
            \ && $HOME ==# expand('~'.$SUDO_USER)

    set noswapfile
    set nobackup
    set noundofile
    if has('nvim')
        set shada="NONE"
    else
        set viminfo="NONE"
    endif
endif
" Secure sensitive information, disable backup files in temp directories
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
    set backupskip+=.vault.vim
endif
" Disable swap/undo/viminfo/shada files in temp directories or shm
augroup user_secure
    autocmd!
    silent! autocmd BufNewFile,BufReadPre
                \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
                \ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END
