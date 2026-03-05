local plugin = {	"nvim-treesitter/nvim-treesitter" }
plugin.build = ":TSUpdate"
plugin.opts = {
  ensure_installed = { "lua", },
  ignore_install = {"org"},
  auto_install = true,
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
}
return plugin
