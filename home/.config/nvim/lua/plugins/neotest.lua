local plugin = {"nvim-neotest/neotest"}
plugin.dependencies = {
  {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "rcasia/neotest-java",
      ft="java",
      dependencies = {
        "mfussenegger/nvim-jdtls",
        "mfussenegger/nvim-dap",
      }
    }
  }
}
plugin.config = function ()
  require("neotest").setup({
    adapters = {
      require("neotest-java")
    }
  })
end
return plugin
