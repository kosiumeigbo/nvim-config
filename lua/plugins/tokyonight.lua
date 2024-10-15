return {
  "folke/tokyonight.nvim",
  lazy = false,
  enabled = false,
  priority = 1000,
  opts = {
    style = "storm",
    light_style = "night"
  },
  config = function (_, opts)
    require("tokyonight").setup(opts)
    -- vim.cmd[[colorscheme tokyonight]]
  end
}