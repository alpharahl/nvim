return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'mxsdev/nvim-dap-vscode-js',
  },
  config = function()
    local dap, dapui = require 'dap', require 'dapui'
    dapui.setup()
    require('mason').setup()
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    require('dap-vscode-js').setup {
      debugger_path = vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter',
      debugger_cmd = { 'js-debug-adapter' },
      adapters = {
        'pwa-node',
        'pwa-crhome',
        'pwa-msedge',
        'node-terminal',
        'pwa-extensionHost',
      },
    }

    for _, language in ipairs { 'typescript', 'javascript' } do
      dap.configurations[language] = {
        {
          request = 'launch',
          name = 'Deno launch',
          type = 'pwa-node',
          program = '${file}',
          cwd = '${workspaceFolder}',
          runtimeExecutable = vim.fn.getenv 'HOME' .. '/.deno/bin/deno',
          runtimeArgs = { 'run', '--inspect-brk' },
          attachSimplePort = 9229,
        },
        {
          request = 'launch',
          name = 'Deno test launch',
          type = 'pwa-node',
          program = '${file}',
          cwd = '${workspaceFolder}',
          runtimeExecutable = vim.fn.getenv 'HOME' .. '/.deno/bin/deno',
          runtimeArgs = { 'test', '--inspect-brk' },
          attachSimplePort = 9229,
        },
      }
    end

    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader>dc', dap.continue, {})
  end,
}
