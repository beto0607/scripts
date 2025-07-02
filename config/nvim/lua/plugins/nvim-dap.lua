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

    local dap = require("dap")
    dap.set_log_level("TRACE") -- Set log level here
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        args = {
          -- "/path/to/js-debug/src/dapDebugServer.js",
          vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug/out/src/vsDebugServer.js"),
          "${port}",
        },
      },
    }

    for _, language in ipairs({ "typescript", "javascript" }) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to Node App",
          processId = require("dap.utils").pick_process,
          address = "localhost",
          port = 9229,
          restart = true,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
        },
        {
          type = "node",
          request = "attach",
          name = "Attach to Nx Fastify App",
          port = 9229, -- Ensure this matches the port Nx uses for inspect
          host = "127.0.0.1",
          sourceMaps = true,
          protocol = "inspector",
          -- cwd = vim.fn.getcwd(),
          cwd = "${workspaceFolder}/apps/server/dist",
          skipFiles = { "<node_internals>/**", "node_modules/**" },
          resolveSourceMapLocations = {
            -- "${workspaceFolder}/apps/server/dist/apps/server/src/**",
            -- -- "${workspaceFolder}/apps/server/dist/**",
            -- "${workspaceFolder}/apps/server/src/**",
            vim.fn.expand("${workspaceFolder}/apps/server/src/**"),
            vim.fn.expand("${workspaceFolder}/apps/server/dist/apps/server/src/**"),
            -- "!**/node_modules/**",
          },
        },
        {
          type = "pwa-chrome",
          request = "launch",
          name = "Launch & Debug Chrome",
          url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({
                prompt = "Enter URL: ",
                default = "http://localhost:3000",
              }, function(url)
                if url == nil or url == "" then
                  return
                else
                  coroutine.resume(co, url)
                end
              end)
            end)
          end,
          webRoot = vim.fn.getcwd(),
          protocol = "inspector",
          sourceMaps = true,
          userDataDir = false,
        },
      }
    end
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
  keys = {},
  dependencies = {
    -- Install the vscode-js-debug adapter
    {
      "microsoft/vscode-js-debug",
      -- After install, build it and rename the dist directory to out
      build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
      version = "1.*",
    },
    -- {
    --   "mxsdev/nvim-dap-vscode-js",
    --   config = function()
    --     ---@diagnostic disable-next-line: missing-fields
    --     require("dap-vscode-js").setup({
    --       -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    --       -- node_path = "node",
    --
    --       -- Path to vscode-js-debug installation.
    --       debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
    --
    --       -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
    --       -- debugger_cmd = { "js-debug-adapter" },
    --
    --       -- which adapters to register in nvim-dap
    --       adapters = {
    --         "chrome",
    --         "pwa-node",
    --         "pwa-chrome",
    --         "pwa-msedge",
    --         "pwa-extensionHost",
    --         "node-terminal",
    --       },
    --
    --       -- Path for file logging
    --       -- log_file_path = "(stdpath cache)/dap_vscode_js.log",
    --
    --       -- Logging level for output to file. Set to false to disable logging.
    --       -- log_file_level = false,
    --
    --       -- Logging level for output to console. Set to false to disable console output.
    --       -- log_console_level = vim.log.levels.ERROR,
    --     })
    --   end,
    -- },
  },
}
