local plugin = {"folke/tokyonight.nvim"}
plugin.lazy=false
priority=1000
opts={}

function plugin.config ()
  vim.cmd.colorscheme("tokyonight-storm")
end

return plugin

