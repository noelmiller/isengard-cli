-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- ignore annoying error
vim.g.lsp_zero_extend_lspconfig = 0
-- initialize lsp_zero
local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- Add language servers to mason and configure them with lsp_zero
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "ansiblels",
    "bashls",
    "cssls",
    "dockerls",
    "gopls",
    "jsonls",
    "pylsp",
    "tailwindcss",
    "yamlls",
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently
  }),
  sources = cmp.config.sources({
    -- Copilot Source
    { name = "copilot", group_index = 2 },
    -- Other Sources
    { name = "nvim_lsp", group_index = 2 },
    { name = "path", group_index = 2 },
    { name = "luasnip", group_index = 2 },
  }),
})

-- configure github copilot
require("copilot").setup({
  panel = {
    enabled = false,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>",
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4,
    },
  },
  suggestion = {
    enabled = false,
    auto_trigger = false,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = "node", -- Node.js version must be > 18.x
  server_opts_overrides = {},
})
