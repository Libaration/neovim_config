return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform will run multiple formatters sequentially
      python = { 'isort', 'black' },
      -- You can customize some of the format options for the filetype (:help conform.format)
      rust = { 'rustfmt', lsp_format = 'fallback' },
      -- Conform will run the first available formatter
      go = { 'goimports', 'golines' },
      javascript = { 'biome', 'prettierd', lsp_format = 'fallback', stop_after_first = true },
      typescript = { 'biome', 'prettierd', lsp_format = 'fallback', stop_after_first = true },
      typescriptreact = { 'biome', 'prettierd', lsp_format = 'fallback', stop_after_first = true },
      javascriptreact = { 'biome', 'prettierd', lsp_format = 'fallback', stop_after_first = true },
      html = { 'biome', 'prettierd', lsp_format = 'fallback', stop_after_first = true },
      css = { 'biome', 'prettierd', lsp_format = 'fallback', stop_after_first = true },
    },

    -- Set default options
    default_format_opts = {
      lsp_format = 'fallback',
    },
    -- Set up format-on-save
    -- format_on_save = { timeout_ms = 500 },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { '-i', '2' },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
