return {
  "folke/tokyonight.nvim",
  lazy = true,
  priority = 1000,
  opts = {
    style = "storm",
    light_style = "night"
  },
  config = function (_, opts)
    require("tokyonight").setup(opts)
  end
}