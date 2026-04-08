return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",

  config = function()
    require("gitsigns").setup {
      current_line_blame = true,       -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',         -- 'eol' | 'overlay' | 'right_align'
        delay = 200,
        ignore_whitespace = true,
        virt_text_priority = 100,
      },
    }
    -- Fix: prevent gitsigns from attaching to virtual buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "minifiles", "snacks_dashboard" },
      callback = function()
        local gs = package.loaded.gitsigns
        if gs then
          gs.detach()
        end
      end,
    })
    require("scrollbar.handlers.gitsigns").setup()
  end,
}
