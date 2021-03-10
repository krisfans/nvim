vim.o.termguicolors = true
vim.api.nvim_set_keymap('n', '<Space>z',
    ":<C-u>Tree -columns=mark:indent:git:icon:filename:size:time"..
    " -split=vertical -direction=topleft -winwidth=40 -listed `expand('%:p:h')`<CR>",
    {noremap=true, silent=true})
local custom = require 'tree/custom'
custom.option('_', {root_marker='[in]:'})
custom.column('filename', {
  root_marker_highlight='Ignore',
  max_width=60,
})
custom.column('time', {
  format="%d-%M-%Y",
})
custom.column('mark', {
  readonly_icon="X",
  selected_icon="*",
})
local tree = require('tree')
-- keymap(keys, action1, action2, ...)  action can be `vim action` or `tree action`
tree.keymap('cp', 'copy')
tree.keymap('m', 'move')
tree.keymap('p', 'paste')
tree.keymap('a', 'view')
tree.keymap('o', 'open_or_close_tree')
tree.keymap('R', 'open_tree_recursive')
tree.keymap('r', 'rename')
tree.keymap('x', 'execute_system')
tree.keymap('<CR>', 'drop')
tree.keymap('<C-l>', 'redraw')
tree.keymap('<C-g>', 'print')
tree.keymap('>', 'toggle_ignored_files')
tree.keymap('*', 'toggle_select_all')
tree.keymap('s', {'drop', 'split'}, 'quit')
tree.keymap('N', 'new_file')
tree.keymap('cd', {'cd', '.'})
tree.keymap('~', 'cd')
tree.keymap('<Tab>', 'toggle_select', 'j')  -- tree action and vim action
tree.keymap('\\', {'cd', vim.fn.getcwd})
tree.keymap('cD', {'call', function(context) print(vim.inspect(context)) end})
tree.keymap('l', 'open')
tree.keymap('yy', 'yank_path')
tree.keymap('D', 'debug')
tree.keymap('d', 'remove')
tree.keymap('E', {'open', 'vsplit'})
tree.keymap('h', {'cd', '..'})
tree.keymap('gk', {'goto', 'parent'})
