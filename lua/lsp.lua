
require'lspconfig'.texlab.setup{}
require'lspconfig'.clangd.setup{}
-- require'lspconfig'.pylsp.setup{}
require'lspconfig'.pyright.setup{}
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
local servers = { "clangd", "texlab", "pyright","vimls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    },
}
Itkey_capabilities = capabilities
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {'tsserver'}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = Itkey_on_attach,
        capabilities = Itkey_capabilities,
    }
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
