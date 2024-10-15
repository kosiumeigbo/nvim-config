return {
  'sharpchen/Eva-Theme.nvim',
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function ()
    vim.cmd('colo Eva-Dark')
  end
}