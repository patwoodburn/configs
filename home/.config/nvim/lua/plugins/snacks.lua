local plugin = {"folke/snacks.nvim"}
plugin.priority = 1000
plugin.lazy = false
plugin.opts = {
  bigfile = {enabled = true},
  quickfile = {enabled = true},
  terminal = {enabled = true},
  picker = {enabled = true},
  input = {enabled = true},
  indent = {enabled = true},
  statuscolumn = {enabled = true},
  notifier = {enabled = true, timeout = 3000},
  words = {enabled = true},
  dashboard = {
    enabled = true,
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
      { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
      { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
      {
        pane = 2,
        icon = " ",
        title = "Git Status",
        section = "terminal",
        enabled = function()
          return Snacks.git.get_root() ~= nil
        end,
        cmd = "git status --short --branch --renames",
        height = 5,
        padding = 1,
        ttl = 5 * 60,
        indent = 3,
      },
      { section = "startup" },
    },
  },
}

return plugin
