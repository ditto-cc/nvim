
-- 基础配置项
require('basic')
-- 快捷键
require('keybindings')
-- 插件
require('plugins')
-- 主题
require('colorscheme')

-- 左侧文件管理
require('plugin-config.nvim-tree')
-- 顶部标签
require('plugin-config.bufferline')
-- 底部信息
require('plugin-config.lualine')
require('plugin-config.dashboard')
require('plugin-config.telescope')
require('plugin-config.project')
require('plugin-config.nvim-treesitter')
require('plugin-config.indent-blankline')

-- lsp
require('lsp.setup')
require('lsp.cmp')
require('lsp.ui')
