-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local lspconfig = require("lspconfig")
local lsp_capabilitites = require("cmp_nvim_lsp").default_capabilities()

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
    function(server)
      lspconfig[server].setup({
        capabilities = lsp_capabilities,
      })
    end,
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

require("peek").setup({
  auto_load = true,

  close_on_bdelete = true, -- close preview window on buffer delete

  syntax = true, -- enable syntax highlighting, affects performance

  theme = "dark", -- 'dark' or 'light'

  update_on_change = true,

  app = app = { 'flatpak run com.google.Chrome', '--new-window' }, -- 'webview', 'browser', string or a table of strings
  -- explained below

  filetype = { "markdown" }, -- list of filetypes to recognize as markdown

  -- relevant if update_on_change is true
  throttle_at = 200000, -- start throttling when file exceeds this
  -- amount of bytes in size
  throttle_time = "auto", -- minimum amount of time in milliseconds
  -- that has to pass before starting new render
})
