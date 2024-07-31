return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>pf",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files()
        end,
      },
      {
        "<C-p>",
        function()
          local builtin = require("telescope.builtin")
          builtin.git_files({ show_untracked = true })
        end,
      },
      {
        "<leader>.",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({ cwd = vim.fn.expand("%:p:h") })
        end,
      },

      {
        "<leader>ps",
        function()
          local builtin = require("telescope.builtin")
          builtin.grep_string()
        end,
      },
      {
        "<leader>pg",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
      },
      {
        "<leader>gs",
        "<cmd>:top Git<CR>",
      },
      {
        "<leader>,",
        "$A,<Esc>",
      },
    },
    opts = {
      defaults = {
        mappings = {
          ["i"] = {
            ["<C-g>"] = function(prompt_bufnr)
              local action_set = require("telescope.actions.set")
              local action_state = require("telescope.actions.state")

              local picker = action_state.get_current_picker(prompt_bufnr)
              picker.get_selection_window = function(picker, entry)
                local window_picker = require("window-picker")
                local picked_window_id = window_picker.pick_window() or vim.api.nvim_get_current_win()
                -- Unbind after using so next instance of the picker acts normally
                picker.get_selection_window = nil
                return picked_window_id
              end

              return action_set.edit(prompt_bufnr, "edit")
            end,
          },
        },

        get_selection_window = function()
          return 0
        end,

        preview = {
          mime_hook = function(filepath, bufnr, opts)
            local is_image = function(filepath)
              local image_extensions = { "png", "jpg" } -- Supported image formats
              local split_path = vim.split(filepath:lower(), ".", { plain = true })
              local extension = split_path[#split_path]
              return vim.tbl_contains(image_extensions, extension)
            end
            if is_image(filepath) then
              local term = vim.api.nvim_open_term(bufnr, {})
              local function send_output(_, data, _)
                for _, d in ipairs(data) do
                  vim.api.nvim_chan_send(term, d .. "\r\n")
                end
              end
              vim.fn.jobstart({
                "catimg",
                filepath, -- Terminal image viewer command
              }, { on_stdout = send_output, stdout_buffered = true, pty = true })
            else
              require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
            end
          end,
        },
      },
      pickers = {
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
      },
    },
  },
}
