return {
  "mfussenegger/nvim-dap",
  config = function()
    -- load mason-nvim-dap here, after all adapters have been setup
    if LazyVim.has("mason-nvim-dap.nvim") then
      require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
    end

    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(LazyVim.config.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end

    -- setup dap config by VsCode launch.json file
    local vscode = require("dap.ext.vscode")
    local json = require("plenary.json")

    vscode.json_decode = function(str)
      return vim.json.decode(json.json_strip_comments(str))
    end

    -- Extends dap.configurations with entries read from .vscode/launch.json
    if vim.fn.filereadable(".vscode/launch.json") then
      vscode.load_launchjs()
    end

    local dap = require("dap")

    dap.adapters.coreclr = {
      type = "executable",
      command = "/home/beto0607/App/netcoredbg/netcoredbg",
      args = { "--interpreter=vscode" },
    }
    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        env = "ASPNETCORE_ENVIRONMENT=Development",
        args = {
          "/p:EnvironmentName=Development", -- this is a msbuild jk
          --  this is set via environment variable ASPNETCORE_ENVIRONMENT=Development
          "--environment=Development",
        },
        program = function()
          return vim.fn.input("Path to dll", vim.fn.getcwd(), "file")
        end,
      },
      {
        type = "coreclr",
        name = "attach - netcoredbg",
        request = "attach",
        -- env = "ASPNETCORE_ENVIRONMENT=Development",
        -- args = {
        --   "/p:EnvironmentName=Development", -- this is a msbuild jk
        --   --  this is set via environment variable ASPNETCORE_ENVIRONMENT=Development
        --   "--environment=Development",
        -- },
        processId = require("dap.utils").pick_process,
        -- attach = function()
        --   return vim.fn.input("Process ID", "")
        -- end,
      },
    }

    dap.adapters.delve = function(callback, config)
      if config.mode == "remote" and config.request == "attach" then
        callback({
          type = "server",
          host = config.host or "127.0.0.1",
          port = config.port or "38697",
        })
      else
        callback({
          type = "server",
          port = "${port}",
          executable = {
            command = "dlv",
            args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
            detached = vim.fn.has("win32") == 0,
          },
        })
      end
    end
    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "main.go",
      },
      {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}",
      },
      -- works with go.mod packages and sub packages
      {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
      },
    }
    dap.adapters.lldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "lldb",
        args = { "--port", "${port}" },
      },
    }
    -- setup a debugger config for zig projects
    dap.configurations.zig = {
      {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }
  end,
}
