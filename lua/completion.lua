-- -- 自动提示1 详情信息
-- local cmpFormat1 = function(entry, vim_item)
--   -- fancy icons and a name of kind
--   vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
--   -- set a name for each source
--   vim_item.menu =
--     ({
--     buffer = "[Buffer]",
--     path = "[Path]",
--     nvim_lsp = "[Lsp]",
--     vsinp = "[Vsnip]",
--     nvim_lua = "[Lua]",
--     cmp_tabnine = "[TabNine]",
--     look = "[Look]",
--     spell = "[Spell]",
--     emoji = "[Emoji]"
--   })[entry.source.name]
--   return vim_item
-- end
local lspkind = require('lspkind')
local cmp = require("cmp")
    cmp.setup({
    view = {
      entries = "custom" -- can be "custom", "wildmenu" or "native"
    },
    snippet = {
        expand = function(args)
           -- vim.fn["vsnip#anonymous"](args.body)
         require 'snippy'.expand_snippet(args.body)
    end,
    },
    formatting = {
      format = lspkind.cmp_format({
        with_text = true,
        menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
        })
      }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
        { name = "vsnip" },
        { name = 'snippy' }
    },
    mapping = {
        ["<S-TAB>"] = cmp.mapping.select_prev_item(),
        ["<TAB>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm()
    },
})

