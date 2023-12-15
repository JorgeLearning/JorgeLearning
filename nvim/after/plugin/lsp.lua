-- CONFIGURATION LSP.
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(
function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) --jumps to the definition
  vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts) --show information in a floating window 
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts) --show diagnostics in a floating window
  vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, opts) --move to the next diagnostic
  vim.keymap.set("n", "<leader>m", vim.diagnostic.goto_prev, opts) --move to the previous diagnostic
  vim.keymap.set("n", "<leader>vrc", vim.lsp.buf.code_action, opts) --select an action available from lsp
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts) --Lists the references in the quickfix window
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts ) --rename all references
  vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts) --show documentation in a floating window
end
)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
	  'lua_ls',
    'clangd',
    'jdtls',
    'cssls',
    'html',
  },
  handlers = {
    lsp_zero.default_setup,
	  -- jdtls = lsp_zero.noop,
  },
})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = "»",
})

-- CONFIGURATION AUTOCOMPLETION.
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer'},
    {name = 'path'},
    {name = 'nvim_lua'},
    {name = 'luasnip'},
  },

  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp_action.luasnip_supertab(),
    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
  }),

  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  -- Show source name in completion menu
  formatting = {
	  -- changing the order of fields so the icon is the first
	  fields = {'menu', 'abbr', 'kind'},
	  -- here is where the change happens 
	  format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '󰴠 ',
        nvim_lua = 'Π',
      }
      item.menu = menu_icon[entry.source.name]
      return item
    end,
  }
})

-- Configuration plugin nvim_lsp (Documentation).
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- require('lspconfig')['lua_ls'].setup {
    -- capabilities = capabilities,
-- }
-- require('lspconfig')['clangd'].setup {
  --  capabilities = capabilities,
-- }
-- require('lspconfig')['jdtls'].setup {
    -- capabilities = capabilities,
-- }

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = false,
  underline = true,
  update_in_insert = false,
  float = {
    source = "always", -- Or "if_many"
  }
})
