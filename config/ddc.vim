" call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources',
    \ ['nvim-lsp', 'vsnip', 'buffer', 'file'],
    \ )
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \   'ignoreCase': v:true,
    \   'isVolatile': v:true,
    \   'matchers': ['matcher_head'],
    \   'sorters': ['sorter_rank'],
    \   'converters': ['converter_remove_overlap'],
    \ },
    \ 'nvim-lsp': {
    \   'maxSize': 100,
    \   'mark': 'LSP',
    \   'minAutoCompleteLength': 1,
    \   'forceCompletionPattern': '\.\w*|:\w*|->\w*|\w*<'
    \ },
    \ 'around': {
    \   'mark': 'A',
    \ },
    \ 'buffer': {
    \   'mark': 'Buffer',
    \   'forceCollect': 1,
    \ },
    \ 'vsnip': {
    \   'mark': 'Vsnip',
    \   'dup': v:true
    \ },
    \ 'ultisnips': {
    \   'mark': 'US',
    \   'dup': v:true,
    \ },
    \ 'necovim': {'mark': 'Vim'},
    \ 'deoppet': {'mark': 'DP', 'dup': v:true},
    \ 'nextword': {
    \   'mark': 'nextword',
    \   'minAutoCompleteLength': 3,
    \   'isVolatile': v:true,
    \ },
    \ 'file': {
    \   'mark': 'F',
    \   'isVolatile': v:true,
    \   'minAutoCompleteLength': 100,
    \   'forceCompletionPattern': '[\./\\\\]'
    \ },
    \ })
call ddc#custom#patch_filetype(
    \ ['ps1', 'dosbatch', 'autohotkey', 'registry'], {
    \ 'sourceOptions': {
    \   'file': {
    \     'forceCompletionPattern': '\S\\\S*',
    \   },
    \ },
    \ 'sourceParams': {
    \   'file': {
    \     'mode': 'win32',
    \   },
    \ }})
" include @ for snippet
call ddc#custom#patch_filetype(
    \ ['tex'], 'keywordPattern', '[a-zA-Z0-9_@]*'
    \ )
call ddc#custom#patch_filetype(
    \ ['latex', 'tex'], {
    \ 'sourceOptions': {
    \   'nvim-lsp': {
    \     'forceCompletionPattern': '\S',
    \   },
    \ },
    \ })
call ddc#custom#patch_global('sourceParams',{
    \ 'file': {
    \   'displayFile': "File",
    \   'displayDir': "Dir",
    \   'displaySym': "Sym",
    \   'displayCwd': "",
    \   'displayBuf': "",
    \ }})
" Use neocovim
call ddc#custom#patch_filetype(
      \ ['vim', 'toml'], 'sources',  ['necovim', 'vsnip', 'buffer',  'file']  )
" Use Customized labels
call ddc#custom#patch_global('sourceParams', {
    \ 'nvim-lsp': { 'kindLabels': {
        \ 'Text': '',
        \ 'Method': '',
        \ 'Function': '',
        \ 'Constructor': '',
        \ 'Field': '',
        \ 'Variable': '',
        \ 'Class': 'ﴯ',
        \ 'Interface': '',
        \ 'Module': '',
        \ 'Property': 'ﰠ',
        \ 'Unit': '',
        \ 'Value': '',
        \ 'Enum': '',
        \ 'Keyword': '',
        \ 'Snippet': '',
        \ 'Color': '',
        \ 'File': '',
        \ 'Reference': '',
        \ 'Folder': '',
        \ 'EnumMember': '',
        \ 'Constant': '',
        \ 'Struct': '',
        \ 'Event': '',
        \ 'Operator': '',
        \ 'TypeParameter': '',
    \}},
    \})

" autocmd CompleteDone * silent! pclose!
" autocmd User PumCompleteDone call vsnip_integ#on_complete_done(g:pum#completed_item)
" Use ddc.
call ddc#enable()
