"--格式化--"
let g:neoformat_tex_latexindent = {
            \ 'exe': 'latexindent',
            \ 'args': ['-l'],
            \ 'stdin': 1
            \ }
nmap ff :Neoformat<CR>
