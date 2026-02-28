local plugin = { "folke/which-key.nvim", }
plugin.event = "VeryLazy"
plugin.opts = {
  preset = "helix"
}
plugin.keys = {
  {
    "<leader>?",
    function()
      require("which-key").show({ global = false })
    end,
    desc = "Buffer Local Keymaps (which-key)"
  }
}
return plugin
