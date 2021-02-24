if &laststatus < 2
	 "窗口一直有状态行
	set laststatus=2
	set showtabline=2
endif

let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'tabline': {'right':[['buffers']], 'left':[['tabs']] },
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
            \ },
            \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            \ 'subseparator': { 'left': '', 'right': '' },
            \ 'component_function': {
            \   'filetype': 'MyFiletype',
            \   'fileformat': 'MyFileformat',
            \ }
            \ }

