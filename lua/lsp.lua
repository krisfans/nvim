
-- require'lspconfig'.vimls.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.vimls.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] =vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        update_in_insert =false,
        virtual_text = {
            prefix = "➤"
        },
        signs = {
		      enable = true,
		      priority = 20
		    },
    }
    )
vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {
        text = "✗",
        -- texthl = "LspDiagnosticsSignError"
    }
    )
vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {
        text = "⚡",
        -- texthl = "LspDiagnosticsSignWarning"
    }
    )
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')



	-- Set some keybinds conditional on server capabilities
	--if client.resolved_capabilities.document_formatting then
	--buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	--elseif client.resolved_capabilities.document_range_formatting then
	--buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	--end

	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec([[
		hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
		hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
		hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
		augroup lsp_document_highlight
		autocmd! * <buffer>
		autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
		autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
		augroup END
		]], false)
	end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "clangd", "texlab", "pylsp","vimls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup { on_attach = on_attach }
end

local saga = require 'lspsaga'

saga.init_lsp_saga {

-- add your config value here
-- default value
-- use_saga_diagnostic_sign = true
	error_sign = '✗',
	warn_sign = '⚡',
	hint_sign = '●',
	infor_sign = '●',

}
