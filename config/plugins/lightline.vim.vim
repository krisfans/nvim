if &laststatus < 2
	 "窗口一直有状态行
	set laststatus=2
	set showtabline=2
endif


let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'tabline': {'right':[['close']], 'left':[['tabs']] },
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified']],
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'fileformat', 'fileencoding', 'filetype' ,'line'] ]
            \ },
            \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            \ 'subseparator': { 'left': '', 'right': '' },
            \ 'component_function': {
            \   'filetype': 'MyFiletype',
            \   'fileformat': 'MyFileformat',
            \ }
            \ }
let g:lightline.component = {
            \ 'mode': '%{lightline#mode()}',
            \ 'absolutepath': '%F',
            \ 'relativepath': '%f',
            \ 'filename': '%t',
            \ 'modified': '%M',
            \ 'bufnum': '%n',
            \ 'paste': '%{&paste?"PASTE":""}',
            \ 'readonly': '%R',
            \ 'charvalue': '%b',
            \ 'charvaluehex': '%B',
            \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
            \ 'fileformat': '%{&ff}',
            \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
            \ 'percent': '%3p%%',
            \ 'percentwin': '%P',
            \ 'spell': '%{&spell?&spelllang:""}',
            \ 'lineinfo': '%3l:%-2c',
            \ 'line': ' %3l/%L',
            \ 'column': '%c',
            \ 'close': '%999X X ',
            \ 'winnr': '%{winnr()}' }

