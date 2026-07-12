local plugin = {	"nvim-treesitter/nvim-treesitter" }
plugin.build = ":TSUpdate"
plugin.opts = {
  ensure_installed = { "lua", "c3"},
  ignore_install = {"org"},
  auto_install = true,
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
}
vim.filetype.add({
  extension = {
    c3 = "c3",
    c3i = "c3",
  },
})
return plugin
