return {
  'sainnhe/everforest',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    vim.g.everforest_background = 'hard'
    vim.g.everforest_enable_italic = 1
    -- directly inside the plugin declaration.
    vim.g.everforest_enable_italic = true
  end
}
