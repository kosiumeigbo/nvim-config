return {
  "folke/tokyonight.nvim",
  lazy = false,
  enabled = true,
  priority = 1000,
  opts = {
    style = "storm",
    light_style = "night",
    styles = {
      keywords = {
        italic = false,
      }
    }
  },
  config = function (_, opts)
    require("tokyonight").setup(opts)
    vim.cmd[[colorscheme tokyonight-night]]
  end
}