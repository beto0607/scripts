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
  end,
}
