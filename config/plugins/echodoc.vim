" Or, you could use neovim's floating text feature.
let g:echodoc#enable_at_startup = 1
if has('nvim')
    let g:echodoc#type = 'floating'
else
    let g:echodoc#type = 'popup'
endif
"To use a custom highlight for the float window,
" change Pmenu to your highlight group
highlight link EchoDocFloat Pmenu

"Or, you could use vim's popup window feature.
"let g:echodoc#enable_at_startup = 1
"let g:echodoc#type = 'popup'
"To use a custom highlight for the popup window,
"change Pmenu to your highlight group
"highlight link EchoDocPopup Pmenu
