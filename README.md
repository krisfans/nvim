# Neovim配置

我的一nvim配置
my vimrc for nvim

## 目录结构
```
├── README.md
├── autoload
│   ├── function.vim
│   ├── initself.vim    # 核心
│   └── theme.vim       # 配色主题
├── coc-settings.json   # coc配置文件
├── core
│   ├── core.vim    # 核心
│   ├── dein.vim    # 插件管理
│   ├── event.vim   # 核心
│   ├── general.vim # vim的基本设置
│   ├── pmap.vim    # 插件快捷键
│   └── vmap.vim    # vim自带快捷键
├── fig
│   ├── compe.png
│   ├── config.png
│   ├── fuzzy.png
│   ├── lsp.png
│   └── program.png
├── ftdetect        # 文件后缀与语法高亮关联
│   ├── gnuplot.vim
│   └── perl.vim
├── gtags.conf
├── init.vim        # 入口
├── lua             # 某些lua插件配置
│   ├── line.lua
│   ├── lsp.lua
│   └── treesitter.lua
├── modules         # 模块和配置
│   ├── completion.toml
│   ├── enhance.toml
│   ├── languages.toml
│   ├── textobj.toml
│   └── ui.toml
├── plugin          # 自定义的插件
│   ├── difftools.vim
│   ├── hlsearch.vim
│   ├── nicefold.vim
│   └── whitespace.vim
└── snips           # 代码片段
    └── toml.snippets
```

## 文件加载顺序

[init.vim](./init.vim)->[core.vim](./core/core.vim)->[dein.vim](./core/dein.vim)
->[general.vim](./core/general.vim)->[event.vim](./core/event.vim)
->[pmap.vim](./core/pmap.vim)->[vmap.vim](./core/vmap.vim)

## 插件管理器

插件管理器是`dein`

## 主题

主题使用的`gruvbox`
开启界面是 `dashboard`
![dashboard](https://github.com/krisfans/nvim/blob/coc/fig/dashboard.png)

文件树用的`coc-explorer`
![program](https://github.com/krisfans/nvim/blob/coc/fig/filetree.png)

## 补全

使用`coc.nvim`补全
![complete](https://github.com/krisfans/nvim/blob/coc/fig/complete.png)

## 查找

使用`telescope`
![fuzzy](https://github.com/krisfans/nvim/blob/coc/fig/fuzzy.png)
