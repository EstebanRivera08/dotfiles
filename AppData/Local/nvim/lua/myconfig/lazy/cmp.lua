return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-omni", -- Add this for VimTeX
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
  },
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        --   -- ['<C-Space>'] = cmp.mapping.complete(),
        --   ['<CR>'] = cmp.mapping.confirm({ select = true }),
        --   -- ['<Tab>'] = cmp.mapping.select_next_item(),
        --   -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      },
      -- sources = cmp.config.source({
      sources = {
        { name = 'omni' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
      }
      -- )
    })
  end
}
