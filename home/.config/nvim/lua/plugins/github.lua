local plugin = {"pwntester/octo.nvim"}
plugin.dependencies = {
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-tree/nvim-web-devicons",
}
plugin.cmd = "Octo"
plugin.opts = {
  picker = "telescope",
  enable_builtin = true,
}
return plugin
