return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mason-org/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("dap-go").setup()
      require("dapui").setup()

      -- Automatically open/close DAP UI
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

      -- Keymaps
      -- vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      -- vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Start/Continue" })
      -- vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
      -- vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Step Over" })
      -- vim.keymap.set("n", "<leader>dt", function()
      --   require("dap-go").debug_test()
      -- end, { desc = "Debug: Test" })
    end,
  },
}
