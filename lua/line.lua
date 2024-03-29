require'lualine'.setup {
    options = {
        icons_enabled = true,
        -- theme = 'gruvbox',
        -- theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {
        {
            'diagnostics',
            -- table of diagnostic sources, available sources:
            -- nvim_lsp, coc, ale, vim_lsp
            sources={'nvim_lsp', 'coc'},
            -- displays diagnostics from defined severity
            sections = {'error', 'warn', 'info', 'hint'},
            -- all colors are in format #rrggbb
            -- color_error = nil, -- changes diagnostic's error foreground color
            -- color_warn = nil, -- changes diagnostic's warn foreground color
            -- color_info = nil, -- Changes diagnostic's info foreground color
            -- color_hint = nil, -- Changes diagnostic's hint foreground color
            symbols = {error = '✗', warn = '⚡', info = '●', hint = '●'}
        }
    },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

