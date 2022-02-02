-- lsp 客服端
require'lspconfig'.texlab.setup{}
require'lspconfig'.clangd.setup{}
-- require'lspconfig'.pylsp.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.vimls.setup{}

-- lsp signs 错误标志
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
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
local signs = { Error = "✗", Warn = "⚡", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- lsp 启用
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

-- -- lsp  Go-to definition in a vsplit window
-- local function goto_definition(vsplit_cmd)
--   local util = vim.lsp.util
--   local log = require("vim.lsp.log")
--   local api = vim.api
--
--   -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
--   local handler = function(_, result, ctx)
--     if result == nil or vim.tbl_isempty(result) then
--       local _ = log.info() and log.info(ctx.method, "No location found")
--       return nil
--     end
--
--     if vsplit_cmd then
--       vim.cmd(vsplit_cmd)
--     end
--
--     if vim.tbl_islist(result) then
--       util.jump_to_location(result[1])
--
--       if #result > 1 then
--         util.set_qflist(util.locations_to_items(result))
--         api.nvim_command("copen")
--         api.nvim_command("wincmd p")
--       end
--     else
--       util.jump_to_location(result)
--     end
--   end
--
--   return handler
-- end
-- vim.lsp.handlers["textDocument/definition"] = goto_definition('vsplit')


local saga = require 'lspsaga'

saga.init_lsp_saga {

-- add your config value here
-- default value
use_saga_diagnostic_sign = true,
    error_sign = '✗',
    warn_sign = '⚡',
    hint_sign = '●',
    infor_sign = '●',

}
