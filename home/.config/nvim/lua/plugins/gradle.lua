return {
  "pandalec/gradle.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "akinsho/toggleterm.nvim",
  },
  config = function()
    require("gradle").setup({
      load_on_startup = true, -- optional
    })
  end,
}
