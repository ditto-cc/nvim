require("mason").setup {}

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup {
  ensure_installed = { "lua_ls", "gopls", "cmake", "clangd" },
}

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  -- 禁用格式化功能，交给专门插件插件处理
  -- client.resolved_capabilities.document_formatting = false
  -- client.resolved_capabilities.document_range_formatting = false

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  require('keybindings').mapLSP(buf_set_keymap)

  -- 保存时自动格式化
  vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
end

local lsp_flags = { debounce_text_changes = 150, }
local root_pattern = require 'lspconfig.util'.root_pattern
-- gopls conf
require 'lspconfig'.gopls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

-- cmake conf
require 'lspconfig'.cmake.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  cmd = { "cmake-language-server", },
  filetypes = { "cmake", "CMakeLists.txt" },
  init_options = { buildDirectory = "build" },
  root_dir = root_pattern('CMakePresets.json', 'CTestConfig.cmake', '.git', 'build', 'cmake')
}

-- clangd conf
require 'lspconfig'.clangd.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

-- lua-ls conf
require 'lspconfig'.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        -- path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
    flags = lsp_flags,
  },
}
