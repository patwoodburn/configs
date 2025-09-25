local plugin = {"mfussenegger/nvim-dap"}
plugin.dependencies = {
  {'thehamsta/nvim-dap-virtual-text',
    config=function ()
      require("nvim-dap-virtual-text").setup()
    end
  },
  {"igorlfs/nvim-dap-view"}
}
plugin.config = function()
  local dap = require("dap")
  dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = {"--interpreter=dap", "--eval-command", "set print pretty on"}
  }
  dap.configurations.c = {
    {
      name = "Launch",
      type = "gdb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      args = {}, -- provide arguments if needed
      cwd = "${workspaceFolder}",
      stopAtBeginningOfMainSubprogram = false,
    },
    {
      name = "Select and attach to process",
      type = "gdb",
      request = "attach",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      pid = function()
        local name = vim.fn.input('Executable name (filter): ')
        return require("dap.utils").pick_process({ filter = name })
      end,
      cwd = '${workspaceFolder}'
    },
    {
      name = 'Attach to gdbserver :1234',
      type = 'gdb',
      request = 'attach',
      target = 'localhost:1234',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}'
    }
  }
  local api = vim.api
  local keymap_restore = {}
  dap.listeners.after['event_initialized']['me'] = function()
    for _, buf in pairs(api.nvim_list_bufs()) do
      local keymaps = api.nvim_buf_get_keymap(buf, 'n')
      for _, keymap in pairs(keymaps) do
        if keymap.lhs == "K" then
          table.insert(keymap_restore, keymap)
          api.nvim_buf_del_keymap(buf, 'n', 'K')
        end
      end
    end
    api.nvim_set_keymap(
      'n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
  end

  dap.listeners.after['event_terminated']['me'] = function()
    for _, keymap in pairs(keymap_restore) do
      if keymap.rhs then
        api.nvim_buf_set_keymap(
          keymap.buffer,
          keymap.mode,
          keymap.lhs,
          keymap.rhs,
          { silent = keymap.silent == 1 }
        )
      elseif keymap.callback then
        vim.keymap.set(
        keymap.mode,
        keymap.lhs,
        keymap.callback,
        { buffer = keymap.buffer, silent = keymap.silent == 1 }
        )
      end
    end
    keymap_restore = {}
  end

end
return plugin
